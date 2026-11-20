import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

/// Logo ពី assets/images/logo.png (តាម Welcome Screen របស់ក្រុម)
/// បើរកមិនឃើញ File នឹងបង្ហាញ Placeholder ជំនួស
class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.size = AppSizes.logoSize});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => _LogoPlaceholder(size: size),
    );
  }
}

class _LogoPlaceholder extends StatelessWidget {
  const _LogoPlaceholder({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 3),
        color: Colors.white,
      ),
      child: Text(
        'FOOD',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w900,
          fontSize: size * 0.2,
        ),
      ),
    );
  }
}
