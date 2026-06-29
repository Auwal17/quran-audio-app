import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Player Control Buttons Widget
class PlayerControls extends ConsumerWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onStop;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSkipBack;
  final VoidCallback onSkipForward;

  const PlayerControls({
    Key? key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onStop,
    required this.onPrevious,
    required this.onNext,
    required this.onSkipBack,
    required this.onSkipForward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Skip buttons row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SkipButton(
                label: '-10s',
                onTap: onSkipBack,
                isDark: isDark,
              ),
              _SkipButton(
                label: '+10s',
                onTap: onSkipForward,
                isDark: isDark,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Main controls row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Previous button
              _ControlButton(
                icon: Icons.skip_previous,
                onTap: onPrevious,
                isDark: isDark,
                size: 36,
              ),
              // Stop button
              _ControlButton(
                icon: Icons.stop_circle,
                onTap: onStop,
                isDark: isDark,
                size: 36,
              ),
              // Play/Pause button (large)
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.emeraldGreen,
                      AppColors.emeraldGreenDark,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.emeraldGreen.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPlayPause,
                    customBorder: const CircleBorder(),
                    child: Center(
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppColors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              // Stop button
              _ControlButton(
                icon: Icons.stop_circle,
                onTap: onStop,
                isDark: isDark,
                size: 36,
              ),
              // Next button
              _ControlButton(
                icon: Icons.skip_next,
                onTap: onNext,
                isDark: isDark,
                size: 36,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Individual Control Button
class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size + 8,
        height: size + 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? AppColors.darkSurface
              : AppColors.lightSurface,
          border: Border.all(
            color: AppColors.emeraldGreen.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.emeraldGreen,
            size: size,
          ),
        ),
      ),
    );
  }
}

/// Skip Button for ±10 seconds
class _SkipButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  const _SkipButton({
    required this.label,
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
          color: AppColors.emeraldGreen.withOpacity(0.1),
          border: Border.all(
            color: AppColors.emeraldGreen.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.emeraldGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
