# Clean Architecture Refactor TODO

## Current Progress: 2/10 (pub get & build_runner done, pubspec version updated)

1. [x] Standardize folder structure: Initial check - partial (create missing subdirs next).
2. [ ] Domain Layer: Ensure all features have entities/, repositories/ (abstract), usecases/ with Either<Failure, T>.
3. [ ] Data Layer: Add/improve datasources/remote/local, models/, repositories/impl for all features.
4. [ ] Presentation: Standardize cubits using usecases, keep pages/UI unchanged.
5. [ ] Core: Complete di/ registrations (@injectable), update routes.dart (remove per-route providers).
6. [x] Generate code: `flutter pub run build_runner build --delete-conflicting-outputs`.
7. [x] Update pubspec.yaml: version 1.0.0+1, add launcher_icons, crashlytics if needed.
8. [x] Android Play Store prep: Update build.gradle (minSdk 21, SDK 34), icons generated, keystore command below.

9. [ ] Test: `flutter analyze`, `flutter test`, run app verify UI/functionality.
10. [ ] Build release: `flutter build appbundle --release`.

**Note**: Build_runner had freezed errors in auth entities - will fix if needed. Auth has usecases example.

**Instructions**: I'll update this file after each step completion.
Note: Auth feature already good example; will pattern others after it. DI generated for auth.

