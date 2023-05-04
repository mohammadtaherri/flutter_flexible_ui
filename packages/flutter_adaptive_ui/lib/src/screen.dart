part of flutter_adaptive_ui;

/// An object that gives some information about device's screen.
///
/// See also:
///
///  * [BreakpointData]
///  * [MediaQueryData]
///  * [AdaptiveBuilder]
///  * [AdaptiveLayoutDelegate]
class Screen {
  Screen._({
    required this.mediaQueryData,
    required this.breakpointData,
  }) {
    final double width = mediaQueryData.size.width;

    platform = getDefaultPlatform();
    designLanguage = getDefaultDesignLanguage();
    screenSize = breakpointData._getScreenSize(width);
    screenType = breakpointData._getScreenType(width);
  }

  factory Screen.fromContext(BuildContext context) => Screen._(
        mediaQueryData: MediaQuery.of(context),
        breakpointData: Breakpoint.of(context) ?? const BreakpointData(),
      );

  factory Screen.fromWindow() {
    WidgetsFlutterBinding.ensureInitialized();
    return Screen._(
      mediaQueryData: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      breakpointData: const BreakpointData(),
    );
  }

  final MediaQueryData mediaQueryData;
  final BreakpointData breakpointData;

  /// Screen Size based on screen width.
  /// This field is obtained by [BreakpointData._getScreenSize].
  ///
  /// By default, If screen width is 0-599 px, it will be xSmall.
  /// If screen width is 600-1023 px, it will be small.
  /// If screen width is 1024-1439 px, it will be medium.
  /// If screen width is 1440-1919 px, it will be large.
  /// If screen width is 1920+ px, it will be xLarge.
  ///
  /// You can override the default sizes by wrapping your [MaterialApp]
  /// (or [WidgetsApp]) in a [Breakpoint].
  ///
  /// See also:
  ///
  ///  * [BreakpointData]
  ///  * [Breakpoint]
  late final ScreenSize screenSize;

  /// Screen Type based on the screen width.
  /// This field is obtained by [BreakpointData._getScreenType].
  ///
  /// By default, If screen width is 0-359 px, it will be smallHandset.
  /// If the screen width is 360-399 px, it will be mediumHandset.
  /// If the screen width is 400-599 px, it will be largeHandset.
  /// If the screen width is 600-719 px, it will be smallTablet.
  /// If the screen width is 720-1023 px, it will be largeTablet.
  /// If the screen width is 1024-1439 px, it will be smallDesktop.
  /// If the screen width is 1440-1919 px, it will be mediumDesktop.
  /// If the screen width is 1920+ px, it will be largeDesktop.
  ///
  /// You can override the default sizes by wrapping your [MaterialApp]
  /// (or [WidgetsApp]) in a [Breakpoint].
  ///
  /// See also:
  ///
  ///  * [BreakpointData]
  ///  * [Breakpoint]
  late final ScreenType screenType;

  /// Design Language based on the [PlatformType].
  /// This field is obtained by [getDefaultDesignLanguage].
  ///
  /// If the [PlatformType] is android or fuchsia, it will be material.
  /// If the [PlatformType] is iOS or macOS, it will be cupertino.
  /// If the [PlatformType] is windows, it will be fluent.
  /// If the [PlatformType] is linux or web, it will be material.
  ///
  /// See also:
  ///
  ///  * [getDefaultDesignLanguage]
  late final DesignLanguage designLanguage;

  /// Platform Type based on the [TargetPlatform] and the [kIsWeb]
  /// This field is obtained by the [getDefaultPlatform].
  ///
  /// If the [kIsWeb] is true, it will be web.
  /// If the [kIsWeb] is false, it will be obtained based on the [TargetPlatform].
  ///
  /// See also:
  ///
  ///  * [getDefaultPlatform]
  late final PlatformType platform;

  @Deprecated('Use `Screen.fromContext` instead. Will be removed in v1.0.0')
  static Screen of(BuildContext context) => Screen._(
        mediaQueryData: MediaQuery.of(context),
        breakpointData: Breakpoint.of(context) ?? const BreakpointData(),
      );
}
