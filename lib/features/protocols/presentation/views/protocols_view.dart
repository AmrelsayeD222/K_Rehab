import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k_rehab/core/di/service_locator.dart';
import 'package:k_rehab/core/theme/app_colors.dart';
import 'package:k_rehab/core/router/app_router.dart';
import 'package:k_rehab/features/protocols/presentation/manager/protocol_cubit.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocol_card_item.dart';
import 'package:k_rehab/features/protocols/presentation/widgets/protocols_header.dart';
import 'package:go_router/go_router.dart';

class ProtocolsView extends StatelessWidget {
  const ProtocolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProtocolCubit>()..fetchProtocols(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProtocolsHeader(),
                const SizedBox(height: 32),
                const Expanded(child: _ProtocolsList()),
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
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is ProtocolSuccess) {
          return _buildList(context, state);
        } else if (state is ProtocolFailure) {
          return _buildError(context, state.error);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildList(BuildContext context, ProtocolSuccess state) {
    if (state.protocols.isEmpty) {
      return const Center(
        child: Text(
          'No protocols available.',
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
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
              onTap: () =>
                  context.push(AppRouter.protocolDetails, extra: protocol),
            )
            .animate()
            .fadeIn(
              duration: 200.ms,
              delay: Duration(milliseconds: 100 * index),
            )
            .slideY(begin: 0.15, curve: Curves.easeOutCubic);
      },
    );
  }

  Widget _buildError(BuildContext context, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.read<ProtocolCubit>().fetchProtocols(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
