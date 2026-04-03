import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/models/auth_response/data.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  UserModel? userModel;

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var res = await ProfileRepo.getProfile();
    userModel = res as UserModel?;
    emit(ProfileSuccessState());
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    String? address,
  }) async {
    emit(ProfileLoadingState());
    var res = await ProfileRepo.updateProfile(
      name: name,
      email: email,
      phone: phone,
      address: address,
    );
    userModel = res as UserModel?;
    SharedPref.saveUserData(res as UserModel?);
    emit(ProfileSuccessState());
  }

  void logout() {
    SharedPref.saveUserData(null);
    // Call from UI with context.go(Routes.login)
  }
}
