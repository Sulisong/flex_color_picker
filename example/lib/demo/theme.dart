import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

/// The themes for this app.
class AppTheme {
  // This constructor prevents external instantiation and extension.
  AppTheme._();

  /// The used light theme.
  static ThemeData get light {
    return ThemeData.from(
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF3B5998),
        primaryVariant: const Color(0xFF3F729B),
        secondary: const Color(0xFF55ACEE),
        secondaryVariant: const Color(0xFFA2D1F6),
      ),
      textTheme: textTheme,
    ).copyWith(
      scaffoldBackgroundColor: const Color(0xFFFDFDFD),
      toggleableActiveColor: const Color(0xFF55ACEE),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.9),
        foregroundColor: Colors.black,
        elevation: 0.5,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      tooltipTheme: tooltipTheme(false),
      visualDensity: comfortablePlatformDensity,
    );
  }

  /// The used dark theme.
  static ThemeData get dark {
    return ThemeData.from(
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xFF8B9DC3),
        primaryVariant: const Color(0xFF799CB9),
        secondary: const Color(0xFFA0D1F5),
        secondaryVariant: const Color(0xFF607D93),
        onPrimary: Colors.white,
      ),
      textTheme: textTheme,
    ).copyWith(
      toggleableActiveColor: const Color(0xFFA0D1F5),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF121212).withOpacity(0.9),
        foregroundColor: Colors.white,
        elevation: 0.5,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      textButtonTheme: textButtonTheme,
      tooltipTheme: tooltipTheme(true),
      visualDensity: comfortablePlatformDensity,
    );
  }

  // TODO: Investigate potential GoogleFonts font issue on Windows platform.
  // Making a custom text theme here, via on-line GoogleFonts load. Intended to
  // use something else than "Roboto", but they were all a little bit
  // broken on Windows platform, not sure why. Need to download and try as
  // assets and compare to that method and also compare to Web builds.
  // Tested like this with: 'sourceSansPro', 'lato' and 'notoSans' all in
  // theory nice fonts, but all were a tiny bit broken with clearly faulty
  // pixels in some letters on Windows builds. Did not test Web builds with
  // them yet used via GoogleFonts. Anyway sticking to plain old "roboto" for
  // now. At least with this setup will get the "Roboto" font on all platforms.
  // If no font is specified, we will get platform dependent default font,
  // just wanted the same font here to ensure a consistent result in this demo.
  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.roboto(
        fontSize: 48, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.roboto(
        fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.roboto(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    bodyText1: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    subtitle1: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    button: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.roboto(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.roboto(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  /// Theme definitions give ElevatedButton a Stadium rounded design.
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    padding: roundButtonPadding,
  ));

  /// Theme definitions give OutlinedButton a Stadium rounded design.
  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: const StadiumBorder(),
    padding: roundButtonPadding,
  ));

  /// Theme definitions give TextButton a Stadium rounded design.
  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    shape: const StadiumBorder(),
    padding: roundButtonPadding,
  ));

  /// The stadium rounded buttons need a bit more padding to look.
  static const EdgeInsets roundButtonPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  /// Use an alternative tooltip style.
  static TooltipThemeData tooltipTheme(bool isDark) {
    return TooltipThemeData(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 5),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      textStyle: TextStyle(
        color: isDark ? Colors.black : Colors.white,
        fontSize: tooltipFontSize,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFFCFCFCF).withOpacity(0.94)
            : const Color(0xFF444444).withOpacity(0.93),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
            color: isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000)),
      ),
    );
  }

  /// Returns a [VisualDensity] that is adaptive to `comfortable` instead
  /// of to the default `compact`, based on active [defaultTargetPlatform].
  ///
  /// For desktop platforms, this returns [VisualDensity.comfortable], and
  /// for other platforms, it returns the default [VisualDensity].
  /// This is a variant of the [VisualDensity.adaptivePlatformDensity] that
  /// returns [VisualDensity.compact] for the desktop platforms. If this seems
  /// too dense and you prefer `comfortable` on desktop and still like the even
  /// less dense default on on devices, then use this platform dependent
  /// [VisualDensity] function as `visualDensity` for your theme.
  static VisualDensity get comfortablePlatformDensity {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return VisualDensity.comfortable;
    }
    return const VisualDensity();
  }

  /// The current default theme for Material themed Tooltips are poor design
  /// choices for desktop https://material.io/components/tooltips#specs.
  /// See issue: https://github.com/flutter/flutter/issues/71429
  /// The font size of 10 dp is just too small for desktops with pixel density
  /// 1.0 also the dark tooltips on light theme and light tooltips on dark
  /// themes seem more reminiscent of bootstrap Web theme and does not fit so
  /// well on desktop, windows native for example uses light tooltips on light
  /// themes. This default theme for tooltips uses that design choice and also
  /// makes desktop and hence Web tooltips a bit larger as well, by using
  /// 13dp font size instead of the too small 10 dp. Normally I use 12dp on
  /// desktop, but reading the API tooltips at 13dp felt a bit easier.
  static double get tooltipFontSize {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return 13;
      default:
        return 14;
    }
  }
}
