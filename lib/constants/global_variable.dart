import 'package:shoping_app/theme/app_theme.dart';
// ══════════════════════════════════════════════════════════════════════════════
//  SHOPZI — Global Variables & Theme
// ══════════════════════════════════════════════════════════════════════════════

const String uri = 'http://127.0.0.1:3000';

// ══════════════════════════════════════════════════════════════════════════════
//  GlobalVariable — kept for backward compatibility
// ══════════════════════════════════════════════════════════════════════════════

class GlobalVariable {
  static const primaryColor = AppColors.primary;
  static const secondaryColor = AppColors.primaryLight;
  static const accentSoft = AppColors.primarySoft;
  static const highlightColor = AppColors.highlight;
  static const backgroundColor = AppColors.white;
  static const greyBackgroundCOlor = AppColors.grey100;
  static var selectedNavBarColor = AppColors.navSelected;
  static const unselectedNavBarColor = AppColors.navUnselected;
  static const brandGradient = AppColors.brandGradient;
}
