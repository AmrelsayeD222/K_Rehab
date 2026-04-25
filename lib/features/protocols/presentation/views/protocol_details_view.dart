import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/theme/app_text_styles.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';
import 'package:k_rehab/features/protocols/data/models/protocol_model.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_details_cubit.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_tabs.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/details/protocol_details_content.dart';

class ProtocolDetailsView extends StatelessWidget {
  final ProtocolModel protocol;
  final String heroTag;

  const ProtocolDetailsView({
    super.key,
    required this.protocol,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProtocolDetailsCubit>()
        ..fetchProtocolDetails(protocol.id),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          title: Text(protocol.title, style: AppTextStyles.heading2),
          centerTitle: true,
        ),
        body: BlocBuilder<ProtocolDetailsCubit, ProtocolDetailsState>(
          builder: (context, state) {
            if (state is ProtocolDetailsLoading) {
              return const Center(child: KLoadingWidget());
            } else if (state is ProtocolDetailsFailure) {
              return KErrorWidget(
                error: state.error,
                onRetry: () => context
                    .read<ProtocolDetailsCubit>()
                    .fetchProtocolDetails(protocol.id),
              );
            } else if (state is ProtocolDetailsSuccess) {
              final details = state.details;
              final selectedTabIndex = state.selectedTabIndex;
              
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: heroTag,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              protocol.imagePath,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProtocolDetailsTabs(
                            phases: details.phases,
                            selectedIndex: selectedTabIndex,
                            onTabChanged: (index) {
                              context.read<ProtocolDetailsCubit>().changeTab(index);
                            },
                          ),
                          const SizedBox(height: 24),
                          ProtocolDetailsContent(
                            selectedTabIndex: selectedTabIndex,
                            details: details,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
