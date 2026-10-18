import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/initialize_app_usecase.dart';
import 'splash_state.dart';

/// Cubit managing the lifecycle and transitions of the splash screen.
class SplashCubit extends Cubit<SplashState> {
  final InitializeAppUseCase initializeAppUseCase;
  Timer? _progressTimer;

  SplashCubit({required this.initializeAppUseCase}) : super(const SplashInitial());

  /// Begins loading and simulates smooth progression matching the visual loading bar.
  Future<void> startInitialization() async {
    _progressTimer?.cancel();
    emit(const SplashLoading(progress: 0.05));

    final result = await initializeAppUseCase(const NoParams());
    final totalDuration = result.fold(
      (_) => const Duration(milliseconds: 2400),
      (config) => config.animationDuration,
    );

    const steps = 40;
    final stepDuration = Duration(
      milliseconds: (totalDuration.inMilliseconds / steps).round(),
    );
    int currentStep = 0;

    _progressTimer = Timer.periodic(stepDuration, (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      currentStep++;
      final progress = (currentStep / steps).clamp(0.0, 1.0);
      emit(SplashLoading(progress: progress));

      if (currentStep >= steps) {
        timer.cancel();
        // Allow a brief settling moment before transitioning to the ready state
        Future.delayed(const Duration(milliseconds: 250), () {
          if (!isClosed) {
            emit(const SplashReady());
          }
        });
      }
    });
  }

  /// Triggered when the user taps the "ابدأ الآن" button.
  /// Per project requirements, this does not force navigation away,
  /// but provides a verified action trigger state.
  void onGetStartedPressed() {
    emit(SplashActionTriggered());
  }

  /// Restarts the splash flow for demonstration / replay purposes.
  void restart() {
    startInitialization();
  }

  @override
  Future<void> close() {
    _progressTimer?.cancel();
    return super.close();
  }
}
