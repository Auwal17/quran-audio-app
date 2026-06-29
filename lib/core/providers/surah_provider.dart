import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/surah_model.dart';
import '../../data/surah_data.dart';

/// Provider for all Surahs
final surahProvider = FutureProvider<List<Surah>>((ref) async {
  // Simulate async loading
  await Future.delayed(Duration(milliseconds: 100));
  return surahList;
});

/// Provider for a specific Surah by number
final surahByNumberProvider = FutureProvider.family<Surah?, int>((ref, number) async {
  final surahs = await ref.watch(surahProvider.future);
  try {
    return surahs.firstWhere((surah) => surah.number == number);
  } catch (e) {
    return null;
  }
});

/// Provider for search results
final searchResultsProvider = StateProvider<List<Surah>>((ref) => []);

/// Provider for search query
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Computed provider for filtered search results
final filteredSurahProvider = FutureProvider<List<Surah>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final surahs = await ref.watch(surahProvider.future);

  if (query.isEmpty) {
    return surahs;
  }

  final lowerQuery = query.toLowerCase();
  return surahs.where((surah) {
    return surah.englishName.toLowerCase().contains(lowerQuery) ||
        surah.transliteration.toLowerCase().contains(lowerQuery) ||
        surah.arabicName.contains(query) ||
        surah.number.toString().contains(lowerQuery);
  }).toList();
});
