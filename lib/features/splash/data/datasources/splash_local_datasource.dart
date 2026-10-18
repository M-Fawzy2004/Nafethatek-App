import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/splash_config.dart';

/// Contract for local splash configuration datasource.
abstract class SplashLocalDataSource {
  Future<SplashConfig> getSplashConfig();
}

/// Implementation of [SplashLocalDataSource] managing local app warmup settings.
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  const SplashLocalDataSourceImpl();

  @override
  Future<SplashConfig> getSplashConfig() async {
    try {
      // Return predefined initialization parameters.
      return const SplashConfig(
        animationDuration: Duration(milliseconds: 2400),
        showActionButton: true,
      );
    } catch (e) {
      throw CacheException('Failed to read splash configuration: $e');
    }
  }
}
