part of flutter_adaptive_ui;

typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, Device device);

abstract class AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegate._();

  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device);
}

class AdaptiveLayoutDelegateWithWindowType implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithWindowType(
    this.smallHandset,
    this.mediumHandset,
    this.largeHandset,
    this.smallTablet,
    this.largeTablet,
    this.desktop,
  );

  final AdaptiveWidgetBuilder? smallHandset;
  final AdaptiveWidgetBuilder? mediumHandset;
  final AdaptiveWidgetBuilder? largeHandset;
  final AdaptiveWidgetBuilder? smallTablet;
  final AdaptiveWidgetBuilder? largeTablet;
  final AdaptiveWidgetBuilder? desktop;

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
        return desktop;
    }
  }
}

class AdaptiveLayoutDelegateWithWindowSize implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithWindowSize(
    this.xSmall,
    this.small,
    this.medium,
    this.large,
    this.xLarge,
  );

  final AdaptiveWidgetBuilder? xSmall;
  final AdaptiveWidgetBuilder? small;
  final AdaptiveWidgetBuilder? medium;
  final AdaptiveWidgetBuilder? large;
  final AdaptiveWidgetBuilder? xLarge;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device) {
    switch (device.windowSize) {
      case WindowSize.xsmall:
        return xSmall;
      case WindowSize.small:
        return small;
      case WindowSize.medium:
        return medium;
      case WindowSize.large:
        return large;
      case WindowSize.xlarge:
        return xLarge;
    }
  }
}

class AdaptiveLayoutDelegateWithDesignLanguage
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithDesignLanguage(
    this.material,
    this.cupertino,
    this.fluent,
  );

  final AdaptiveWidgetBuilder? material;
  final AdaptiveWidgetBuilder? cupertino;
  final AdaptiveWidgetBuilder? fluent;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Device device) {
    switch (device.designLanguage) {
      case DesignLanguage.material:
        return material;
      case DesignLanguage.cupertino:
        return cupertino;
      case DesignLanguage.fluent:
        return fluent;
    }
  }
}

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    required this.builder,
    //android
    this.androidBuilder,
    //ios
    this.iosBuilder,
    //windows
    this.windowsBuilder,
    //macos
    this.macosBuilder,
    //linux
    this.linuxBuilder,
    //web
    this.webBuilder,
    this.allOsBuilder,
  });

  final AdaptiveWidgetBuilder builder;

  ///android
  final AdaptiveLayoutDelegate? androidBuilder;

  ///ios
  final AdaptiveLayoutDelegate? iosBuilder;

  ///windows
  final AdaptiveLayoutDelegate? windowsBuilder;

  ///linux
  final AdaptiveLayoutDelegate? linuxBuilder;

  ///macos
  final AdaptiveLayoutDelegate? macosBuilder;

  ///web
  final AdaptiveLayoutDelegate? webBuilder;

  final AdaptiveLayoutDelegate? allOsBuilder;

  @override
  Widget build(BuildContext context) {
    Device device = Device.fromMediaQuery(context);
    AdaptiveWidgetBuilder? b;

    if (device.isWeb) {
      b = webBuilder?.getBuilder(device);
    } else {
      switch (device.targetPlatform) {
        case TargetPlatform.android:
          b = androidBuilder?.getBuilder(device);
          break;
        case TargetPlatform.iOS:
          b = iosBuilder?.getBuilder(device);
          break;
        case TargetPlatform.windows:
          b = windowsBuilder?.getBuilder(device);
          break;
        case TargetPlatform.macOS:
          b = macosBuilder?.getBuilder(device);
          break;
        case TargetPlatform.linux:
          b = linuxBuilder?.getBuilder(device);
          break;
        case TargetPlatform.fuchsia:
          break;
      }
    }

    return b?.call(context, device) ??
        allOsBuilder?.getBuilder(device)?.call(context, device) ??
        builder.call(context, device);
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
