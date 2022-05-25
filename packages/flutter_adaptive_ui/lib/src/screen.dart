part of flutter_adaptive_ui;

class Screen {
  Screen({
    required this.screenSize,
    required this.screenType,
  }) {
    platform = getDefaultPlatform();
    designLanguage = getDefaultDesignLanguage();
  }

  factory Screen.fromMediaQueryAndBreakpoint(
    MediaQueryData mediaQueryData,
    BreakpointData breakpointData,
  ) {
    final double screenWidth = mediaQueryData.size.width;

    return Screen(
      screenSize: breakpointData.getScreenSize(screenWidth),
      screenType: breakpointData.getScreenType(screenWidth),
    );
  }

  final ScreenSize screenSize;

  final ScreenType screenType;

  late final DesignLanguage designLanguage;

  late final PlatformType platform;
}
