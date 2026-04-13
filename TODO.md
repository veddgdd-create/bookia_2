# Clean Architecture Refactor TODO

## Current Progress: Domain Layer Started (Step 1/10 complete)

**Domain Layer Detailed Steps (pattern after auth/):**
1. [x] Core: Added lib/core/usecases/no_params.dart.
2. [x] lib/features/home/domain/: entities (BestSellerEntity, SliderEntity freezed), HomeRepository abstract, GetBestSellersUseCase/GetSlidersUseCase.
3. [x] lib/features/orders/domain/: OrderEntity, OrdersRepository, GetOrdersUseCase.
4. [ ] lib/features/profile/domain/: UserEntity (reuse?), ProfileRepository, GetProfileUseCase/UpdateProfileUseCase.
5. [ ] lib/features/wishlist/domain/: WishlistEntity, WishlistRepository, Get/Add/Remove usecases.
6. [ ] lib/features/bookings/domain/: BookingEntity, BookingsRepository, Get/Create usecases.
7. [ ] lib/features/hotels/domain/: HotelEntity/RoomEntity, HotelsRepository, Search/GetDetails usecases.
8. [ ] Run `flutter pub run build_runner build --delete-conflicting-outputs`.
9. [ ] `flutter analyze` & test app.

**Original Steps Update:**
1. [x] Standardize folder structure.
2. [ ] Domain Layer (in progress ↑).
3. [ ] Data Layer...
[...rest unchanged]

**Note**: Focus domain first. Update after each feature.


