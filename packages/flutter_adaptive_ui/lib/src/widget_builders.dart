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

class AdaptiveLayoutDelegateWithScreenType implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithScreenType({
    this.smallHandset,
    this.mediumHandset,
    this.largeHandset,
    this.smallTablet,
    this.largeTablet,
    this.smallDesktop,
    this.mediumDesktop,
    this.largeDesktop,
  });

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
    switch (device.screenType) {
      case ScreenType.smallHandset:
        return smallHandset;
      case ScreenType.mediumHandset:
        return mediumHandset;
      case ScreenType.largeHandset:
        return largeHandset;
      case ScreenType.smallTablet:
        return smallTablet;
      case ScreenType.largeTablet:
        return largeTablet;
      case ScreenType.smallDesktop:
        return smallDesktop;
      case ScreenType.mediumDesktop:
        return mediumDesktop;
      case ScreenType.largeDesktop:
        return largeDesktop;
    }
  }
}

class AdaptiveLayoutDelegateWithMinimallScreenType
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithMinimallScreenType({
    this.handset,
    this.tablet,
    this.desktop,
  });

  final AdaptiveWidgetBuilder? handset;
  final AdaptiveWidgetBuilder? tablet;
  final AdaptiveWidgetBuilder? desktop;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
    switch (device.screenType) {
      case ScreenType.smallHandset:
      case ScreenType.mediumHandset:
      case ScreenType.largeHandset:
        return handset;
      case ScreenType.smallTablet:
      case ScreenType.largeTablet:
        return tablet;
      case ScreenType.smallDesktop:
      case ScreenType.mediumDesktop:
      case ScreenType.largeDesktop:
        return desktop;
    }
  }
}

class AdaptiveLayoutDelegateWithScreenSize implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithScreenSize({
    this.xSmall,
    this.small,
    this.medium,
    this.large,
    this.xLarge,
  });

  final AdaptiveWidgetBuilder? xSmall;
  final AdaptiveWidgetBuilder? small;
  final AdaptiveWidgetBuilder? medium;
  final AdaptiveWidgetBuilder? large;
  final AdaptiveWidgetBuilder? xLarge;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(DeviceConfig device) {
    switch (device.screenSize) {
      case ScreenSize.xsmall:
        return xSmall;
      case ScreenSize.small:
        return small;
      case ScreenSize.medium:
        return medium;
      case ScreenSize.large:
        return large;
      case ScreenSize.xlarge:
        return xLarge;
    }
  }
}

class AdaptiveLayoutDelegateWithDesignLanguage
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithDesignLanguage({
    this.material,
    this.cupertino,
    this.fluent,
  });

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
    this.androidDelegate,
    this.fuchsiaDelegate,
    this.iosDelegate,
    this.windowsDelegate,
    this.macosDelegate,
    this.linuxDelegate,
    this.webDelegate,
    this.allOsDelegate,
    this.breakpointData,
  });

  final AdaptiveWidgetBuilder builder;
  final AdaptiveLayoutDelegate? androidDelegate;
  final AdaptiveLayoutDelegate? fuchsiaDelegate;
  final AdaptiveLayoutDelegate? iosDelegate;
  final AdaptiveLayoutDelegate? windowsDelegate;
  final AdaptiveLayoutDelegate? linuxDelegate;
  final AdaptiveLayoutDelegate? macosDelegate;
  final AdaptiveLayoutDelegate? webDelegate;
  final AdaptiveLayoutDelegate? allOsDelegate;
  final BreakpointData? breakpointData;

  @override
  Widget build(BuildContext context) {
    DeviceConfig device = DeviceConfig.fromMediaQueryAndBreakpoint(
      MediaQuery.of(context),
      breakpointData ?? Breakpoint.of(context) ?? const BreakpointData(),
    );
    AdaptiveWidgetBuilder? b;

    switch (device.platform) {
      case PlatformType.web:
        b = webDelegate?.getBuilder(device);
        break;
      case PlatformType.android:
        b = androidDelegate?.getBuilder(device);
        break;
      case PlatformType.fuchsia:
        b = fuchsiaDelegate?.getBuilder(device);
        break;
      case PlatformType.iOS:
        b = iosDelegate?.getBuilder(device);
        break;
      case PlatformType.windows:
        b = windowsDelegate?.getBuilder(device);
        break;
      case PlatformType.macOS:
        b = macosDelegate?.getBuilder(device);
        break;
      case PlatformType.linux:
        b = linuxDelegate?.getBuilder(device);
        break;
    }

    return b?.call(context, device) ??
        allOsDelegate?.getBuilder(device)?.call(context, device) ??
        builder.call(context, device);
  }
}
