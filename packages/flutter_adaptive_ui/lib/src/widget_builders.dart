part of flutter_adaptive_ui;

typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, Device device);

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({Key? key}) : super(key: key);

  // ///android
  // final AdaptiveWidgetBuilder? android;
  // final AdaptiveWidgetBuilder? androidSmallHandset;
  // final AdaptiveWidgetBuilder? androidMediumHandset;
  // final AdaptiveWidgetBuilder? androidLargeHandset;
  // final AdaptiveWidgetBuilder? androidSmallTablet;
  // final AdaptiveWidgetBuilder? androidLargeTablet;

  // ///ios
  // final AdaptiveWidgetBuilder? ios;
  // final AdaptiveWidgetBuilder? iosSmallHandset;
  // final AdaptiveWidgetBuilder? iosMediumHandset;
  // final AdaptiveWidgetBuilder? iosLargeHandset;
  // final AdaptiveWidgetBuilder? iosSmallTablet;
  // final AdaptiveWidgetBuilder? iosLargeTablet;

  // ///windows
  // final AdaptiveWidgetBuilder? windows;
  // final AdaptiveWidgetBuilder? windowsXSmallWindow;
  // final AdaptiveWidgetBuilder? windowsSmallWindow;
  // final AdaptiveWidgetBuilder? windowsMediumWindow;
  // final AdaptiveWidgetBuilder? windowsLargeWindow;
  // final AdaptiveWidgetBuilder? windowsXLargeWindow;

  // ///linux
  // final AdaptiveWidgetBuilder? linux;
  // final AdaptiveWidgetBuilder? linuxXSmallWindow;
  // final AdaptiveWidgetBuilder? linuxSmallWindow;
  // final AdaptiveWidgetBuilder? linuxMediumWindow;
  // final AdaptiveWidgetBuilder? linuxLargeWindow;
  // final AdaptiveWidgetBuilder? linuxXLargeWindow;

  // ///macos
  // final AdaptiveWidgetBuilder? macos;
  // final AdaptiveWidgetBuilder? macosXSmallWindow;
  // final AdaptiveWidgetBuilder? macosSmallWindow;
  // final AdaptiveWidgetBuilder? macosMediumWindow;
  // final AdaptiveWidgetBuilder? macosLargeWindow;
  // final AdaptiveWidgetBuilder? macosXLargeWindow;

  // ///web
  // final AdaptiveWidgetBuilder? web;
  // final AdaptiveWidgetBuilder? webXSmallWindow;
  // final AdaptiveWidgetBuilder? webSmallWindow;
  // final AdaptiveWidgetBuilder? webMediumWindow;
  // final AdaptiveWidgetBuilder? webLargeWindow;
  // final AdaptiveWidgetBuilder? webXLargeWindow;

  // ///handset
  // final AdaptiveWidgetBuilder? handset;
  // final AdaptiveWidgetBuilder? smallHandset;
  // final AdaptiveWidgetBuilder? mediumHandset;
  // final AdaptiveWidgetBuilder? largeHandset;

  // ///tablet
  // final AdaptiveWidgetBuilder? tablet;
  // final AdaptiveWidgetBuilder? smallTablet;
  // final AdaptiveWidgetBuilder? largeTablet;

  // ///desktop
  // final AdaptiveWidgetBuilder? desktop;
  // final AdaptiveWidgetBuilder? desktopXSmallWindow;
  // final AdaptiveWidgetBuilder? desktopSmallWindow;
  // final AdaptiveWidgetBuilder? desktopMediumWindow;
  // final AdaptiveWidgetBuilder? desktopLargeWindow;
  // final AdaptiveWidgetBuilder? desktopXLargeWindow;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({
    super.key,
    this.android,
    this.ios,
    this.windows,
    this.macos,
    this.linux,
    this.web,
    required this.orElse,
  });

  final AdaptiveWidgetBuilder? android;
  final AdaptiveWidgetBuilder? ios;
  final AdaptiveWidgetBuilder? windows;
  final AdaptiveWidgetBuilder? macos;
  final AdaptiveWidgetBuilder? linux;
  final AdaptiveWidgetBuilder? web;
  final AdaptiveWidgetBuilder orElse;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
