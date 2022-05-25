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

  /// xsmall , small , medium , large , xlarge
  final ScreenSize screenSize;

  /// small handset , medium handset , large hanset
  /// small tablet , large tablet
  /// small desktop , medium desktop , large desktop
  final ScreenType screenType;

  /// If [targetPlatform] is android or fuchsia, it will be [DesignLanguage.material]
  /// If [targetPlatform] is ios or macos, it will be [DesignLanguage.cupertino]
  /// If [targetPlatform] is windows, it will be [DesignLanguage.fluent]
  /// For other [targetPlatform]s (linux , web), it will be [DesignLanguage.material]
  late final DesignLanguage designLanguage;

  late final PlatformType platform;
}
