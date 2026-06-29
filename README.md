# Quran Recitation - Offline Audio App

A production-ready Android application built with Flutter providing a complete offline audio experience of the Holy Quran recited by a single teacher.

## 🎯 Features (Phase 1 - Foundation)

✅ Project Setup & Foundation
- Clean Architecture with feature-based organization
- Riverpod state management setup
- Material Design 3 with Islamic-inspired theme
- Light/Dark mode support
- Emerald Green & Gold color palette
- Beautiful typography (Arabic & English fonts)
- Proper project structure
- Code quality tools configured

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Android SDK 24+ (Android 7.0)
- Dart 3.0+

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/Auwal17/quran-audio-app.git
cd quran-audio-app
```

2. **Checkout phase-1-setup branch:**
```bash
git checkout phase-1-setup
```

3. **Install dependencies:**
```bash
flutter pub get
```

4. **Run the app:**
```bash
flutter run
```

## 📦 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart      # App-wide constants
│   ├── theme/
│   │   ├── app_colors.dart         # Color palette
│   │   ├── app_typography.dart     # Typography settings
│   │   └── app_theme.dart          # Theme configuration
│   ├── providers/
│   │   └── theme_provider.dart     # Theme state management
│   ├── router/
│   │   └── app_router.dart         # Navigation routes
│   ├── services/
│   │   └── audio_service_setup.dart # Audio service config
│   └── utils/
│       └── logger.dart              # Logging utility
├── data/                            # (Phase 3)
├── models/                          # (Phase 3)
├── features/                        # (Phase 2+)
│   ├── home/
│   ├── player/
│   ├── search/
│   ├── settings/
│   └── about/
├── widgets/                         # Reusable widgets (Phase 2+)
└── main.dart                        # App entry point
```

## 🎨 Design System

### Colors
- **Primary**: Emerald Green (#10B981)
- **Secondary**: Gold (#D4AF37)
- **Background**: Light (#FFFAF0) / Dark (#0F172A)
- **Surface**: White (Light) / Dark Charcoal (Dark)

### Typography
- **Arabic**: Amiri Font (beautiful, classic)
- **English**: Poppins Font (modern, clean)

### Spacing & Radius
- Base unit: 4px
- Border radius: 8-12px
- Standard padding: 16px, 24px

## 📚 Dependencies

### State Management
- `riverpod` - State management
- `flutter_riverpod` - Flutter integration

### Audio
- `just_audio` - Audio playback
- `audio_service` - Background audio
- `audio_session` - Audio session handling

### Navigation
- `go_router` - Declarative routing

### Storage
- `shared_preferences` - Local preferences

### UI & Design
- `google_fonts` - Typography
- `flutter_launcher_icons` - App icons

### Utilities
- `intl` - Internationalization
- `path_provider` - File paths
- `permission_handler` - Permissions

## 📖 Development Phases

### Phase 1: Project Setup ✅ (Current)
- [x] Flutter project initialization
- [x] Dependency setup
- [x] Project structure
- [x] Theme system
- [x] Constants & utilities

### Phase 2: UI & Navigation 🔄 (Next)
- [ ] Home screen with Surah list
- [ ] Player screen UI
- [ ] About teacher screen
- [ ] Settings screen
- [ ] Navigation system

### Phase 2B: Advanced Player UI
- [ ] Playback controls
- [ ] Progress slider
- [ ] Speed selector
- [ ] Time display

### Phase 3: Data Models & Database
- [ ] Surah data model
- [ ] 114 Surahs database
- [ ] Repository pattern
- [ ] Search functionality
- [ ] Local storage integration

### Phase 4: Audio Engine
- [ ] just_audio integration
- [ ] Background playback
- [ ] Media notifications
- [ ] Playback controls

### Phase 5: Search & Polish
- [ ] Search implementation
- [ ] State persistence
- [ ] Error handling
- [ ] Smooth animations

### Phase 6: Testing & Optimization
- [ ] Performance testing
- [ ] Unit tests
- [ ] Integration tests
- [ ] Memory optimization

### Phase 7: Release Preparation
- [ ] Release configuration
- [ ] Documentation
- [ ] Store listing
- [ ] Final QA

## 🔧 Available Scripts

```bash
# Run the app in debug mode
flutter run

# Build release APK
flutter build apk

# Build release AAB (for Play Store)
flutter build appbundle

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format .

# Clean build
flutter clean
```

## 📱 Performance Targets

- **Launch Time**: < 3 seconds on mid-range devices
- **Scroll Performance**: 60 FPS
- **Memory Usage**: Optimized for 2GB RAM minimum
- **Offline**: 100% offline capability

## 🏗️ Architecture

Follows **Clean Architecture** with **Feature-Based Organization**:

- **Core**: Common functionality (theme, routing, services)
- **Data**: Repository pattern, local data sources
- **Features**: Feature-specific screens and logic
- **Widgets**: Reusable UI components

## 📝 Code Style

- Follow Dart style guide
- Use `flutter format` for consistency
- Leverage `flutter analyze` for linting
- Write descriptive variable names
- Add comments for complex logic
- Keep methods small and focused

## 🤝 Contributing

1. Create a feature branch from the current phase
2. Follow the code style guide
3. Test your changes locally
4. Submit a pull request

## 📄 License

MIT License - Feel free to use this project for personal or commercial purposes.

## 🙏 Acknowledgments

- Built with Flutter and Dart
- Uses Material Design 3
- Islamic-inspired design philosophy
- Community-driven development

## 📞 Support

For issues, questions, or suggestions, please open an issue on GitHub.

---

**Status**: Phase 1 ✅ Complete | Ready for Phase 2 🚀

Last Updated: $(date)
