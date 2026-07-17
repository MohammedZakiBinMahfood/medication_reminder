# Features Directory Structure

Every domain feature added to this application must follow this strict Feature-First structure to ensure decoupled and maintainable code.

```
feature_name/
├── models/                     # Domain & UI Models (dart_mappable)
├── repositories/               # Abstract & Implementation Repositories
├── providers/                  # Riverpod Notifiers (State, CRUD, List)
└── presentation/               # UI Layer
    ├── screens/                # Full screen widgets
    └── widgets/                # Reusable feature-specific widgets
```

## Rules:
1. **Never directly access Isar Collections from UI.** Always use providers -> repositories -> data sources.
2. **Do not generate UUIDs in the feature.** Use the generic `UuidService`.
3. **Use generic constants and components.** Rely on `lib/core/` and `lib/shared/` whenever possible.
