import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/providers/surah_provider.dart';
import '../../../core/providers/player_provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../widgets/player_controls.dart';
import '../../../widgets/progress_slider.dart';
import '../../../widgets/playback_speed_selector.dart';

/// Player Screen - Displays audio player for a Surah
class PlayerScreen extends ConsumerStatefulWidget {
  final String surahId;

  const PlayerScreen({
    Key? key,
    required this.surahId,
  }) : super(key: key);

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    final surahNumber = int.tryParse(widget.surahId) ?? 1;
    ref.read(playerStateProvider.notifier).setCurrentSurah(surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final surahNumber = int.tryParse(widget.surahId) ?? 1;
    final playerState = ref.watch(playerStateProvider);
    final currentSpeed = ref.watch(currentPlaybackSpeedProvider);
    final speeds = ref.watch(playbackSpeedsProvider);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Now Playing',
          style: AppTypography.headlineMedium.copyWith(color: textColor),
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ref.watch(surahByNumberProvider(surahNumber)).when(
        loading: () => Center(
          child: CircularProgressIndicator(
            color: AppColors.emeraldGreen,
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            'Error loading Surah',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.error,
            ),
          ),
        ),
        data: (surah) => surah == null
            ? Center(
                child: Text(
                  'Surah not found',
                  style: AppTypography.bodyMedium.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Artwork Placeholder
                    Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.all(24),
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
                            color: AppColors.emeraldGreen.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          surah.number.toString().padLeft(3, '0'),
                          style: AppTypography.arabicDisplayLarge.copyWith(
                            color: AppColors.white,
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                    // Surah Name (Arabic)
                    Text(
                      surah.arabicName,
                      style: AppTypography.arabicDisplayMedium.copyWith(
                        color: AppColors.emeraldGreen,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // Surah Name (English)
                    Text(
                      surah.englishName,
                      style: AppTypography.displayMedium.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Surah Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            surah.revelationType,
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${surah.verses} Verses',
                          style: AppTypography.labelSmall.copyWith(
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Teacher Name
                    Text(
                      'Recited by ${AppConstants.teacherName}',
                      style: AppTypography.bodyMedium.copyWith(
                        color: secondaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Progress Slider
                    ProgressSlider(
                      currentPosition: playerState.currentPosition,
                      duration: playerState.duration,
                      onPositionChanged: (newPosition) {
                        ref
                            .read(playerStateProvider.notifier)
                            .setCurrentPosition(newPosition);
                      },
                      isDark: isDark,
                    ),
                    const SizedBox(height: 32),
                    // Player Controls
                    PlayerControls(
                      isPlaying: playerState.isPlaying,
                      onPlayPause: () {
                        ref
                            .read(playerStateProvider.notifier)
                            .setPlaying(!playerState.isPlaying);
                      },
                      onStop: () {
                        ref.read(playerStateProvider.notifier).reset();
                      },
                      onPrevious: () {
                        // TODO: Implement previous surah
                      },
                      onNext: () {
                        // TODO: Implement next surah
                      },
                      onSkipBack: () {
                        final newPosition = playerState.currentPosition -
                            AppConstants.skipDuration;
                        ref
                            .read(playerStateProvider.notifier)
                            .setCurrentPosition(
                              newPosition.isNegative
                                  ? Duration.zero
                                  : newPosition,
                            );
                      },
                      onSkipForward: () {
                        final newPosition = playerState.currentPosition +
                            AppConstants.skipDuration;
                        ref
                            .read(playerStateProvider.notifier)
                            .setCurrentPosition(
                              newPosition > playerState.duration
                                  ? playerState.duration
                                  : newPosition,
                            );
                      },
                    ),
                    const SizedBox(height: 32),
                    // Playback Speed Selector
                    PlaybackSpeedSelector(
                      speeds: speeds,
                      currentSpeed: currentSpeed,
                      onSpeedChanged: (speed) {
                        ref
                            .read(currentPlaybackSpeedProvider.notifier)
                            .state = speed;
                        ref
                            .read(playerStateProvider.notifier)
                            .setPlaybackSpeed(speed);
                      },
                      isDark: isDark,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
      ),
    );
  }
}
