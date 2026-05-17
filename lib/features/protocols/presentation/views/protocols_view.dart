import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k_rehab/core/di/service_locator.dart';

import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/core/widgets/k_error_widget.dart';
import 'package:k_rehab/core/widgets/k_loading_widget.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_cubit.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_item.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocols_header.dart';
import 'package:go_router/go_router.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_cubit.dart';
import 'package:k_rehab/features/profile/presentation/manager/profile_state.dart';

class ProtocolsView extends StatelessWidget {
  const ProtocolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProtocolCubit>()..fetchProtocols(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ProtocolsHeader(),
                SizedBox(height: 32),
                Expanded(child: _ProtocolsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProtocolsList extends StatelessWidget {
  const _ProtocolsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProtocolCubit, ProtocolState>(
      builder: (context, state) {
        if (state is ProtocolLoading) {
          return const Center(child: KLoadingWidget());
        } else if (state is ProtocolSuccess) {
          return _buildList(context, state);
        } else if (state is ProtocolFailure) {
          return KErrorWidget(
              error: state.error,
              onRetry: () => context.read<ProtocolCubit>().fetchProtocols());
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(BuildContext context, ProtocolSuccess state) {
    if (state.protocols.isEmpty) {
      return Center(
        child: Text('No protocols available.', style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: state.protocols.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final protocol = state.protocols[index];
        return ProtocolCardItem(
          protocol: protocol,
          onTap: () {
            final profileState = context.read<ProfileCubit>().state;
            final isSubscribed = profileState is ProfileSuccess && profileState.user.isSubscribed;
            
            if (protocol.isFree || isSubscribed) {
              context.push(
                AppRouter.protocolDetails,
                extra: {'protocol': protocol, 'heroTag': protocol.id},
              );
            } else {
              context.push(AppRouter.paywall);
            }
          },
        )
            .animate()
            .fadeIn(
              duration: 70.ms,
              delay: Duration(milliseconds: 20 * index),
            )
            .slideY(begin: 0.15, curve: Curves.easeOutCubic);
      },
    );
  }
}
