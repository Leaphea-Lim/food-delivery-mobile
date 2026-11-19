import 'package:material_ui/material_ui.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.screenHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo
                      Image.asset(
                        'assets/images/logo.png',
                        width: AppSizes.logoSize,
                        height: AppSizes.logoSize,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 40),

                      // Welcome Heading
                      const Text(
                        'Welcome to Smart Food Delivery System',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading,
                      ),

                      const SizedBox(height: 12),

                      // Description
                      const Text(
                        'Fast, fresh deliveries right to your door',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Continue Separator
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.divider,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Text(
                              'CLICK TO CONTINUE',
                              style: AppTextStyles.separator,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.divider,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Continue Button
                      PrimaryButton(
                        text: 'CONTINUE',
                        onPressed: () {
                          // Navigation will be implemented later.
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
