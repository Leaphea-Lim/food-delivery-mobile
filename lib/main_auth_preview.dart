import 'package:material_ui/material_ui.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/screens/welcome_screen.dart';

/// Test Auth + Account Flow៖  flutter run -t lib/main_auth_preview.dart
void main() => runApp(const _AuthPreviewApp());

class _AuthPreviewApp extends StatelessWidget {
  const _AuthPreviewApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
