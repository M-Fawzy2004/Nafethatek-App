import 'package:equatable/equatable.dart';

/// Base immutable state for the splash screen flow.
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the splash screen is first mounted.
class SplashInitial extends SplashState {
  const SplashInitial();
}

/// Active loading state emitting progress between 0.0 and 1.0.
class SplashLoading extends SplashState {
  final double progress;

  const SplashLoading({this.progress = 0.0});

  @override
  List<Object?> get props => [progress];
}

/// State reached when preloading completes and the action button appears.
class SplashReady extends SplashState {
  final bool showButton;

  const SplashReady({this.showButton = true});

  @override
  List<Object?> get props => [showButton];
}

/// State emitted when the user interacts with the action button.
/// Kept on the splash screen as requested without forcing navigation.
class SplashActionTriggered extends SplashState {
  final DateTime timestamp;

  SplashActionTriggered({DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [timestamp];
}
