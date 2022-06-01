import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Breakpoint(
      // Use default sizes or override.
      breakpointData: BreakpointData(
        // Based on [ScreenSize] (xSmall , small , medium , large , xLarge)
        minSmallScreenWidth: 600,
        minMediumScreenWidth: 1024,
        minLargeScreenWidth: 1440,
        minXLargeScreenWidth: 1920,
        // Based on [ScreenType] (smallHandset , mediumHandset , largeHandset , smallTablet , largetablet , smallDesktop , mediumDesktop , largeDesktop)
        minMediumHandsetWith: 360,
        minLargeHandsetWith: 400,
        minSmallTabletWidth: 600,
        minLargeTabletWidth: 720,
        minSmallDesktopWidth: 1024,
        minMediumDesktopWidth: 1440,
        minLargeDesktopWidth: 1920,
      ),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      defaultBuilder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
      androidDelegate: _getAndroidDelegate(),
      windowsDelegate: _getWindowsDelegate(),
      linuxDelegate: _getLinuxDelegate(),
      webDelegate: _getWebDelegate(),
      allPlatformsDelegate: _getAllPlatformsDelegate(),
    );
  }

  AdaptiveLayoutDelegate? _getAndroidDelegate() {
    return AdaptiveLayoutDelegateWithMinimallScreenType(
      defaultBuilder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Android - Default'),
        );
      },
      handset: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Android - Handset'),
        );
      },
    );
  }

  AdaptiveLayoutDelegate? _getWindowsDelegate() {
    return AdaptiveLayoutDelegateWithScreenType(
      smallHandset: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Small handset'),
        );
      },
      mediumHandset: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Medium handset'),
        );
      },
      largeHandset: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Large handset'),
        );
      },
      smallTablet: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Small Tablet'),
        );
      },
      largeTablet: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Large Tablet'),
        );
      },
      smallDesktop: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Small Desktop'),
        );
      },
      mediumDesktop: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Medium Desktop'),
        );
      },
      largeDesktop: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Windows - Large Desktop'),
        );
      },
    );
  }

  AdaptiveLayoutDelegate? _getLinuxDelegate() {
    return AdaptiveLayoutDelegateWithMinimallScreenType(
      handset: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Linux - Handset'),
        );
      },
      tablet: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Linux - Tablet'),
        );
      },
      desktop: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Linux - Desktop'),
        );
      },
    );
  }

  AdaptiveLayoutDelegate? _getWebDelegate() {
    return AdaptiveLayoutDelegateWithScreenSize(
      xSmall: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Web - X Small'),
        );
      },
      medium: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Web - Medium'),
        );
      },
      large: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Web - large'),
        );
      },
    );
  }

  AdaptiveLayoutDelegate? _getAllPlatformsDelegate() {
    return AdaptiveLayoutDelegateWithScreenSize(
      xSmall: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('All OS - X Small'),
        );
      },
      medium: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('All OS - Medium'),
        );
      },
      large: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('All OS - large'),
        );
      },
      xLarge: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('All Platforms - X large'),
        );
      },
    );
  }
}
