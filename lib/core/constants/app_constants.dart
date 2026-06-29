/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'Quran Recitation';
  static const String appVersion = '1.0.0';
  static const String teacherName = 'Sheikh [Teacher\'s Name]';

  // Audio
  static const String audioAssetPath = 'assets/audio/';
  static const String audioFileExtension = '.mp3';
  static const int totalSurahs = 114;

  // Playback Speeds
  static const List<double> playbackSpeeds = [
    0.5,
    0.75,
    1.0,
    1.25,
    1.5,
    2.0,
  ];

  // Skip Duration
  static const Duration skipDuration = Duration(seconds: 10);

  // Performance
  static const int targetLaunchTimeMs = 3000;
  static const int minRAMRequiredMB = 2048;
  static const int targetFPS = 60;

  // Storage Keys
  static const String prefThemeKey = 'theme_dark_mode';
  static const String prefLastSurahKey = 'last_played_surah';
  static const String prefLastPositionKey = 'last_playback_position';
  static const String prefPlaybackSpeedKey = 'playback_speed';
}

/// Surah Information
class SurahInfo {
  static const Map<String, String> revelationType = {
    'makki': 'Makki',
    'madani': 'Madani',
  };
}
