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
  xsmall('XSmall'),
  small('Small'),
  medium('Medium'),
  large('Large'),
  xlarge('XLarge');

  const ScreenSize([this.debugLabel]);
  final String? debugLabel;
}

/// Screen Type based on screen width.
///
/// By default, If screen width is 0-359 px, it will be smallHandset.
/// If screen width is 360-399 px, it will be mediumHandset.
/// If screen width is 400-599 px, it will be largeHandset.
/// If screen width is 600-719 px, it will be smallTablet.
/// If screen width is 720-1023 px, it will be largeTablet.
/// If screen width is 1024-1439 px, it will be smallDesktop.
/// If screen width is 1440-1919 px, it will be mediumDesktop.
/// If screen width is 1920+ px, it will be largeDesktop.
///
/// See also:
///
///  * [BreakpointData]
///  * [Breakpoint]
///  * [Screen]
enum ScreenType {
  smallHandset('Small Handset'),
  mediumHandset('Medium Handset'),
  largeHandset('Large Handset'),
  smallTablet('Small Tablet'),
  largeTablet('Large Tablet'),
  smallDesktop('Small Desktop'),
  mediumDesktop('Medium Desktop'),
  largeDesktop('Large Desktop');

  const ScreenType([this.debugLabel]);
  final String? debugLabel;
}

/// Design Language based on [PlatformType].
///
/// If [PlatformType] is android or fuchsia, it will be material.
/// If [PlatformType] is iOS or macOS, it will be cupertino.
/// If [PlatformType] is windows, it will be fluent.
/// If [PlatformType] is linux or web, it will be material.
///
/// See also:
///
///  * [Screen]
///  * [getDefaultDesignLanguage]
enum DesignLanguage {
  material('Material'),
  cupertino('Cupertino'),
  fluent('Fluent');

  const DesignLanguage([this.debugLabel]);
  final String? debugLabel;
}

/// Platform Type based on [TargetPlatform] and [kIsWeb]
///
/// If [kIsWeb] is true, it will be web.
/// If [kIsWeb] is false, it will be obtained based on [TargetPlatform].
///
/// See also:
///
///  * [Screen]
///  * [getDefaultPlatform]
enum PlatformType {
  android('Android'),
  fuchsia('Fuchsia'),
  iOS('IOS'),
  macOS('MacOS'),
  windows('Windows'),
  linux('Linux'),
  web('Web');

  const PlatformType([this.debuglabel]);
  final String? debuglabel;
}
