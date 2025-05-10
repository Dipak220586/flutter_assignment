# 📰 Flutter Articles App

A simple Flutter app that displays articles fetched from a public API.  
Includes features like browsing, searching, and viewing article details.

## 🚀 Features

- 🏠 Home Screen: List of articles from [JSONPlaceholder API](https://jsonplaceholder.typicode.com/posts)
- 🔎 Search: Filter articles by title or body (client-side)
- 📄 Detail Screen: View full article content
- 🚀 State Management: Using `Cubit` + `Bloc`
- 🌐 Networking: Using `Dio`
- 🎯 Clean Architecture structure (data, domain, presentation layers)
- 📱 Splash screen and custom app icon

## 📦 Packages Used

- `flutter_bloc`
- `dio`
- `freezed`
- `flutter_launcher_icons`
- `flutter_native_splash`

## 🛠️ Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/flutter_articles_app.git
cd flutter_articles_app

# Install dependencies
flutter pub get

# Generate freezed files
flutter pub run build_runner build --delete-conflicting-outputs

# Run on device/emulator
flutter run


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
