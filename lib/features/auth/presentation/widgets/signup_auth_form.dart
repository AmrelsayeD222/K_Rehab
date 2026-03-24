import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/auth/logic/create_user/create_user_cubit.dart';
import 'package:k_rehab/features/auth/logic/register/register_cubit.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_button.dart';
import 'package:k_rehab/features/auth/presentation/widgets/auth_text_field.dart';

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
          validator: (value) =>
              (value == null || value.isEmpty) ? 'Name is required' : null,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: registerCubit.emailController,
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              (value == null || !value.contains('@')) ? 'Invalid email' : null,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: registerCubit.passwordController,
          hintText: 'Password',
          isPassword: true,
          validator: (value) =>
              (value == null || value.length < 6) ? 'Password too short' : null,
        ),
        const SizedBox(height: 32),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              log(state.errorMessage);
            } else if (state is RegisterSuccess) {
              context.read<CreateUserCubit>().createUser(state.userModel);
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
