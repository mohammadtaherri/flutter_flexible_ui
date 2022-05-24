part of flutter_adaptive_ui;

class Device {
  Device(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    breakpoint = Breakpoint.fromMediaQuery(context);
    targetPlatform = defaultTargetPlatform;
    isWeb = kIsWeb;
  }

  late final MediaQueryData mediaQuery;
  late final Breakpoint breakpoint;
  late final TargetPlatform targetPlatform;
  late final bool isWeb;

  WindowSize get windowSize => breakpoint.windowSize;
  WindowType get windowType => breakpoint.windowType;
  int get columns => breakpoint.columns;
  double get gutters => breakpoint.gutters;
  double get margins => breakpoint.margins;

  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
  double get pixelRatio => mediaQuery.devicePixelRatio;
  double get physicalWidth => width * pixelRatio;
  double get physicalHeight => height * pixelRatio;
}
