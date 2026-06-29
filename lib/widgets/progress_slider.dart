import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Audio Progress Slider Widget
class ProgressSlider extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final ValueChanged<Duration> onPositionChanged;
  final bool isDark;

  const ProgressSlider({
    Key? key,
    required this.currentPosition,
    required this.duration,
    required this.onPositionChanged,
    required this.isDark,
  }) : super(key: key);

  @override
  State<ProgressSlider> createState() => _ProgressSliderState();
}

class _ProgressSliderState extends State<ProgressSlider> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _updateSliderValue();
  }

  @override
  void didUpdateWidget(ProgressSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSliderValue();
  }

  void _updateSliderValue() {
    if (widget.duration.inMilliseconds > 0) {
      _sliderValue = widget.currentPosition.inMilliseconds /
          widget.duration.inMilliseconds;
      _sliderValue = _sliderValue.clamp(0.0, 1.0);
    } else {
      _sliderValue = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Slider
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 8,
              elevation: 4,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 12,
            ),
            activeTrackColor: AppColors.emeraldGreen,
            inactiveTrackColor: AppColors.emeraldGreen.withOpacity(0.2),
            thumbColor: AppColors.emeraldGreen,
            overlayColor: AppColors.emeraldGreen.withOpacity(0.3),
          ),
          child: Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
              final newPosition = Duration(
                milliseconds: (value * widget.duration.inMilliseconds).toInt(),
              );
              widget.onPositionChanged(newPosition);
            },
          ),
        ),
        const SizedBox(height: 8),
        // Time Display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(widget.currentPosition),
                style: AppTypography.bodySmall.copyWith(
                  color: widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                _formatDuration(widget.duration - widget.currentPosition),
                style: AppTypography.bodySmall.copyWith(
                  color: widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
