import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubit = context.read<ProfileCubit>();
            if (state is ProfileLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is! ProfileSuccessState || cubit.userModel == null) {
              return Center(
                child: MainButton(
                  text: 'Retry',
                  onPressed: () => cubit.getProfile(),
                ),
              );
            }
            var user = cubit.userModel!.user;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            user?.name ?? '',
                            style: TextStyles.styleSize24(),
                          ),
                          Gap(10),
                          Text(
                            user?.email ?? '',
                            style: TextStyles.styleSize16(),
                          ),
                          Text(user?.phone ?? ''),
                          Text(user?.address ?? ''),
                        ],
                      ),
                    ),
                  ),
                  Gap(20),
                  MainButton(
                    text: 'Edit Profile',
                    onPressed: () {
                      // Show edit dialog or navigate to edit screen
                    },
                  ),
                  Gap(10),
                  MainButton(
                    text: 'Logout',
                    bgColor: AppColors.redColor,
                    onPressed: () {
                      cubit.logout();
                      context.go(Routes.login);
                    },
                  ),
                  Gap(20),
                  MainButton(
                    text: 'My Orders',
                    onPressed: () => context.push('/orders'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
