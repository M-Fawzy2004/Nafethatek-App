# AI Agent Master Execution Rules (Project Umbrella)

These rules govern all autonomous code generation, refactoring, and file creation for this project.

## 1. Core Stack Profile
- **Framework:** Flutter (Latest Stable)
- **Language:** Dart with strict null safety enabled
- **Architecture:** Feature-First Clean Architecture (`clean_architecture_rules.md`)
- **Backend & Database:** Supabase (`supabase_backend_rules.md`)
- **State Management:** BLoC / Cubit
- **Localization:** `easy_localization` (`ui_localization_rules.md`)
- **Functional Tools:** `equatable`, `fpdart` (for `Either<Failure, T>`)

---

## 2. Global Agent Directives

### A. Non-Negotiable Rules
1. **Never Skip Error Handling:** All asynchronous operations must be wrapped in `try/catch` at the data layer and routed via typed `Failure` classes.
2. **No Monolithic Files:** Break widgets into reusable, dedicated sub-widgets if a single file exceeds 200 lines.
3. **No UI-Layer Database Calls:** Calling `Supabase.instance.client` from inside any widget or `build()` method is strictly rejected.
4. **Localization Enforcement:** Every string visible to the user must resolve through `.tr()` using `easy_localization`.
5. **RTL Compliance:** All paddings and alignments must use directional APIs (`start`/`end` instead of `left`/`right`).

### B. Response & Output Format
- When asked to create a feature, generate all three layers (Domain, Data, Presentation) in the correct relative directory paths.
- Write clean, production-grade Dart code with zero pseudo-code placeholders inside core business logic.
- Do not remove existing business logic during refactors unless explicitly instructed.

---

## 3. Quick Reference Checklist Before Outputting Code
- [ ] Are all entities immutable and extending `Equatable`?
- [ ] Is the domain layer completely free of Flutter imports?
- [ ] Does the remote datasource handle and map exceptions?
- [ ] Are user-facing strings referenced by localization keys?
- [ ] Are RTL paddings applied via `EdgeInsetsDirectional`?
- [ ] Are database operations protected by proper RLS consideration?