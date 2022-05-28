part of flutter_adaptive_ui;

/// Defines the configuration of the [Breakpoint].
///
///  See also:
///
///  * [Breakpoint]
class BreakpointData {
  const BreakpointData({
    this.small = defaultMinSmallScreenWidth,
    this.medium = defaultMinMediumScreenWidth,
    this.large = defaultMinLargeScreenWidth,
    this.xlarge = defaultMinXLargeScreenWidth,
    this.mediumHandset = defaultMinMediumHandsetScreenWidth,
    this.largeHandset = defaultMinLargeHandsetScreenWidth,
    this.smallTablet = defaultMinSmallTabletScreenWidth,
    this.largeTablet = defaultMinLargeTabletScreenWidth,
    this.smallDesktop = defaultMinSmallDesktopScreenWidth,
    this.mediumDesktop = defaultMinMediumDesktopScreenWidth,
    this.largeDesktop = defaultMinLargeDesktopScreenWidth,
  });

  /// The minimum screen width of Small window
  final double small;

  /// The minimum screen width of Medium window
  final double medium;

  /// The minimum screen width of Large window
  final double large;

  /// The minimum screen width of X Large window
  final double xlarge;

  /// The minimum screen width of Medium Handset
  final double mediumHandset;

  /// The minimum screen width of Large Handset
  final double largeHandset;

  /// The minimum screen width of Small Tablet
  final double smallTablet;

  /// The minimum screen width of Large Tablet
  final double largeTablet;

  /// The minimum screen width of Small Desktop
  final double smallDesktop;

  /// The minimum screen width of Medium Desktop
  final double mediumDesktop;

  /// The minimum screen width of Large Desktop
  final double largeDesktop;

  ScreenSize _getScreenSize(double widht) {
    debugAssertIsValid();
    if (widht >= xlarge) return ScreenSize.xlarge;
    if (widht >= large) return ScreenSize.large;
    if (widht >= medium) return ScreenSize.medium;
    if (widht >= small) return ScreenSize.small;
    return ScreenSize.xsmall;
  }

  ScreenType _getScreenType(double width) {
    debugAssertIsValid();
    if (width >= largeDesktop) return ScreenType.largeDesktop;
    if (width >= mediumDesktop) return ScreenType.mediumDesktop;
    if (width >= smallDesktop) return ScreenType.smallDesktop;
    if (width >= largeTablet) return ScreenType.largeTablet;
    if (width >= smallTablet) return ScreenType.smallTablet;
    if (width >= largeHandset) return ScreenType.largeHandset;
    if (width >= mediumHandset) return ScreenType.mediumHandset;
    return ScreenType.smallHandset;
  }

  BreakpointData copyWith({
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? mediumHandset,
    double? largeHandset,
    double? smallTablet,
    double? largeTablet,
    double? smallDesktop,
    double? mediumDesktop,
    double? largeDesktop,
  }) =>
      BreakpointData(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
        xlarge: xlarge ?? this.xlarge,
        mediumHandset: mediumHandset ?? this.mediumHandset,
        largeHandset: largeHandset ?? this.largeHandset,
        smallTablet: smallTablet ?? this.smallTablet,
        largeTablet: largeTablet ?? this.largeTablet,
        smallDesktop: smallDesktop ?? this.smallDesktop,
        mediumDesktop: mediumDesktop ?? this.mediumDesktop,
        largeDesktop: largeDesktop ?? this.largeDesktop,
      );

  @override
  bool operator ==(Object other) {
    if (other is! BreakpointData) return false;
    if (identical(this, other)) return true;

    if (small != other.small) return false;
    if (medium != other.medium) return false;
    if (large == other.large) return false;
    if (xlarge != other.xlarge) return false;
    if (mediumHandset != other.mediumHandset) return false;
    if (largeHandset != other.largeHandset) return false;
    if (smallTablet != other.smallTablet) return false;
    if (largeTablet != other.largeTablet) return false;
    if (smallDesktop != other.smallDesktop) return false;
    if (mediumDesktop != other.mediumDesktop) return false;
    if (largeDesktop != other.largeDesktop) return false;
    return true;
  }

  @override
  int get hashCode =>
      small.hashCode ^
      medium.hashCode ^
      large.hashCode ^
      xlarge.hashCode ^
      mediumHandset.hashCode ^
      largeHandset.hashCode ^
      smallTablet.hashCode ^
      largeTablet.hashCode ^
      smallDesktop.hashCode ^
      mediumDesktop.hashCode ^
      largeDesktop.hashCode;

  void debugAssertIsValid() {
    void check(double size1, double size2, String label1, String label2) {
      assert(size2 > size1, '$label2 must be greater than $label1');
    }

    check(small, medium, 'small', 'medium');
    check(medium, large, 'medium', 'large');
    check(large, xlarge, 'large', 'xlarge');

    check(mediumHandset, largeHandset, 'mediumHandset', 'largeHandset');
    check(largeHandset, smallTablet, 'largeHandset', 'smallTablet');
    check(smallTablet, largeTablet, 'smallTablet', 'largeTablet');
    check(largeTablet, smallDesktop, 'largeTablet', 'smallDesktop');
    check(smallDesktop, mediumDesktop, 'smallDesktop', 'mediumDesktop');
    check(mediumDesktop, largeDesktop, 'mediumDesktop', 'largeDesktop');
  }
}

/// Applies a [BreakpointData] to descendant widgets.
///
/// Descendant widgets obtain the current [BreakpointData] object using
/// [Breakpoint.of]. When a widget uses [Breakpoint.of], it is automatically rebuilt if
/// the [BreakpointData] later changes, so that the changes can be applied.
///
/// Typical usage is as follows:
///
/// ```dart
/// main() {
///  runApp(const MyApp());
/// }
///
/// class MyApp extends StatelessWidget {
///  const MyApp({Key? key}) : super(key: key);
///
///  @override
///  Widget build(BuildContext context) {
///    return const Breakpoint(
///      // Use default sizes or override.
///      breakPointData: BreakpointData(
///        // Base on [ScreenSize] (xSmall , small , medium , large , xLarge)
///        small: 600,
///        medium: 1024,
///        large: 1440,
///        xlarge: 1920,
///        // Base on [ScreenType] (smallHandset , mediumHandset , largeHandset , smallTablet , largetablet , smallDesktop , mediumDesktop , largeDesktop)
///        mediumHandset: 360,
///        largeHandset: 400,
///        smallTablet: 600,
///        largeTablet: 720,
///        smallDesktop: 1024,
///        mediumDesktop: 1440,
///        largeDesktop: 1920,
///      ),
///      child: MaterialApp(
///        home: HomePage(),
///      ),
///    );
///  }
/// }
/// ```
///
/// See also:
///
///  * [AdaptiveBuilder]
///  * [AdaptiveLayoutDelegate]
///  * [BreakpointData]
///  * [Screen]
///  * [MaterialApp]
///  * [WidgetsApp]
class Breakpoint extends InheritedWidget {
  const Breakpoint({
    Key? key,
    this.breakpointData = const BreakpointData(),
    required Widget child,
  }) : super(key: key, child: child);
  final BreakpointData breakpointData;

  @override
  bool updateShouldNotify(covariant Breakpoint oldWidget) {
    return oldWidget.breakpointData != breakpointData;
  }

  /// The [breakPointData] from the closest [Breakpoint] instance that encloses the given
  /// context.
  static BreakpointData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Breakpoint>()
        ?.breakpointData;
  }
}
