import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/core/utils/app_validators.dart';
import 'package:k_rehab/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_button.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';

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
          validator: AppValidators.validateEmail,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: loginCubit.passwordController,
          hintText: 'Password',
          isPassword: true,
          validator: AppValidators.validatePassword,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.bodyText2.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        const SizedBox(height: 32),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(AppRouter.mainView);
            } else if (state is LoginFailure) {
              KSnackBar.show(context, message: state.errorMessage);
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
