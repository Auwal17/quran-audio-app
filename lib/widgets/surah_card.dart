import 'package:flutter/material.dart';
import '../models/surah_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';

/// Reusable Surah Card Widget
class SurahCard extends StatelessWidget {
  final Surah surah;
  final VoidCallback onTap;
  final bool showDivider;

  const SurahCard({
    Key? key,
    required this.surah,
    required this.onTap,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: bgColor,
            child: Row(
              children: [
                // Surah Number Circle
                Container(
                  width: 50,
                  height: 50,
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
                  ),
                  child: Center(
                    child: Text(
                      surah.number.toString(),
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Surah Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // English Name and Revelation Type
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            surah.englishName,
                            style: AppTypography.headlineSmall.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.gold.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              surah.revelationType,
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.gold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Arabic Name and Transliteration
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            surah.arabicName,
                            style: AppTypography.arabicBodyLarge.copyWith(
                              color: AppColors.emeraldGreen,
                            ),
                          ),
                          Text(
                            surah.transliteration,
                            style: AppTypography.bodySmall.copyWith(
                              color: secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Verse Count
                      Text(
                        '${surah.verses} verses',
                        style: AppTypography.bodySmall.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
      ],
    );
  }
}
