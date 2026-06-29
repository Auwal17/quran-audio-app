import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/surah_card.dart';
import '../../../widgets/search_bar.dart';
import '../../../core/providers/surah_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';

/// Home Screen - Displays all Surahs with search functionality
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Quran Recitation',
          style: AppTypography.headlineMedium.copyWith(
            color: textColor,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Teacher Name
                Text(
                  AppConstants.teacherName,
                  style: AppTypography.headlineSmall.copyWith(
                    color: AppColors.emeraldGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  'Complete Offline Quran Recitation',
                  style: AppTypography.bodyMedium.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                // Surah count
                Text(
                  '${AppConstants.totalSurahs} Surahs',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ),
          // Search Bar
          SearchBar(
            onChanged: (query) {
              ref.read(searchQueryProvider.notifier).state = query;
            },
            hintText: 'Search by name or number...',
          ),
          const SizedBox(height: 8),
          // Surah List
          Expanded(
            child: ref.watch(filteredSurahProvider).when(
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: AppColors.emeraldGreen,
                ),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Error loading Surahs',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
              data: (surahs) => surahs.isEmpty
                  ? Center(
                      child: Text(
                        'No Surahs found',
                        style: AppTypography.bodyMedium.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: surahs.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final surah = surahs[index];
                        return SurahCard(
                          surah: surah,
                          onTap: () {
                            context.pushNamed(
                              'player',
                              pathParameters: {
                                'surahId': surah.number.toString(),
                              },
                            );
                          },
                          showDivider: index < surahs.length - 1,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
