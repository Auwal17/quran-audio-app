/// Surah Model - Represents a single Surah from the Quran
class Surah {
  final int number;
  final String arabicName;
  final String englishName;
  final String transliteration;
  final int verses;
  final String revelationType; // 'Makki' or 'Madani'
  final String audioPath;

  Surah({
    required this.number,
    required this.arabicName,
    required this.englishName,
    required this.transliteration,
    required this.verses,
    required this.revelationType,
    required this.audioPath,
  });

  /// Get formatted surah number with leading zero
  String get formattedNumber => number.toString().padLeft(3, '0');

  /// Get audio file path
  String get audioFileName => 'assets/audio/${formattedNumber}_${transliteration.toLowerCase().replaceAll(' ', '_')}.mp3';

  /// Create a copy with modified fields
  Surah copyWith({
    int? number,
    String? arabicName,
    String? englishName,
    String? transliteration,
    int? verses,
    String? revelationType,
    String? audioPath,
  }) {
    return Surah(
      number: number ?? this.number,
      arabicName: arabicName ?? this.arabicName,
      englishName: englishName ?? this.englishName,
      transliteration: transliteration ?? this.transliteration,
      verses: verses ?? this.verses,
      revelationType: revelationType ?? this.revelationType,
      audioPath: audioPath ?? this.audioPath,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Surah &&
          runtimeType == other.runtimeType &&
          number == other.number;

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return 'Surah(number: $number, englishName: $englishName, verses: $verses)';
  }
}
