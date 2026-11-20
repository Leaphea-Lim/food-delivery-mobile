import 'package:material_ui/material_ui.dart';

import '../../../shared/shared_widgets.dart';
import '../../customer/screens/account/account_profile_screen.dart';

/// Screen បណ្ដោះអាសន្នបន្ទាប់ពី Login/OTP ជោគជ័យ
/// TODO: ជំនួសដោយ AppRoutes.customerHome នៅពេល Customer Home រួចរាល់
class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Home (coming soon)'),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Open Profile',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AccountProfileScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
