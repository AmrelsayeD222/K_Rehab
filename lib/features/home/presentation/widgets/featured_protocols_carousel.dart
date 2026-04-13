import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/features/home/presentation/widgets/protocol_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k_rehab/features/home/presentation/manager/featuredProtocol/featured_protocol_cubit.dart';
import 'package:k_rehab/core/di/service_locator.dart';

class FeaturedProtocolsCarousel extends StatelessWidget {
  const FeaturedProtocolsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FeaturedProtocolCubit>()..getFeaturedProtocols(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
            child: Text(
              'Featured Protocols',
              style: AppTextStyles.heading2,
            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            child: BlocBuilder<FeaturedProtocolCubit, FeaturedProtocolState>(
              builder: (context, state) {
                if (state is FeaturedProtocolLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FeaturedProtocolSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.protocols.length,
                    itemBuilder: (context, index) => ProtocolCard(
                      model: state.protocols[index],
                      index: index,
                    ),
                  );
                } else if (state is FeaturedProtocolFailure) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
