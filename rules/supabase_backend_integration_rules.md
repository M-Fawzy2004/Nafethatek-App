# Supabase Backend Integration & Database Standards

## 1. Authentication & Security (RLS)

### Row Level Security (RLS) Mandate
- RLS must be activated on every public table: `ALTER TABLE table_name ENABLE ROW LEVEL SECURITY;`.
- Never disable RLS in production or bypass policies for convenience.

### Multi-Tenant & Role Isolation
- Use `auth.uid()` to identify the logged-in user.
- Workshop and admin data must enforce strict ownership:
  ```sql
  -- Workshops can only update their own profile
  CREATE POLICY "Workshops can update own profile"
  ON public.workshops
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

  -- Public users can read only active and approved workshops
  CREATE POLICY "Public read active workshops"
  ON public.workshops
  FOR SELECT
  TO anon, authenticated
  USING (is_active = true AND subscription_expires_at > NOW());
  ```

### Storage Bucket Policies
- Profile images and portfolio photos must reside in buckets configured with strict path-based policies:
  ```sql
  -- Allow workshop owners to upload only to their own directory: workshop_id/*
  CREATE POLICY "Workshop owners upload portfolio"
  ON storage.objects
  FOR INSERT
  TO authenticated
  WITH CHECK (bucket_id = 'portfolios' AND (storage.foldername(name))[1] = auth.uid()::text);
  ```

---

## 2. Table Design & Field Conventions

- **Identifiers:** Primary keys must use `UUID` defaulting to `gen_random_uuid()`.
- **Naming Conventions:** All tables, columns, and foreign keys must strictly follow `snake_case`.
- **Timestamps:** Every table must include `created_at TIMESTAMPTZ DEFAULT NOW()` and `updated_at TIMESTAMPTZ DEFAULT NOW()`.

### Core Schemas for Workshop SaaS & Directory

```sql
-- Workshops / Businesses Table
CREATE TABLE public.workshops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(32) NOT NULL,
    whatsapp VARCHAR(32),
    governorate VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address TEXT,
    materials_offered TEXT[] DEFAULT '{}', -- ARRAY['upvc', 'alumetal']
    is_active BOOLEAN NOT NULL DEFAULT false,
    subscription_expires_at TIMESTAMPTZ,
    rating NUMERIC(2, 1) DEFAULT 5.0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Portfolio Items Table
CREATE TABLE public.portfolio_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workshop_id UUID NOT NULL REFERENCES public.workshops(id) ON DELETE CASCADE,
    title VARCHAR(255),
    category VARCHAR(64) NOT NULL, -- 'windows', 'doors', 'kitchens', 'facades'
    image_url TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

---

## 3. Flutter Data Source Best Practices

1. **Singleton Client Access:** Access Supabase via `Supabase.instance.client` injected into datasources.
2. **Error Translation:**
   - Map `PostgrestException` to custom `ServerException(message, code)`.
   - Map `AuthException` to `AuthFailureException(message)`.
3. **Data Filtering:**
   - Filter queries on the database server, never in Dart memory:
   ```dart
   final response = await supabaseClient
       .from('workshops')
       .select('*, portfolio_items(*)')
       .eq('is_active', true)
       .gt('subscription_expires_at', DateTime.now().toIso8601String())
       .order('rating', ascending: false);
   ```
4. **Subscription Status Check:** In all administrative and operational queries, verify that `subscription_expires_at` is greater than `NOW()` before granting access to premium actions or directory visibility.