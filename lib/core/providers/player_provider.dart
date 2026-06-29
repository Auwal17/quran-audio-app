import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Player State Model
class PlayerState {
  final bool isPlaying;
  final Duration currentPosition;
  final Duration duration;
  final double playbackSpeed;
  final int? currentSurahNumber;

  PlayerState({
    this.isPlaying = false,
    this.currentPosition = Duration.zero,
    this.duration = Duration.zero,
    this.playbackSpeed = 1.0,
    this.currentSurahNumber,
  });

  PlayerState copyWith({
    bool? isPlaying,
    Duration? currentPosition,
    Duration? duration,
    double? playbackSpeed,
    int? currentSurahNumber,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      duration: duration ?? this.duration,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      currentSurahNumber: currentSurahNumber ?? this.currentSurahNumber,
    );
  }
}

/// Player State Provider
final playerStateProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  (ref) => PlayerNotifier(),
);

/// Player State Notifier
class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier() : super(PlayerState());

  void setPlaying(bool isPlaying) {
    state = state.copyWith(isPlaying: isPlaying);
  }

  void setCurrentPosition(Duration position) {
    state = state.copyWith(currentPosition: position);
  }

  void setDuration(Duration duration) {
    state = state.copyWith(duration: duration);
  }

  void setPlaybackSpeed(double speed) {
    state = state.copyWith(playbackSpeed: speed);
  }

  void setCurrentSurah(int surahNumber) {
    state = state.copyWith(currentSurahNumber: surahNumber);
  }

  void reset() {
    state = PlayerState();
  }
}

/// Available playback speeds
final playbackSpeedsProvider = Provider<List<double>>((ref) {
  return [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
});

/// Current playback speed
final currentPlaybackSpeedProvider = StateProvider<double>((ref) {
  return 1.0;
});
