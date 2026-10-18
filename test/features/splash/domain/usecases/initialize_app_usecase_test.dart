import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nafethatek_app/core/errors/failures.dart';
import 'package:nafethatek_app/core/usecases/usecase.dart';
import 'package:nafethatek_app/features/splash/domain/entities/splash_config.dart';
import 'package:nafethatek_app/features/splash/domain/repositories/splash_repository.dart';
import 'package:nafethatek_app/features/splash/domain/usecases/initialize_app_usecase.dart';

class MockSplashRepository implements SplashRepository {
  @override
  Future<Either<Failure, SplashConfig>> getSplashConfig() async {
    return const Right(SplashConfig());
  }
}

void main() {
  late InitializeAppUseCase useCase;
  late MockSplashRepository mockRepository;

  setUp(() {
    mockRepository = MockSplashRepository();
    useCase = InitializeAppUseCase(mockRepository);
  });

  test('should return default SplashConfig from the repository', () async {
    final result = await useCase(const NoParams());

    expect(result.isRight(), isTrue);
    result.match(
      (failure) => fail('Expected Right but got Left'),
      (config) {
        expect(config.showActionButton, isTrue);
        expect(config.animationDuration, equals(const Duration(milliseconds: 2400)));
      },
    );
  });
}
