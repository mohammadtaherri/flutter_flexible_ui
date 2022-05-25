part of flutter_adaptive_ui;

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

  late final ScreenSize screenSize;
  late final ScreenType screenType;
  late final DesignLanguage designLanguage;
  late final PlatformType platform;

  static Screen of(BuildContext context) => Screen(
        mediaQueryData: MediaQuery.of(context),
        breakpointData: Breakpoint.of(context) ?? const BreakpointData(),
      );
}
