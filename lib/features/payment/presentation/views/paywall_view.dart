import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/core/widgets/k_snack_bar.dart';
import 'package:k_rehab/features/payment/data/models/subscribtion_plan.dart';
import 'package:k_rehab/features/payment/presentation/manager/payment_cubit.dart';
import 'package:k_rehab/features/payment/presentation/manager/payment_state.dart';
import 'package:k_rehab/features/payment/presentation/widgets/benefit_item.dart';
import 'package:k_rehab/features/payment/presentation/widgets/plan_card.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';

class PaywallView extends StatefulWidget {
  final int fromTab;
  const PaywallView({super.key, this.fromTab = 0});

  @override
  State<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<PaywallView> {
  SubscriptionPlan _selectedPlan = SubscriptionPlan.yearly;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => getIt<PaymentCubit>(),
      child: BlocListener<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            KSnackBar.show(context,
                message: 'Subscription successful! Enjoy all features',
                isError: false);
            getIt<ProfileCubit>().getUserData();
            context.go('${AppRouter.mainView}?tab=${widget.fromTab}');
          } else if (state is PaymentFailureState) {
            KSnackBar.show(context, message: state.failure.errorMessage);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close_rounded),
            ),
            title: Text(
              'K-Rehab Premium',
              style: AppTextStyles.cardTitle.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            "Recover your health faster and smarter",
                            style: AppTextStyles.mainHeading.copyWith(
                              fontSize: 32,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const BenefitItem(
                              text:
                                  "Unlimited access to all recovery protocols"),
                          const BenefitItem(
                              text: 'AI coach to answer your questions'),
                          const BenefitItem(
                              text:
                                  'Advanced performance tracking and analytics'),
                          const BenefitItem(
                              text: 'No ads and seamless user experience'),
                          const SizedBox(height: 40),
                          PlanCard(
                            plan: SubscriptionPlan.yearly,
                            isSelected:
                                _selectedPlan == SubscriptionPlan.yearly,
                            onTap: () => setState(
                                () => _selectedPlan = SubscriptionPlan.yearly),
                          ),
                          PlanCard(
                            plan: SubscriptionPlan.monthly,
                            isSelected:
                                _selectedPlan == SubscriptionPlan.monthly,
                            onTap: () => setState(
                                () => _selectedPlan = SubscriptionPlan.monthly),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<PaymentCubit, PaymentState>(
                    builder: (context, state) {
                      final isLoading = state is PaymentLoading;
                      return ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                context
                                    .read<PaymentCubit>()
                                    .subscribe(_selectedPlan);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Subscribe Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
