part of flutter_adaptive_ui;

/// An object that gives some informations about device's screen.
///
/// See also:
///
///  * [BreakpointData]
///  * [MediaQueryData]
///  * [AdaptiveBuilder]
///  * [AdaptiveLayoutDelegate]
class Screen {
  Screen({
    required this.mediaQueryData,
    required this.breakpointData,
    this.layoutConstraints,
  }) {
    final double width =
        layoutConstraints?.maxWidth ?? mediaQueryData.size.width;

    platform = getDefaultPlatform();
    designLanguage = getDefaultDesignLanguage();
    screenSize = breakpointData._getScreenSize(width);
    screenType = breakpointData._getScreenType(width);
  }

  final MediaQueryData mediaQueryData;
  final BreakpointData breakpointData;
  final BoxConstraints? layoutConstraints;

  /// Screen Size based on screen width.
  /// This field is obtained by [BreakpointData._getScreenSize].
  ///
  /// By default, If screen width is 0-599 px, it will be xSmall.
  /// If screen width is 600-1023 px, it will be small.
  /// If screen width is 1024-1439 px, it will be medium.
  /// If screen width is 1440-1919 px, it will be large.
  /// If screen width is 1920+ px, it will be xLarge.
  ///
  /// You can overrid the default sizes by wrpping your [MaterialApp]
  /// (or [WidgetsApp]) in a [Breakpoint].
  ///
  /// See also:
  ///
  ///  * [BreakpointData]
  ///  * [Breakpoint]
  late final ScreenSize screenSize;

  /// Screen Type based on screen width.
  /// This field is obtained by [BreakpointData._getScreenType].
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
  /// You can overrid the default sizes by wrpping your [MaterialApp]
  /// (or [WidgetsApp]) in a [Breakpoint].
  ///
  /// See also:
  ///
  ///  * [BreakpointData]
  ///  * [Breakpoint]
  late final ScreenType screenType;

  /// Design Language based on [PlatformType].
  /// This field is obtained by [getDefaultDesignLanguage].
  ///
  /// If [PlatformType] is android or fuchsia, it will be material.
  /// If [PlatformType] is iOS or macOS, it will be cupertino.
  /// If [PlatformType] is windows, it will be fluent.
  /// If [PlatformType] is linux or web, it will be material.
  ///
  /// See also:
  ///
  ///  * [getDefaultDesignLanguage]
  late final DesignLanguage designLanguage;

  /// Platform Type based on [TargetPlatform] and [kIsWeb]
  /// This field is obtained by [getDefaultPlatform].
  ///
  /// If [kIsWeb] is true, it will be web.
  /// If [kIsWeb] is false, it will be obtained based on [TargetPlatform].
  ///
  /// See also:
  ///
  ///  * [getDefaultPlatform]
  late final PlatformType platform;

  static Screen of(BuildContext context) => Screen(
        mediaQueryData: MediaQuery.of(context),
        breakpointData: Breakpoint.of(context) ?? const BreakpointData(),
      );
}
