import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/home/presentation/widgets/protocol_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredProtocol/featured_protocol_cubit.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';

class FeaturedProtocolsCarousel extends StatelessWidget {
  const FeaturedProtocolsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: Text(
            'Featured Protocols',
            style: AppTextStyles.heading2.copyWith(color: colors.onSurface),
          ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
        ),
        BlocBuilder<FeaturedProtocolCubit, FeaturedProtocolState>(
          builder: (context, state) {
            if (state is FeaturedProtocolLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: KLoadingWidget(),
              );
            } else if (state is FeaturedProtocolSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    state.protocols.length,
                    (index) => ProtocolCard(
                      model: state.protocols[index],
                      index: index,
                    ),
                  ),
                ),
              );
            } else if (state is FeaturedProtocolFailure) {
              return KErrorWidget(
                error: state.error,
                onRetry: () => context
                    .read<FeaturedProtocolCubit>()
                    .getFeaturedProtocols(),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
