import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/profile/presentation/manager/logout/log_out_cubit.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  static const Color _logoutColor = Color(0xFFFF4B4B);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          context.read<LogOutCubit>().logout();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: _logoutColor.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: _logoutColor, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LogOutCubit, LogOutState>(
              builder: (context, state) {
                if (state is LogOutLoading) {
                  return const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: _logoutColor,
                      strokeWidth: 2,
                    ),
                  );
                }
                return const Icon(
                  Icons.logout_rounded,
                  color: _logoutColor,
                  size: 20,
                );
              },
            ),
            const SizedBox(width: 10),
            Text(
              'Log Out',
              style: AppTextStyles.bodyText1.copyWith(
                color: _logoutColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
