import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nafethatek_app/core/errors/failures.dart';
import 'package:nafethatek_app/features/splash/domain/entities/splash_config.dart';
import 'package:nafethatek_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:nafethatek_app/features/splash/domain/usecases/initialize_app_usecase.dart';
import 'package:nafethatek_app/features/splash/presentation/controllers/splash_cubit.dart';
import 'package:nafethatek_app/features/splash/presentation/controllers/splash_state.dart';

class MockFastSplashRepository implements SplashRepository {
  @override
  Future<Either<Failure, SplashConfig>> getSplashConfig() async {
    return const Right(
      SplashConfig(
        animationDuration: Duration(milliseconds: 100),
        showActionButton: true,
      ),
    );
  }
}

void main() {
  late SplashCubit cubit;
  late InitializeAppUseCase useCase;

  setUp(() {
    useCase = InitializeAppUseCase(MockFastSplashRepository());
    cubit = SplashCubit(initializeAppUseCase: useCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be SplashInitial', () {
    expect(cubit.state, equals(const SplashInitial()));
  });

  test('onGetStartedPressed should emit SplashActionTriggered', () {
    cubit.onGetStartedPressed();
    expect(cubit.state, isA<SplashActionTriggered>());
  });

  test('startInitialization progresses and eventually reaches SplashReady', () async {
    await cubit.startInitialization();
    // Wait for the fast timer and delay to finish
    await Future.delayed(const Duration(milliseconds: 450));
    expect(cubit.state, isA<SplashReady>());
  });
}
