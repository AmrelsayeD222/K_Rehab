
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/core/utils/app_validators.dart';
import 'package:k_rehab/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_button.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';

class SignupFormSection extends StatelessWidget {
  const SignupFormSection({super.key, required this.onSignupPressed});

  final VoidCallback onSignupPressed;

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthTextField(
          controller: registerCubit.nameController,
          hintText: 'Full Name',
          validator: AppValidators.validateName,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: registerCubit.emailController,
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          validator: AppValidators.validateEmail,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: registerCubit.passwordController,
          hintText: 'Password',
          isPassword: true,
          validator: AppValidators.validatePassword,
        ),
        const SizedBox(height: 32),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              KSnackBar.show(context, message: state.errorMessage);
            }
          },
          builder: (context, state) {
            return AuthButton(
              text: 'Sign Up',
              onPressed: onSignupPressed,
              isLoading: state is RegisterLoading,
            );
          },
        ),
      ],
    );
  }
}
