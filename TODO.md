# Clean Architecture Refactor TODO for Bookia App

## Progress Tracking
**Current Status:** Dependencies added. Core files created (usecases, errors, di). Step 1 partial complete.

## Detailed Steps

1. **Core Infrastructure Setup** [PARTIAL - core files created, network_info, di_helper; build_runner ran (errors fixed next)]


   - Execute: flutter pub add injectable get_it equatable freezed_annotation
   - Execute: flutter pub add --dev injectable_generator build_runner freezed json_serializable
   - Create `lib/core/di/injection_container.dart`
   - Create `lib/core/error/failures.dart`
   - Create `lib/core/error/exceptions.dart`
   - Create `lib/core/network/network_info.dart`
   - Refactor `lib/core/services/dio/` to `lib/core/network/`
   - Create `lib/core/usecases/usecase.dart` (BaseUseCase)
   - Update `lib/main.dart` for DI.init()

2. **Build & Verify DI** [PENDING]
   - flutter pub get
   - flutter packages pub run build_runner build --delete-conflicting-outputs
   - Verify no errors

3. **Rename & Migrate Auth Feature** [PENDING]
   - Rename lib/feature/auth -> lib/features/auth
   - Domain: lib/features/auth/domain/entities/user_entity.dart (freezed)
   - Domain: lib/features/auth/domain/repositories/auth_repository.dart (abstract)
   - Domain: lib/features/auth/domain/usecases/login_usecase.dart, register_usecase.dart
   - Data: lib/features/auth/data/datasources/remote/auth_remote_datasource.dart
   - Data: lib/features/auth/data/models/user_model.dart (freezed DTO)
   - Data: lib/features/auth/data/repositories/auth_repository_impl.dart
   - Presentation: Update lib/features/auth/presentation/cubit/auth_cubit.dart (inject usecases)
   - Add @lazySingleton etc. in di/

4. **Test Auth** [PENDING]
   - flutter run
   - Test login/register

5. **Migrate Home Feature** [PENDING]
   - Similar structure for sliders, bestsellers, etc.
   - Handle cross-deps (wishlist, cart)

6. **Migrate Other Features** [PENDING]
   - cart, wishlist, orders, profile
   - splash, welcome, main (if data-heavy)

7. **Polish & Test** [PENDING]
   - Update all imports
   - Full analyze, tests
   - README update

**Notes:** Use dartz Either<Failure, Result>. Entities pure/immutable (freezed). Start small, test per feature. Update this file after each major step.

