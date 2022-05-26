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
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    switch (screen.screenType) {
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
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    switch (screen.screenType) {
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
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    switch (screen.screenSize) {
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
  AdaptiveWidgetBuilder? getBuilder(Screen screen) {
    switch (screen.designLanguage) {
      case DesignLanguage.material:
        return material;
      case DesignLanguage.cupertino:
        return cupertino;
      case DesignLanguage.fluent:
        return fluent;
    }
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
    super.key,
    required this.builder,
    this.androidDelegate,
    this.fuchsiaDelegate,
    this.iosDelegate,
    this.windowsDelegate,
    this.macosDelegate,
    this.linuxDelegate,
    this.webDelegate,
    this.allPlatformsDelegate,
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
            builder.call(context, screen);
      },
    );
  }
}
