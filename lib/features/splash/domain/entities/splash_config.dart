import 'package:equatable/equatable.dart';

/// Pure Dart entity representing initialization configuration for the splash screen.
class SplashConfig extends Equatable {
  final Duration animationDuration;
  final bool showActionButton;

  const SplashConfig({
    this.animationDuration = const Duration(milliseconds: 2400),
    this.showActionButton = true,
  });

  @override
  List<Object?> get props => [animationDuration, showActionButton];
}
