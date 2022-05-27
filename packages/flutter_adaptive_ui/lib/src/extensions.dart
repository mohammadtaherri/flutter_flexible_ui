part of flutter_adaptive_ui;

/// Extension methods to get the current breakpoint to a BuildContext.
extension BreakpointX on BuildContext {
  /// Get the current [BreakpointData]. This is a shortcut for `Breakpoint.of(context)`.
  BreakpointData? get breakpoint => Breakpoint.of(this);
}

/// Extension methods on [Screen]
extension ScreenX on Screen {
  bool get isHandset => isSmallHandset || isMediumHandset || isLargeHandset;
  bool get isSmallHandset => screenType == ScreenType.smallHandset;
  bool get isMediumHandset => screenType == ScreenType.mediumHandset;
  bool get isLargeHandset => screenType == ScreenType.largeHandset;

  bool get isTablet => isSmallTablet || isLargeTablet;
  bool get isSmallTablet => screenType == ScreenType.smallTablet;
  bool get isLargeTablet => screenType == ScreenType.largeTablet;

  bool get isDesktop => isSmallDesktop || isMediumDesktop || isLargeDesktop;
  bool get isSmallDesktop => screenType == ScreenType.smallDesktop;
  bool get isMediumDesktop => screenType == ScreenType.mediumDesktop;
  bool get isLargeDesktop => screenType == ScreenType.largeDesktop;

  bool get isXSmall => screenSize == ScreenSize.xsmall;
  bool get isSmall => screenSize == ScreenSize.small;
  bool get isMedium => screenSize == ScreenSize.medium;
  bool get isLarge => screenSize == ScreenSize.large;
  bool get isXLarge => screenSize == ScreenSize.xlarge;

  bool get isWeb => platform == PlatformType.web;
  bool get isAndroid => platform == PlatformType.android;
  bool get isFuchsia => platform == PlatformType.fuchsia;
  bool get isIOS => platform == PlatformType.iOS;
  bool get isWindows => platform == PlatformType.windows;
  bool get isLinux => platform == PlatformType.linux;
  bool get isMacOS => platform == PlatformType.macOS;
}
