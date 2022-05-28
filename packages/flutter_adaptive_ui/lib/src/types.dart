part of flutter_adaptive_ui;

/// Screen Size based on screen width.
///
/// By default, If screen width is 0-599 px, it will be xSmall.
/// If screen width is 600-1023 px, it will be small.
/// If screen width is 1024-1439 px, it will be medium.
/// If screen width is 1440-1919 px, it will be large.
/// If screen width is 1920+ px, it will be xLarge.
///
/// See also:
///
///  * [BreakpointData]
///  * [Breakpoint]
///  * [Screen]
enum ScreenSize {
  xsmall,
  small,
  medium,
  large,
  xlarge,
}

/// Screen Type based on the screen width.
///
/// By default, If screen width is 0-359 px, it will be smallHandset.
/// If the screen width is 360-399 px, it will be mediumHandset.
/// If the screen width is 400-599 px, it will be largeHandset.
/// If the screen width is 600-719 px, it will be smallTablet.
/// If the screen width is 720-1023 px, it will be largeTablet.
/// If the screen width is 1024-1439 px, it will be smallDesktop.
/// If the  screen width is 1440-1919 px, it will be mediumDesktop.
/// If the screen width is 1920+ px, it will be largeDesktop.
///
/// See also:
///
///  * [BreakpointData]
///  * [Breakpoint]
///  * [Screen]
enum ScreenType {
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  smallDesktop,
  mediumDesktop,
  largeDesktop,
}

/// Design Language based on the [PlatformType].
///
/// If the [PlatformType] is android or fuchsia, it will be material.
/// If the [PlatformType] is iOS or macOS, it will be cupertino.
/// If the [PlatformType] is windows, it will be fluent.
/// If the [PlatformType] is linux or web, it will be material.
///
/// See also:
///
///  * [Screen]
///  * [getDefaultDesignLanguage]
enum DesignLanguage {
  material,
  cupertino,
  fluent,
}

/// Platform Type based on the [TargetPlatform] and the[kIsWeb]
///
/// If the [kIsWeb] is true, it will be web.
/// If the [kIsWeb] is false, it will be obtained based on the [TargetPlatform].
///
/// See also:
///
///  * [Screen]
///  * [getDefaultPlatform]
enum PlatformType {
  android,
  fuchsia,
  iOS,
  macOS,
  windows,
  linux,
  web,
}
