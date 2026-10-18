/// Supabase backend table names, storage buckets, and configuration keys.
abstract class SupabaseConstants {
  // Config: Read from environment or fallback placeholders
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://placeholder.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'placeholder-anon-key',
  );

  // Database Tables
  static const String workshopsTable = 'workshops';
  static const String portfolioItemsTable = 'portfolio_items';

  // Storage Buckets
  static const String portfoliosBucket = 'portfolios';
  static const String avatarsBucket = 'avatars';
}
