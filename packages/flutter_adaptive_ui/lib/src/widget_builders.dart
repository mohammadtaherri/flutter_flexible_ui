part of flutter_adaptive_ui;

/// The signature of the [AdaptiveBuilder] builder function.
typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, DeviceConfig device);

abstract class AdaptiveLayoutDelegate {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const AdaptiveLayoutDelegate._();

  @protected
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device);
}

class AdaptiveLayoutDelegateWithWindowType implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithWindowType(
    this.smallHandset,
    this.mediumHandset,
    this.largeHandset,
    this.smallTablet,
    this.largeTablet,
    this.smallDesktop,
    this.mediumDesktop,
    this.largeDesktop,
  );

  final AdaptiveWidgetBuilder? smallHandset;
  final AdaptiveWidgetBuilder? mediumHandset;
  final AdaptiveWidgetBuilder? largeHandset;
  final AdaptiveWidgetBuilder? smallTablet;
  final AdaptiveWidgetBuilder? largeTablet;
  final AdaptiveWidgetBuilder? smallDesktop;
  final AdaptiveWidgetBuilder? mediumDesktop;
  final AdaptiveWidgetBuilder? largeDesktop;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
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
      case WindowType.smallDesktop:
        return smallDesktop;
      case WindowType.mediumDesktop:
        return mediumDesktop;
      case WindowType.largeDesktop:
        return largeDesktop;
    }
  }
}

class AdaptiveLayoutDelegateWithMinimallWindowType
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithMinimallWindowType(
    this.handset,
    this.tablet,
    this.desktop,
  );

  final AdaptiveWidgetBuilder? handset;
  final AdaptiveWidgetBuilder? tablet;
  final AdaptiveWidgetBuilder? desktop;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
    switch (device.windowType) {
      case WindowType.smallHandset:
      case WindowType.mediumHandset:
      case WindowType.largeHandset:
        return handset;
      case WindowType.smallTablet:
      case WindowType.largeTablet:
        return tablet;
      case WindowType.smallDesktop:
      case WindowType.mediumDesktop:
      case WindowType.largeDesktop:
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
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
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
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
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
    this.androidBuilder,
    this.fuchsiaBuilder,
    this.iosBuilder,
    this.windowsBuilder,
    this.macosBuilder,
    this.linuxBuilder,
    this.webBuilder,
    this.allOsBuilder,
  });

  final AdaptiveWidgetBuilder builder;
  final AdaptiveLayoutDelegate? androidBuilder;
  final AdaptiveLayoutDelegate? fuchsiaBuilder;
  final AdaptiveLayoutDelegate? iosBuilder;
  final AdaptiveLayoutDelegate? windowsBuilder;
  final AdaptiveLayoutDelegate? linuxBuilder;
  final AdaptiveLayoutDelegate? macosBuilder;
  final AdaptiveLayoutDelegate? webBuilder;
  final AdaptiveLayoutDelegate? allOsBuilder;

  @override
  Widget build(BuildContext context) {
    DeviceConfig device = DeviceConfig.fromMediaQuery(context);
    AdaptiveWidgetBuilder? b;

    if (device.isWeb) {
      b = webBuilder?.getBuilder(device);
    } else {
      switch (device.targetPlatform) {
        case TargetPlatform.android:
          b = androidBuilder?.getBuilder(device);
          break;
        case TargetPlatform.fuchsia:
          b = fuchsiaBuilder?.getBuilder(device);
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
      }
    }

    return b?.call(context, device) ??
        allOsBuilder?.getBuilder(device)?.call(context, device) ??
        builder.call(context, device);
  }
}
