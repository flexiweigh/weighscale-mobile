import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tone.dart';
import '../state/home_card_states.dart';
import 'app_card.dart';

class GetStartedCard extends StatelessWidget {
  const GetStartedCard({
    super.key,
    required this.state,
    this.onStepTap,
  });

  final GetStartedState state;
  final ValueChanged<GetStartedStepId>? onStepTap;

  @override
  Widget build(BuildContext context) {
    if (state.allDone) return const SizedBox.shrink();

    final currentId = state.currentStepId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Get started',
          trailingText: '${state.doneCount} of ${state.steps.length} done',
        ),
        const SizedBox(height: 8),
        AppCard(
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Column(
              children: [
                for (var i = 0; i < state.steps.length; i++) ...[
                  if (i > 0) const Divider(height: 1, color: AppColors.border),
                  _StepTile(
                    index: i + 1,
                    step: state.steps[i],
                    isCurrent: state.steps[i].id == currentId,
                    onTap: onStepTap == null
                        ? null
                        : () => onStepTap!(state.steps[i].id),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({
    required this.index,
    required this.step,
    required this.isCurrent,
    this.onTap,
  });

  final int index;
  final GetStartedStep step;
  final bool isCurrent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final blue = AppTone.blue.colors;
    return Material(
      color: isCurrent ? blue.background : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              _Indicator(index: index, done: step.done, isCurrent: isCurrent),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        decoration:
                        step.done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      step.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: isCurrent ? AppColors.primary : AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.index,
    required this.done,
    required this.isCurrent,
  });

  final int index;
  final bool done;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color border;
    final Widget child;

    if (done) {
      background = AppColors.success;
      border = AppColors.success;
      child = const Icon(Icons.check, size: 16, color: Colors.white);
    } else if (isCurrent) {
      background = AppColors.primary;
      border = AppColors.primary;
      child = Text(
        '$index',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      );
    } else {
      background = Colors.white;
      border = AppColors.border;
      child = Text(
        '$index',
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      );
    }

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: Border.all(color: border),
      ),
      child: child,
    );
  }
}