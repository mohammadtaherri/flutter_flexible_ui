part of flutter_adaptive_ui;

typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, Device device);

abstract class AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegate._();

  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device);
}

class AdaptiveLayoutDelegateForHandset implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateForHandset(
    this.smallHandset,
    this.mediumHandset,
    this.largeHandset,
    this.smallTablet,
    this.largeTablet,
  );

  final AdaptiveWidgetBuilder? smallHandset;
  final AdaptiveWidgetBuilder? mediumHandset;
  final AdaptiveWidgetBuilder? largeHandset;
  final AdaptiveWidgetBuilder? smallTablet;
  final AdaptiveWidgetBuilder? largeTablet;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device) {
    switch (device.windowType) {
      case WindowType.smallHandset:
        return smallHandset;
      case WindowType.mediumHandset:
        return mediumHandset;
      case WindowType.largeHandset:
        return largeHandset;
      case WindowType.smallTablet:
        return smallTablet;
      case WindowType.largeTablet:
        return largeTablet;
      case WindowType.desktop:
        return null;
    }
  }
}

class AdaptiveLayoutDelegateForDesktop implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateForDesktop(
    this.xSmallWindow,
    this.smallWindow,
    this.mediumWindow,
    this.largeWindow,
    this.xLargeWindow,
  );

  final AdaptiveWidgetBuilder? xSmallWindow;
  final AdaptiveWidgetBuilder? smallWindow;
  final AdaptiveWidgetBuilder? mediumWindow;
  final AdaptiveWidgetBuilder? largeWindow;
  final AdaptiveWidgetBuilder? xLargeWindow;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device) {
    switch (device.windowSize) {
      case WindowSize.xsmall:
        return xSmallWindow;
      case WindowSize.small:
        return smallWindow;
      case WindowSize.medium:
        return mediumWindow;
      case WindowSize.large:
        return largeWindow;
      case WindowSize.xlarge:
        return xLargeWindow;
    }
  }
}

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    required this.builder,
    //android
    this.android,
    //ios
    this.ios,
    //windows
    this.windows,
    //macos
    this.macos,
    //linux
    this.linux,
    //web
    this.web,
    //default
    this.targetSize,
  });

  final AdaptiveWidgetBuilder builder;

  ///android
  final AdaptiveLayoutDelegateForHandset? android;

  ///ios
  final AdaptiveLayoutDelegateForHandset? ios;

  ///windows
  final AdaptiveLayoutDelegateForDesktop? windows;

  ///linux
  final AdaptiveLayoutDelegateForDesktop? linux;

  ///macos
  final AdaptiveLayoutDelegateForDesktop? macos;

  ///web
  final AdaptiveLayoutDelegateForDesktop? web;

  ///window size
  final AdaptiveLayoutDelegateForDesktop? targetSize;

  @override
  Widget build(BuildContext context) {
    Device device = Device.fromMediaQuery(context);
    AdaptiveWidgetBuilder? b;

    if (device.isWeb) {
      b = web?.getBuilder(device);
    } else {
      switch (device.targetPlatform) {
        case TargetPlatform.android:
          b = android?.getBuilder(device);
          break;
        case TargetPlatform.iOS:
          b = ios?.getBuilder(device);
          break;
        case TargetPlatform.windows:
          b = windows?.getBuilder(device);
          break;
        case TargetPlatform.macOS:
          b = macos?.getBuilder(device);
          break;
        case TargetPlatform.linux:
          b = linux?.getBuilder(device);
          break;
        case TargetPlatform.fuchsia:
          break;
      }
    }

    b = b ?? targetSize?.getBuilder(device);

    return b?.call(context, device) ?? builder.call(context, device);
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
    Device device = Device.fromMediaQuery(context);

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
    Device device = Device.fromMediaQuery(context);

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
