part of flutter_adaptive_ui;

/// The signature of the [AdaptiveBuilder] builder function.
typedef AdaptiveWidgetBuilder = Widget Function(
    BuildContext context, Screen screen);

abstract class AdaptiveLayoutDelegate {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const AdaptiveLayoutDelegate._();

  @protected
  AdaptiveWidgetBuilder? getBuilder(Screen screen);
}

class AdaptiveLayoutDelegateWithScreenType implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithScreenType({
    this.defaultBuilder,
    this.smallHandset,
    this.mediumHandset,
    this.largeHandset,
    this.smallTablet,
    this.largeTablet,
    this.smallDesktop,
    this.mediumDesktop,
    this.largeDesktop,
  });

  final AdaptiveWidgetBuilder? defaultBuilder;
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
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    AdaptiveWidgetBuilder? b;

    switch (screen.screenType) {
      case ScreenType.smallHandset:
        b = smallHandset;
        break;
      case ScreenType.mediumHandset:
        b = mediumHandset;
        break;
      case ScreenType.largeHandset:
        b = largeHandset;
        break;
      case ScreenType.smallTablet:
        b = smallTablet;
        break;
      case ScreenType.largeTablet:
        b = largeTablet;
        break;
      case ScreenType.smallDesktop:
        b = smallDesktop;
        break;
      case ScreenType.mediumDesktop:
        b = mediumDesktop;
        break;
      case ScreenType.largeDesktop:
        b = largeDesktop;
        break;
    }

    return b ?? defaultBuilder;
  }
}

class AdaptiveLayoutDelegateWithMinimallScreenType
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithMinimallScreenType({
    this.defaultBuilder,
    this.handset,
    this.tablet,
    this.desktop,
  });

  final AdaptiveWidgetBuilder? defaultBuilder;
  final AdaptiveWidgetBuilder? handset;
  final AdaptiveWidgetBuilder? tablet;
  final AdaptiveWidgetBuilder? desktop;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    AdaptiveWidgetBuilder? b;
    switch (screen.screenType) {
      case ScreenType.smallHandset:
      case ScreenType.mediumHandset:
      case ScreenType.largeHandset:
        b = handset;
        break;
      case ScreenType.smallTablet:
      case ScreenType.largeTablet:
        b = tablet;
        break;
      case ScreenType.smallDesktop:
      case ScreenType.mediumDesktop:
      case ScreenType.largeDesktop:
        b = desktop;
        break;
    }

    return b ?? defaultBuilder;
  }
}

class AdaptiveLayoutDelegateWithScreenSize implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithScreenSize({
    this.defaultBuilder,
    this.xSmall,
    this.small,
    this.medium,
    this.large,
    this.xLarge,
  });

  final AdaptiveWidgetBuilder? defaultBuilder;
  final AdaptiveWidgetBuilder? xSmall;
  final AdaptiveWidgetBuilder? small;
  final AdaptiveWidgetBuilder? medium;
  final AdaptiveWidgetBuilder? large;
  final AdaptiveWidgetBuilder? xLarge;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    AdaptiveWidgetBuilder? b;

    switch (screen.screenSize) {
      case ScreenSize.xsmall:
        b = xSmall;
        break;
      case ScreenSize.small:
        b = small;
        break;
      case ScreenSize.medium:
        b = medium;
        break;
      case ScreenSize.large:
        b = large;
        break;
      case ScreenSize.xlarge:
        b = xLarge;
        break;
    }

    return b ?? defaultBuilder;
  }
}

class AdaptiveLayoutDelegateWithMinimallScreenSize
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithMinimallScreenSize({
    this.defaultBuilder,
    this.small,
    this.medium,
    this.large,
  });

  final AdaptiveWidgetBuilder? defaultBuilder;
  final AdaptiveWidgetBuilder? small;
  final AdaptiveWidgetBuilder? medium;
  final AdaptiveWidgetBuilder? large;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    AdaptiveWidgetBuilder? b;

    switch (screen.screenSize) {
      case ScreenSize.xsmall:
      case ScreenSize.small:
        b = small;
        break;
      case ScreenSize.medium:
        b = medium;
        break;
      case ScreenSize.large:
      case ScreenSize.xlarge:
        b = large;
        break;
    }

    return b ?? defaultBuilder;
  }
}

class AdaptiveLayoutDelegateWithSingleBuilder
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithSingleBuilder(this.builder);
  final AdaptiveWidgetBuilder builder;

  @override
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    return builder;
  }
}

class AdaptiveLayoutDelegateWithDesignLanguage
    implements AdaptiveLayoutDelegate {
  const AdaptiveLayoutDelegateWithDesignLanguage({
    this.defaultBuilder,
    this.material,
    this.cupertino,
    this.fluent,
  });

  final AdaptiveWidgetBuilder? defaultBuilder;
  final AdaptiveWidgetBuilder? material;
  final AdaptiveWidgetBuilder? cupertino;
  final AdaptiveWidgetBuilder? fluent;

  @override
  @protected
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    AdaptiveWidgetBuilder? b;

    switch (screen.designLanguage) {
      case DesignLanguage.material:
        b = material;
        break;
      case DesignLanguage.cupertino:
        b = cupertino;
        break;
      case DesignLanguage.fluent:
        b = fluent;
        break;
    }

    return b ?? defaultBuilder;
  }
}

/// Typical usage is as follows:
///
/// ```dart
/// class HomePage extends StatefulWidget {
///  const HomePage({Key? key}) : super(key: key);
///
///  @override
///  _HomePageState createState() => _HomePageState();
/// }
///
/// class _HomePageState extends State<HomePage> {
///  @override
///  Widget build(BuildContext context) {
///    return AdaptiveBuilder(
///      builder: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Default Builder'),
///        );
///      },
///      androidDelegate: _getAndroidDelegate(),
///      windowsDelegate: _getWindowsDelegate(),
///      linuxDelegate: _getLinuxDelegate(),
///      webDelegate: _getWebDelegate(),
///      allPlatformsDelegate: _getAlllatformsDelegate(),
///    );
///  }
///
///  AdaptiveLayoutDelegate? _getAndroidDelegate() {
///    return AdaptiveLayoutDelegateWithMinimallScreenType(
///      handset: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Android - Handset'),
///        );
///      },
///    );
///  }
///
///  AdaptiveLayoutDelegate? _getWindowsDelegate() {
///    return AdaptiveLayoutDelegateWithScreenType(
///      smallHandset: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Small handset'),
///        );
///      },
///      mediumHandset: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Medium handset'),
///        );
///      },
///      largeHandset: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Large handset'),
///        );
///      },
///      smallTablet: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Small Tablet'),
///        );
///      },
///      largeTablet: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Large Tablet'),
///        );
///      },
///      smallDesktop: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Small Desktop'),
///        );
///      },
///      mediumDesktop: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Medium Desktop'),
///        );
///      },
///      largeDesktop: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Windows - Large Desktop'),
///       );
///      },
///    );
///  }
///
///  AdaptiveLayoutDelegate? _getLinuxDelegate() {
///    return AdaptiveLayoutDelegateWithMinimallScreenType(
///      handset: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Linux - Handset'),
///        );
///      },
///      tablet: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Linux - Tablet'),
///        );
///      },
///      desktop: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Linux - Desktop'),
///        );
///      },
///    );
///  }
///
///  AdaptiveLayoutDelegate? _getWebDelegate() {
///    return AdaptiveLayoutDelegateWithScreenSize(
///      xSmall: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Web - X Small'),
///        );
///      },
///      medium: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Web - Medium'),
///        );
///      },
///      large: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('Web - large'),
///        );
///      },
///    );
///  }
///
///  AdaptiveLayoutDelegate? _getAlllatformsDelegate() {
///    return AdaptiveLayoutDelegateWithScreenSize(
///      xSmall: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('All OS - X Small'),
///        );
///      },
///      medium: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('All OS - Medium'),
///        );
///      },
///      large: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('All OS - large'),
///        );
///      },
///      xLarge: (BuildContext context, Screen screen) {
///        return const Center(
///          child: Text('All Platforms - X large'),
///        );
///      },
///    );
///  }
/// }
/// ```
///
/// See also:
///
///  * [AdaptiveLayoutDelegate]
///  * [Breakpoint]
///  * [BreakpointData]
///  * [Screen]
class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    Key? key,
    required this.defaultBuilder,
    this.androidDelegate,
    this.fuchsiaDelegate,
    this.iosDelegate,
    this.windowsDelegate,
    this.macosDelegate,
    this.linuxDelegate,
    this.webDelegate,
    this.allPlatformsDelegate,
    this.breakpointData,
  }) : super(key: key);

  final AdaptiveWidgetBuilder defaultBuilder;
  final AdaptiveLayoutDelegate? androidDelegate;
  final AdaptiveLayoutDelegate? fuchsiaDelegate;
  final AdaptiveLayoutDelegate? iosDelegate;
  final AdaptiveLayoutDelegate? windowsDelegate;
  final AdaptiveLayoutDelegate? linuxDelegate;
  final AdaptiveLayoutDelegate? macosDelegate;
  final AdaptiveLayoutDelegate? webDelegate;
  final AdaptiveLayoutDelegate? allPlatformsDelegate;
  final BreakpointData? breakpointData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        Screen screen = Screen(
          mediaQueryData: MediaQuery.of(context),
          breakpointData: breakpointData ??
              Breakpoint.of(context) ??
              const BreakpointData(),
          layoutConstraints: constraints,
        );

        AdaptiveWidgetBuilder? b;

        switch (screen.platform) {
          case PlatformType.web:
            b = webDelegate?.getBuilder(screen);
            break;
          case PlatformType.android:
            b = androidDelegate?.getBuilder(screen);
            break;
          case PlatformType.fuchsia:
            b = fuchsiaDelegate?.getBuilder(screen);
            break;
          case PlatformType.iOS:
            b = iosDelegate?.getBuilder(screen);
            break;
          case PlatformType.windows:
            b = windowsDelegate?.getBuilder(screen);
            break;
          case PlatformType.macOS:
            b = macosDelegate?.getBuilder(screen);
            break;
          case PlatformType.linux:
            b = linuxDelegate?.getBuilder(screen);
            break;
        }

        return b?.call(context, screen) ??
            allPlatformsDelegate?.getBuilder(screen)?.call(context, screen) ??
            defaultBuilder.call(context, screen);
      },
    );
  }
}
