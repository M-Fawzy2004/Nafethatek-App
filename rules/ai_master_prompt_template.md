# AI Assistant Master Prompt Template

> **Usage Guide:** Copy the prompt block below and paste it into your AI assistant session (Cursor, Claude, Windsurf, ChatGPT, Copilot, etc.) whenever you start a new feature, bug fix, or refactoring task. Fill in the placeholders marked with `{{ ... }}`.

---

```markdown
# TASK DIRECTIVE & CONTEXT INGESTION

You are acting as an elite Flutter & Supabase Software Architect and Senior Engineer. 

Before generating any code, plans, or architectural changes, you MUST read, parse, and strictly adhere to the following project specification and rule files present in this repository:

1. `rules.md` (Project Umbrella, Non-Negotiable Directives & Quality Checklists)
2. `clean_architecture_rules.md` (Feature-First Architecture, Domain/Data/Presentation Boundaries, Failure Handling)
3. `supabase_backend_rules.md` (Database Schemas, RLS Policies, Remote Data Source Constraints, Multi-Tenancy)
4. `ui_localization_rules.md` (Easy Localization Key Enforcements, RTL-First Directionality, Design System Tokens)

---

## 1. Context & Task Summary
- **Target Feature / Module:** {{ e.g., Workshop Registration & Onboarding / Portfolio Manager / Workshop List Directory }}
- **Primary Goal:** {{ Brief 1-2 sentence description of what needs to be built or modified }}
- **Target Platform(s):** Flutter (Mobile: iOS / Android) & Supabase Backend

---

## 2. Specific Requirements & Acceptance Criteria
- [ ] {{ Criterion 1: e.g., Implement Workshop Remote Data Source to fetch active workshops by governorate }}
- [ ] {{ Criterion 2: e.g., Build Workshop Entity with Equatable and map from WorkshopModel }}
- [ ] {{ Criterion 3: e.g., Create WorkshopCubit with states: Initial, Loading, Success, Error }}
- [ ] {{ Criterion 4: e.g., Build responsive WorkshopCardWidget supporting Arabic RTL with easy_localization }}

---

## 3. Strict Architectural Enforcements
1. **No Framework Leaks:** The `domain` layer must remain 100% pure Dart. Never import Flutter SDK (`material.dart`, widgets) or Supabase client in domain entities or use cases.
2. **Error Translation:** Wrap all Supabase and network exceptions in the `data` layer and return typed `Failure` instances (`Either<Failure, T>` using `fpdart`).
3. **No Hardcoded Strings:** Every user-facing string must use `.tr()` with nested translation keys (e.g., `workshop.details.title.tr()`).
4. **RTL-First UI:** Use `EdgeInsetsDirectional` instead of `EdgeInsets.only(left/right)` and directional alignments.
5. **Security & State:** No raw database or Supabase calls inside widget `build()` methods. All calls must route through Cubits/Blocs and Use Cases.

---

## 4. Expected Files to Create or Update
- `lib/features/{{feature_name}}/domain/entities/{{entity_name}}.dart`
- `lib/features/{{feature_name}}/domain/repositories/{{repository_interface}}.dart`
- `lib/features/{{feature_name}}/domain/usecases/{{usecase_name}}.dart`
- `lib/features/{{feature_name}}/data/models/{{model_name}}.dart`
- `lib/features/{{feature_name}}/data/datasources/{{datasource_name}}.dart`
- `lib/features/{{feature_name}}/data/repositories/{{repository_impl}}.dart`
- `lib/features/{{feature_name}}/presentation/controllers/{{cubit_or_bloc}}.dart`
- `lib/features/{{feature_name}}/presentation/pages/{{page_name}}.dart`
- `lib/features/{{feature_name}}/presentation/widgets/{{widget_name}}.dart`
- `assets/translations/ar.json` & `assets/translations/en.json`

---

## 5. Output Format
- Provide clean, complete, production-grade Dart code for every file requested.
- Specify the exact relative file path at the top of each code block.
- Do NOT use ellipsis (`// ... rest of code`) inside business logic or state flows.
- Conclude with a brief checklist verifying compliance with `rules.md`.
```

---

## Quick Example: Populated Prompt Snippet

```markdown
# TASK DIRECTIVE & CONTEXT INGESTION
(Keep standard headers and rule file references)

## 1. Context & Task Summary
- Target Feature: Workshop Portfolio Gallery
- Primary Goal: Allow registered workshop owners to upload and delete installation photos to Supabase Storage and database.

## 2. Specific Requirements & Acceptance Criteria
- [ ] Fetch portfolio items categorized by type ('windows', 'doors', 'kitchens').
- [ ] Upload image to Supabase Storage bucket 'portfolios' under folder `workshop_id/`.
- [ ] Implement DeletePortfolioItemUseCase with optimistic UI updates.
- [ ] All status and button texts localized in Arabic and English.
```