import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/auth/logic/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_button.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: loginCubit.emailController,
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              (value == null || !value.contains('@')) ? 'Invalid email' : null,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: loginCubit.passwordController,
          hintText: 'Password',
          isPassword: true,
          validator: (value) =>
              (value == null || value.length < 6) ? 'Password too short' : null,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.bodyText2.copyWith(color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(height: 32),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(AppRouter.mainView);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return AuthButton(
              text: 'Login',
              isLoading: state is LoginLoading,
              onPressed: () {
                if (loginCubit.formKey.currentState!.validate()) {
                  loginCubit.login();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
