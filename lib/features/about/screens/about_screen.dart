import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/extensions/build_context_extensions.dart';

/// About Teacher Screen
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'About Teacher',
          style: AppTypography.headlineMedium.copyWith(color: textColor),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Teacher Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? AppColors.darkBorder
                      : AppColors.lightBorder,
                ),
              ),
              child: Column(
                children: [
                  // Avatar Placeholder
                  Container(
                    width: 120,
                    height: 120,
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
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Teacher Name
                  Text(
                    'Sheikh [Teacher\'s Name]',
                    style: AppTypography.headlineMedium.copyWith(
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // Specialty
                  Text(
                    'Quran Recitation Specialist',
                    style: AppTypography.bodyMedium.copyWith(
                      color: secondaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Biography Section
            _SectionHeader(label: 'Biography', isDark: isDark),
            const SizedBox(height: 8),
            Text(
              'Add the biography of the Sheikh here. This section can contain information about their background, achievements, and contributions to Quran recitation.',
              style: AppTypography.bodyMedium.copyWith(
                color: secondaryTextColor,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            // Educational Background
            _SectionHeader(label: 'Educational Background', isDark: isDark),
            const SizedBox(height: 8),
            Text(
              'Information about the Sheikh\'s formal education, Quranic studies, and certifications can be listed here.',
              style: AppTypography.bodyMedium.copyWith(
                color: secondaryTextColor,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            // Teaching Methodology
            _SectionHeader(label: 'Teaching Methodology', isDark: isDark),
            const SizedBox(height: 8),
            Text(
              'Describe the Sheikh\'s approach to Quran recitation, including their technique, style, and any unique methodologies they employ in their recitation.',
              style: AppTypography.bodyMedium.copyWith(
                color: secondaryTextColor,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            // Achievements
            _SectionHeader(label: 'Achievements', isDark: isDark),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AchievementItem(
                  title: 'Achievement 1',
                  description: 'Description of achievement',
                  isDark: isDark,
                ),
                _AchievementItem(
                  title: 'Achievement 2',
                  description: 'Description of achievement',
                  isDark: isDark,
                ),
                _AchievementItem(
                  title: 'Achievement 3',
                  description: 'Description of achievement',
                  isDark: isDark,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// Section Header Widget
class _SectionHeader extends StatelessWidget {
  final String label;
  final bool isDark;

  const _SectionHeader({
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTypography.headlineSmall.copyWith(
        color: AppColors.emeraldGreen,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// Achievement Item Widget
class _AchievementItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isDark;

  const _AchievementItem({
    required this.title,
    required this.description,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.emeraldGreen,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.labelLarge.copyWith(
                    color: textColor,
                  ),
                ),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
