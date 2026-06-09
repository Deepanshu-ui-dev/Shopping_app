import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ── Color tokens ──────────────────────────────────────────────────────────────

class AppColors {
  AppColors._();

  // Brand
  static const primary = Color(0xFF6367FF);
  static const primaryLight = Color(0xFF8494FF);
  static const primarySoft = Color(0xFFC9BEFF);
  static const primarySurface = Color(0xFFEEEEFF);

  // Accent
  static const highlight = Color(0xFFFFDBFD);
  static const highlightDark = Color(0xFFE879F9);

  // Neutrals
  static const white = Color(0xFFFFFFFF);
  static const background = Color(0xFFF8F8FC);
  static const surfaceCard = Color(0xFFFFFFFF);
  static const surfaceInput = Color(0xFFF4F4F8);
  static const grey50 = Color(0xFFF9F9FB);
  static const grey100 = Color(0xFFF4F4F5);
  static const grey200 = Color(0xFFE5E7EB);
  static const grey400 = Color(0xFF9CA3AF);
  static const grey600 = Color(0xFF6B7280);
  static const grey800 = Color(0xFF1F2937);
  static const black = Color(0xFF0F0F1A);

  // Semantic
  static const success = Color(0xFF22C55E);
  static const successSurface = Color(0xFFDCFCE7);
  static const warning = Color(0xFFF59E0B);
  static const warningSurface = Color(0xFFFEF3C7);
  static const error = Color(0xFFEF4444);
  static const errorSurface = Color(0xFFFEE2E2);
  static const info = Color(0xFF3B82F6);
  static const infoSurface = Color(0xFFEFF6FF);

  // Nav
  static const navSelected = primary;
  static const navUnselected = Color(0xFF71717A);

  // Gradients
  static const brandGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const heroBgGradient = LinearGradient(
    colors: [Color(0xFFEEEEFF), Color(0xFFFFF0FE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [primary, Color(0xFF8494FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

// ── Typography ────────────────────────────────────────────────────────────────

class AppTextStyles {
  AppTextStyles._();

  static const _base = TextStyle(fontFamily: 'Inter', color: AppColors.black);

  static final displayLg = _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 1.1,
    letterSpacing: -0.5,
  );
  static final displayMd = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.15,
    letterSpacing: -0.3,
  );
  static final headingLg = _base.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );
  static final headingMd = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );
  static final headingSm = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  static final bodyLg = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.grey800,
  );
  static final bodyMd = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.grey600,
  );
  static final bodySm = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.grey400,
  );
  static final labelLg = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
  static final labelMd = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static final labelSm = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.3,
  );
  static final buttonLg = _base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: AppColors.white,
  );
  static final buttonMd = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );
  static final price = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
    letterSpacing: -0.3,
  );
  static final priceStrike = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.grey400,
    decoration: TextDecoration.lineThrough,
  );
}

// ── Spacing & Radii ───────────────────────────────────────────────────────────

class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

class AppRadius {
  AppRadius._();
  static const double xs = 6;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 28;
  static const double pill = 100;
}

// ── Shadows ───────────────────────────────────────────────────────────────────

class AppShadows {
  AppShadows._();

  static final sm = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.05),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];

  static final md = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.07),
      blurRadius: 14,
      offset: const Offset(0, 4),
    ),
  ];

  static final lg = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: 0.1),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static final brand = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.28),
      blurRadius: 18,
      offset: const Offset(0, 6),
    ),
  ];

  static final brandLg = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.35),
      blurRadius: 32,
      offset: const Offset(0, 10),
    ),
  ];
}

// ══════════════════════════════════════════════════════════════════════════════
//  MaterialApp ThemeData
// ══════════════════════════════════════════════════════════════════════════════

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      // ── Color scheme ──────────────────────────────────────────────────────
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        secondary: AppColors.primaryLight,
        onSecondary: AppColors.white,
        tertiary: AppColors.highlightDark,
        surface: AppColors.surfaceCard,
        onSurface: AppColors.black,
        error: AppColors.error,
        onError: AppColors.white,
        outline: AppColors.grey200,
        surfaceContainerHighest: AppColors.grey100,
      ),

      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.surfaceCard,

      // ── App bar ───────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        titleTextStyle: AppTextStyles.headingMd,
        iconTheme: const IconThemeData(color: AppColors.black, size: 22),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        shape: const Border(
          bottom: BorderSide(color: AppColors.grey200, width: 0.5),
        ),
      ),

      // ── Bottom nav ────────────────────────────────────────────────────────
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.navUnselected,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ── Navigation bar (M3) ───────────────────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.primarySurface,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 22);
          }
          return const IconThemeData(color: AppColors.navUnselected, size: 22);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSm.copyWith(color: AppColors.primary);
          }
          return AppTextStyles.labelSm.copyWith(color: AppColors.navUnselected);
        }),
        elevation: 0,
        height: 64,
      ),

      // ── ElevatedButton ────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.primarySoft,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTextStyles.buttonLg,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),

      // ── OutlinedButton ────────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.grey200, width: 1),
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTextStyles.buttonMd.copyWith(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),

      // ── TextButton ────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),

      // ── Input / TextField ─────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceInput,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.grey400),
        labelStyle: AppTextStyles.labelMd.copyWith(color: AppColors.grey600),
        floatingLabelStyle: AppTextStyles.labelSm.copyWith(
          color: AppColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.grey200, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.grey200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        errorStyle: AppTextStyles.bodySm.copyWith(color: AppColors.error),
        prefixIconColor: AppColors.grey400,
        suffixIconColor: AppColors.grey400,
      ),

      // ── Card ──────────────────────────────────────────────────────────────
      // FIX: Use CardTheme.raw() or theme properties accepted in newer Flutter.
      // CardTheme no longer accepts 'color', 'shape', etc. directly in M3.
      // Use CardTheme with the correct parameter names for your Flutter version.
      cardTheme: CardThemeData(
        color: AppColors.surfaceCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: const BorderSide(color: AppColors.grey200, width: 0.5),
        ),
      ),

      // ── Chip ──────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.grey100,
        selectedColor: AppColors.primarySurface,
        labelStyle: AppTextStyles.labelSm,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          side: const BorderSide(color: Colors.transparent),
        ),
        side: BorderSide.none,
      ),

      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 0.5,
        space: 0,
      ),

      // ── Snack bar ─────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.black,
        contentTextStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        behavior: SnackBarBehavior.floating,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────
      // FIX: DialogTheme no longer accepts 'backgroundColor' directly.
      // Use 'barrierColor' on showDialog() or ThemeData.dialogBackgroundColor instead.
      dialogTheme: DialogThemeData(
        // backgroundColor removed — set via dialogBackgroundColor below
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        titleTextStyle: AppTextStyles.headingMd,
        contentTextStyle: AppTextStyles.bodyMd,
      ),
      dialogBackgroundColor:
          AppColors.white, // ← replaces DialogTheme.backgroundColor
      // ── Bottom sheet ──────────────────────────────────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        dragHandleColor: AppColors.grey200,
        dragHandleSize: Size(40, 4),
        showDragHandle: true,
      ),

      // ── List tile ─────────────────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        titleTextStyle: AppTextStyles.labelLg,
        subtitleTextStyle: AppTextStyles.bodyMd,
        iconColor: AppColors.grey600,
        minVerticalPadding: 10,
      ),

      // ── Badge ─────────────────────────────────────────────────────────────
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.error,
        textColor: AppColors.white,
        smallSize: 8,
        largeSize: 18,
        textStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),

      // ── Progress indicator ────────────────────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primarySurface,
        circularTrackColor: AppColors.primarySurface,
        linearMinHeight: 4,
      ),

      // ── Switch ────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return AppColors.grey400;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.grey200;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Checkbox ─────────────────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: const BorderSide(color: AppColors.grey400, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ── Radio ─────────────────────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return AppColors.grey400;
        }),
      ),

      // ── Slider ────────────────────────────────────────────────────────────
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.primarySurface,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withValues(alpha: 0.12),
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      ),

      // ── Tab bar ────────────────────────────────────────────────────────────
      // FIX: TabBarTheme no longer accepts 'labelColor' / 'unselectedLabelColor'
      // directly in newer Flutter. Use 'labelStyle' / 'unselectedLabelStyle' with
      // color embedded, or pass via TabBarTheme.indicatorColor + overlayColor.
      tabBarTheme: TabBarThemeData(
        // labelColor / unselectedLabelColor removed — color moved into labelStyle
        labelStyle: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppTextStyles.labelMd.copyWith(
          color: AppColors.grey400,
        ),
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: AppColors.grey200,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Floating action button ─────────────────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),

      // ── Icon ──────────────────────────────────────────────────────────────
      iconTheme: const IconThemeData(color: AppColors.grey800, size: 22),

      // ── Text theme ────────────────────────────────────────────────────────
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLg,
        displayMedium: AppTextStyles.displayMd,
        headlineLarge: AppTextStyles.headingLg,
        headlineMedium: AppTextStyles.headingMd,
        headlineSmall: AppTextStyles.headingSm,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        bodySmall: AppTextStyles.bodySm,
        labelLarge: AppTextStyles.labelLg,
        labelMedium: AppTextStyles.labelMd,
        labelSmall: AppTextStyles.labelSm,
      ),
    );
  }
}
