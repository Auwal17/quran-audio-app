import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/extensions/build_context_extensions.dart';

/// Settings Screen
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final bgColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Settings',
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
            // Display Section
            _SectionTitle(label: 'Display', isDark: isDark),
            const SizedBox(height: 8),
            Container(
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
                  _SettingsTile(
                    icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    title: 'Theme',
                    subtitle: isDarkMode ? 'Dark Mode' : 'Light Mode',
                    isDark: isDark,
                    trailing: Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).toggleTheme();
                      },
                      activeColor: AppColors.emeraldGreen,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // About Section
            _SectionTitle(label: 'About', isDark: isDark),
            const SizedBox(height: 8),
            Container(
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
                  _SettingsTile(
                    icon: Icons.info_outline,
                    title: 'About App',
                    subtitle: AppConstants.appVersion,
                    isDark: isDark,
                    onTap: () => _showAboutDialog(context, isDark),
                  ),
                  Divider(
                    height: 1,
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                  _SettingsTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    isDark: isDark,
                    onTap: () => _showPrivacyPolicy(context, isDark),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Actions Section
            _SectionTitle(label: 'Actions', isDark: isDark),
            const SizedBox(height: 8),
            Container(
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
                  _SettingsTile(
                    icon: Icons.share_outlined,
                    title: 'Share App',
                    isDark: isDark,
                    onTap: () => _shareApp(),
                  ),
                  Divider(
                    height: 1,
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                  _SettingsTile(
                    icon: Icons.star_outline,
                    title: 'Rate App',
                    isDark: isDark,
                    onTap: () => _rateApp(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Version Info
            Center(
              child: Text(
                'Version ${AppConstants.appVersion}',
                style: AppTypography.bodySmall.copyWith(
                  color: secondaryTextColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context, bool isDark) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppConstants.appName,
          style: AppTypography.headlineMedium,
        ),
        content: Text(
          'An offline Quran audio application providing complete access to Quranic recitations without internet connection.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.emeraldGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context, bool isDark) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Privacy Policy',
          style: AppTypography.headlineMedium,
        ),
        content: SingleChildScrollView(
          child: Text(
            'This application is completely offline and does not collect any personal data. All audio files are stored locally on your device.',
            style: AppTypography.bodyMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.emeraldGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _shareApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Share functionality will be implemented in Phase 5',
          style: AppTypography.bodyMedium,
        ),
        backgroundColor: AppColors.emeraldGreen,
      ),
    );
  }

  void _rateApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Rate functionality will be implemented in Phase 5',
          style: AppTypography.bodyMedium,
        ),
        backgroundColor: AppColors.emeraldGreen,
      ),
    );
  }
}

/// Section Title Widget
class _SectionTitle extends StatelessWidget {
  final String label;
  final bool isDark;

  const _SectionTitle({
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

/// Settings Tile Widget
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isDark;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.isDark,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryTextColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.emeraldGreen,
      ),
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(color: textColor),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppTypography.bodySmall.copyWith(color: secondaryTextColor),
            )
          : null,
      trailing: trailing ??
          (onTap != null
              ? Icon(
                  Icons.chevron_right,
                  color: secondaryTextColor,
                )
              : null),
      onTap: onTap,
    );
  }
}
