import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Playback Speed Selector Widget
class PlaybackSpeedSelector extends StatelessWidget {
  final List<double> speeds;
  final double currentSpeed;
  final ValueChanged<double> onSpeedChanged;
  final bool isDark;

  const PlaybackSpeedSelector({
    Key? key,
    required this.speeds,
    required this.currentSpeed,
    required this.onSpeedChanged,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Playback Speed',
              style: AppTypography.headlineSmall.copyWith(
                color: isDark
                    ? AppColors.darkText
                    : AppColors.lightText,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Speed buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: speeds.map((speed) {
                final isSelected = speed == currentSpeed;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _SpeedButton(
                    speed: speed,
                    isSelected: isSelected,
                    onTap: () => onSpeedChanged(speed),
                    isDark: isDark,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual Speed Button
class _SpeedButton extends StatelessWidget {
  final double speed;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _SpeedButton({
    required this.speed,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? AppColors.emeraldGreen
              : isDark
                  ? AppColors.darkSurface
                  : AppColors.lightSurface,
          border: Border.all(
            color: isSelected
                ? AppColors.emeraldGreen
                : AppColors.emeraldGreen.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Text(
          '${speed}x',
          style: AppTypography.labelLarge.copyWith(
            color: isSelected
                ? AppColors.white
                : AppColors.emeraldGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
