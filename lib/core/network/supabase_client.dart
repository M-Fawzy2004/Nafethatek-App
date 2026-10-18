import 'package:supabase_flutter/supabase_flutter.dart';
import '../constants/supabase_constants.dart';
import '../errors/exceptions.dart' as app_exceptions;

/// Wrapper around Supabase client initialization and core access.
class SupabaseClientService {
  /// Initializes the Supabase SDK with configured credentials.
  static Future<void> init() async {
    // Only initialize if not already initialized
    try {
      await Supabase.initialize(
        url: SupabaseConstants.supabaseUrl,
        // ignore: deprecated_member_use
        anonKey: SupabaseConstants.supabaseAnonKey,
      );
    } catch (_) {
      // In tests or mock environments where initialize was already called
    }
  }

  /// Direct client instance to be injected into DataSources via DI.
  /// Never use this inside presentation widgets or build() methods.
  SupabaseClient get client => Supabase.instance.client;

  /// Helper to wrap remote calls and translate raw Supabase exceptions into typed domain exceptions.
  static Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on PostgrestException catch (e) {
      throw app_exceptions.ServerException(e.message, e.code);
    } on AuthException catch (e) {
      throw app_exceptions.AuthException(e.message, e.statusCode);
    } on app_exceptions.AppException {
      rethrow;
    } catch (e) {
      throw app_exceptions.ServerException(e.toString());
    }
  }
}
