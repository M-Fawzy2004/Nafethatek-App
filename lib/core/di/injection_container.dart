import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../network/network_info.dart';
import '../network/supabase_client.dart';

/// Global service locator instance.
final GetIt sl = GetIt.instance;

/// Initializes all core and feature dependencies via GetIt.
Future<void> initDependencies() async {
  // ---------------------------------------------------------------------------
  // External & Core Network
  // ---------------------------------------------------------------------------
  // Initialize Supabase SDK
  await SupabaseClientService.init();

  // Register Supabase client singleton
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<SupabaseClientService>(() => SupabaseClientService());

  // Register NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => const NetworkInfoImpl());

  // ---------------------------------------------------------------------------
  // Features: Auth Module
  // ---------------------------------------------------------------------------
  _initAuthDependencies();

  // ---------------------------------------------------------------------------
  // Features: Home & Workshop Catalog Module
  // ---------------------------------------------------------------------------
  _initHomeDependencies();

  // ---------------------------------------------------------------------------
  // Features: Workshop Profile Module
  // ---------------------------------------------------------------------------
  _initWorkshopProfileDependencies();

  // ---------------------------------------------------------------------------
  // Features: Portfolio Module
  // ---------------------------------------------------------------------------
  _initPortfolioDependencies();
}

void _initAuthDependencies() {
  // Data Sources

  // Repositories

  // Use Cases

  // Blocs / Cubits
}

void _initHomeDependencies() {
  // Data Sources

  // Repositories

  // Use Cases

  // Blocs / Cubits
}

void _initWorkshopProfileDependencies() {
  // Data Sources

  // Repositories

  // Use Cases

  // Blocs / Cubits
}

void _initPortfolioDependencies() {
  // Data Sources

  // Repositories

  // Use Cases

  // Blocs / Cubits
}
