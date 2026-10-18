# Flutter UI, Styling, and Easy Localization Rules

## 1. Easy Localization Setup & Directives

The application uses `easy_localization` for multilingual support (primarily Arabic `ar` as default and English `en`).

### Initialization Pattern
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}
```

### Strict Localization Rules for AI
1. **No Hardcoded User-Facing Strings:** Never return raw text strings like `Text("Login")` or `Text("تسجيل الدخول")`.
2. **Key Resolution:** Always use `.tr()` on translation keys:
   ```dart
   Text('common.save'.tr())
   Text('workshop.categories.windows'.tr())
   ```
3. **Parametric Translations:** Use named arguments for dynamic interpolations:
   ```json
   // assets/translations/ar.json
   {
     "orders": {
       "total_count": "إجمالي الطلبات: {count}"
     }
   }
   ```
   ```dart
   'orders.total_count'.tr(namedArgs: {'count': state.ordersCount.toString()})
   ```
4. **Nested JSON Organization:** Organize translation files logically into namespaces (`auth`, `common`, `workshop`, `calculator`, `errors`).

---

## 2. Right-to-Left (RTL) & UI Directionality

- **RTL-First Layouts:** Design primarily for Arabic RTL layouts.
- **Directional Edge Insets:**
  - Avoid hardcoded `EdgeInsets.left` or `EdgeInsets.right`.
  - Strictly use `EdgeInsetsDirectional.fromSTEB(...)` or `EdgeInsetsDirectional.only(start: ..., end: ...)`.
- **Directional Icons:** Always mirror directional icons (arrows, chevrons) or use widgets that handle directionality context automatically.

---

## 3. UI Component Architecture & Design System

### Design Tokens & Theming
- Centralize all colors, typography, paddings, and border radii in `lib/core/theme/`:
  - `AppColors`: Primary, Secondary, Background, Surface, Error, Neutral shades.
  - `AppTypography`: Text styles mapped directly to Flutter's `TextTheme`.
  - `AppDimensions`: Standard radii (`8.0`, `12.0`, `16.0`) and paddings.
- Do not instantiate inline colors like `Color(0xFF2563EB)` inside feature widgets.

### Responsive & Layout Practices
- Utilize `LayoutBuilder` or flexible widgets (`Expanded`, `Flexible`) instead of rigid constraints to support varied screen sizes.
- Handle keyboard overlays gracefully using `SingleChildScrollView` paired with `keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag`.
- Provide smooth loading skeletons or shimmer states for async loading screens instead of blank screens or simple spinners.

### Image Optimization
- All network images must implement cached handling (e.g., `cached_network_image`) with explicit error and placeholder builders:
  ```dart
  CachedNetworkImage(
    imageUrl: item.imageUrl,
    placeholder: (context, url) => const ShimmerPlaceholder(),
    errorWidget: (context, url, error) => const Icon(Icons.broken_image),
    fit: BoxFit.cover,
  );
  ```