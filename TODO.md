# API Error Handling with Clean Architecture - Implementation Steps

## Plan Overview
- Add dartz for Either<Failure, Success>
- Create core error models (Failures/Exceptions)
- Update DioProvider with interceptors
- Refactor all repos to use Either and throw Failures
- Update cubits to handle Either
- Test error scenarios

## TODO Steps
### 1. Update pubspec.yaml and install dependencies [PENDING]
### 2. Create core/errors/failures.dart and exceptions.dart ✅
### 3. Update lib/core/services/dio/dio_provider.dart with interceptors ✅
### 4. Refactor auth_repo.dart ✅
### 5. Refactor cart_repo.dart ✅
### 6. Refactor home_repo.dart ✅
### 7. Refactor wishlist_repo.dart ✅
### 8. Refactor profile_repo.dart ✅
### 9. Refactor orders_repo.dart ✅
### 10. Update all cubits and states to handle Either/Failure messages [PENDING]
### 11. Update UI for better error display [PENDING]
### 12. Test all features (success/error/offline cases) [PENDING]
### 13. Clean up and complete [PENDING]
