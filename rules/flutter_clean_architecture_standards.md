# Flutter Clean Architecture Guidelines & Rules

## 1. Architectural Layers & Boundaries

Strict separation of concerns must be maintained across all feature modules. The dependency rule dictates that inner layers must not know anything about outer layers:

```
Presentation ───► Domain ◄─── Data
```

### A. Domain Layer (Pure Dart)
- **Zero Framework Dependencies:** Strictly prohibited from importing Flutter SDK (`flutter/material.dart`, widgets, contexts) or external data packages (`http`, `supabase_flutter`, `shared_preferences`).
- **Entities:** Pure Dart data classes representing business models. Must use immutable fields (`final`) and value equality (e.g., `equatable`).
- **Repositories (Contracts):** Abstract interface definitions describing data operations (e.g., `abstract class WorkshopRepository`).
- **Use Cases:** Single-responsibility business actions. Each use case exposes a `call()` method:
  - Must return functional failure/success types (e.g., `fpdart` `Either<Failure, T>` or a custom `Result<T>`).
  - Example: `class GetNearbyWorkshopsUseCase { Future<Either<Failure, List<WorkshopEntity>>> call(Params params); }`

### B. Data Layer
- **Models:** Subclasses of domain entities or mappers. Contains serialization/deserialization logic (`fromJson`, `toJson`, `toEntity`, `fromEntity`).
- **Data Sources:** 
  - `RemoteDataSource`: Direct calls to Supabase, REST APIs, or third-party web services.
  - `LocalDataSource`: Cache, Secure Storage, or local databases.
- **Repository Implementations:** Concrete implementations of domain repository interfaces. Handles error mapping from raw exceptions to typed domain `Failure` objects (e.g., `ServerFailure`, `AuthFailure`, `NetworkFailure`).

### C. Presentation Layer
- **State Management:** BLoC / Cubit (or Riverpod/Signals). 
  - UI components must never instantiate or call repositories directly; all interactions must pass through Use Cases or dedicated Cubits/Blocs.
  - States must be immutable (`Initial`, `Loading`, `Success`, `Error`).
- **Pages vs Widgets:**
  - `Pages / Screens`: Scaffold-level screens responsible for dependency injection scoping and routing endpoints.
  - `Widgets`: Small, reusable atomic visual elements.

---

## 2. Directory Structure Conventions

Feature-first organization is mandatory. Every feature contains its own self-contained layers:

```
lib/
├── core/
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   ├── services/
│   ├── theme/
│   └── utils/
├── features/
│   ├── auth/
│   ├── workshop_catalog/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── workshop_remote_datasource.dart
│   │   │   │   └── workshop_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── workshop_model.dart
│   │   │   └── repositories/
│   │   │       └── workshop_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── workshop_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── workshop_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_nearby_workshops.dart
│   │   │       └── get_workshop_details.dart
│   │   └── presentation/
│   │       ├── controllers/ (bloc / cubit)
│   │       │   ├── workshop_cubit.dart
│   │       │   └── workshop_state.dart
│   │       ├── pages/
│   │       │   └── workshop_list_page.dart
│   │       └── widgets/
│   │           └── workshop_card.dart
│   └── workshop_dashboard/
└── main.dart
```

---

## 3. Mandatory Coding Constraints for AI Agents

1. **No Logic in Widgets:** `build()` methods must remain purely declarative. Formatting logic, calculations, and data mutations belong in use cases, models, or state managers.
2. **Immutable Objects:** Mark all entity, state, event, and failure classes with `@immutable` or extend `Equatable`.
3. **Explicit Error Handling:** Catch platform/library exceptions exclusively in the Data layer and wrap them inside domain `Failure` instances. Never leak raw SQL/Supabase exceptions to the Presentation layer.
4. **Dependency Injection:** Inject all use cases and repositories via constructors. Do not instantiate dependencies using hardcoded singletons within classes.