part of flutter_adaptive_ui;

typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, Device device);

typedef BreakpointWidgetBuilder = Widget Function(
    BuildContext context, Breakpoint breakpoint);

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
    Device device = Device(context);

    Widget? child;

    if (device.targetPlatform == TargetPlatform.android) {
      child = android?.call(context, device);
    }

    if (device.targetPlatform == TargetPlatform.iOS) {
      child = ios?.call(context, device);
    }

    if (device.targetPlatform == TargetPlatform.windows) {
      child = windows?.call(context, device);
    }

    if (device.targetPlatform == TargetPlatform.macOS) {
      child = macos?.call(context, device);
    }

    if (device.targetPlatform == TargetPlatform.linux) {
      child = linux?.call(context, device);
    }

    if (device.isWeb) {
      child = web?.call(context, device);
    }

    return child ?? orElse(context, device);
  }
}

class WindowBuilder extends StatelessWidget {
  const WindowBuilder({
    super.key,
    this.xSmall,
    this.small,
    this.medium,
    this.large,
    this.xLarge,
    required this.orElse,
  });

  final AdaptiveWidgetBuilder? xSmall;
  final AdaptiveWidgetBuilder? small;
  final AdaptiveWidgetBuilder? medium;
  final AdaptiveWidgetBuilder? large;
  final AdaptiveWidgetBuilder? xLarge;
  final AdaptiveWidgetBuilder orElse;

  @override
  Widget build(BuildContext context) {
    Device device = Device(context);

    Widget? child;

    switch (device.windowSize) {
      case WindowSize.xsmall:
        child = xSmall?.call(context, device);
        break;
      case WindowSize.small:
        child = small?.call(context, device);
        break;
      case WindowSize.medium:
        child = medium?.call(context, device);
        break;
      case WindowSize.large:
        child = large?.call(context, device);
        break;
      case WindowSize.xlarge:
        child = xLarge?.call(context, device);
        break;
    }

    return child ?? orElse(context, device);
  }
}

class BreakpointBuilder extends StatelessWidget {
  const BreakpointBuilder({
    super.key,
    required this.builder,
  }) : _fromConstraints = false;

  const BreakpointBuilder.fromConstraints({
    super.key,
    required this.builder,
  }) : _fromConstraints = true;

  final BreakpointWidgetBuilder builder;
  final bool _fromConstraints;

  @override
  Widget build(BuildContext context) {
    if (_fromConstraints) {
      return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) => builder.call(
          ctx,
          Breakpoint.fromConstraints(constraints),
        ),
      );
    }

    return builder(
      context,
      Breakpoint.fromMediaQuery(context),
    );
  }
}
