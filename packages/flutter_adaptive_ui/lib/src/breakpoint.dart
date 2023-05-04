part of flutter_adaptive_ui;

/// Defines the configuration of the [Breakpoint].
///
///  See also:
///
///  * [Breakpoint]
class BreakpointData {
  const BreakpointData({
    this.minSmallScreenWidth = defaultMinSmallScreenWidth,
    this.minMediumScreenWidth = defaultMinMediumScreenWidth,
    this.minLargeScreenWidth = defaultMinLargeScreenWidth,
    this.minXLargeScreenWidth = defaultMinXLargeScreenWidth,
    this.minMediumHandsetWith = defaultMinMediumHandsetWidth,
    this.minLargeHandsetWith = defaultMinLargeHandsetWidth,
    this.minSmallTabletWidth = defaultMinSmallTabletWidth,
    this.minLargeTabletWidth = defaultMinLargeTabletWidth,
    this.minSmallDesktopWidth = defaultMinSmallDesktopWidth,
    this.minMediumDesktopWidth = defaultMinMediumDesktopWidth,
    this.minLargeDesktopWidth = defaultMinLargeDesktopWidth,
  });

  /// The minimum width of the Small Screen
  final double minSmallScreenWidth;

  /// The minimum  width of the Medium window
  final double minMediumScreenWidth;

  /// The minimum width of the Large Screen
  final double minLargeScreenWidth;

  /// The minimum width of the XLarge Screen
  final double minXLargeScreenWidth;

  /// The minimum width of the Medium Handset
  final double minMediumHandsetWith;

  /// The minimum width of the Large Handset
  final double minLargeHandsetWith;

  /// The minimum width of the Small Tablet
  final double minSmallTabletWidth;

  /// The minimum width of the Large Tablet
  final double minLargeTabletWidth;

  /// The minimum width of the Small Desktop
  final double minSmallDesktopWidth;

  /// The minimum width of the Medium Desktop
  final double minMediumDesktopWidth;

  /// The minimum width of the Large Desktop
  final double minLargeDesktopWidth;

  ScreenSize _getScreenSize(double width) {
    debugAssertIsValid();
    if (width >= minXLargeScreenWidth) return ScreenSize.xlarge;
    if (width >= minLargeScreenWidth) return ScreenSize.large;
    if (width >= minMediumScreenWidth) return ScreenSize.medium;
    if (width >= minSmallScreenWidth) return ScreenSize.small;
    return ScreenSize.xsmall;
  }

  ScreenType _getScreenType(double width) {
    debugAssertIsValid();
    if (width >= minLargeDesktopWidth) return ScreenType.largeDesktop;
    if (width >= minMediumDesktopWidth) return ScreenType.mediumDesktop;
    if (width >= minSmallDesktopWidth) return ScreenType.smallDesktop;
    if (width >= minLargeTabletWidth) return ScreenType.largeTablet;
    if (width >= minSmallTabletWidth) return ScreenType.smallTablet;
    if (width >= minLargeHandsetWith) return ScreenType.largeHandset;
    if (width >= minMediumHandsetWith) return ScreenType.mediumHandset;
    return ScreenType.smallHandset;
  }

  BreakpointData copyWith({
    double? minSmallScreenWidth,
    double? minMediumScreenWidth,
    double? minLargeScreenWidth,
    double? minXLargeScreenWidth,
    double? minMediumHandsetWith,
    double? minLargeHandsetWith,
    double? minSmallTabletWidth,
    double? minLargeTabletWidth,
    double? minSmallDesktopWidth,
    double? minMediumDesktopWidth,
    double? minLargeDesktopWidth,
  }) =>
      BreakpointData(
        minSmallScreenWidth: minSmallScreenWidth ?? this.minSmallScreenWidth,
        minMediumScreenWidth: minMediumScreenWidth ?? this.minMediumScreenWidth,
        minLargeScreenWidth: minLargeScreenWidth ?? this.minLargeScreenWidth,
        minXLargeScreenWidth: minXLargeScreenWidth ?? this.minXLargeScreenWidth,
        minMediumHandsetWith: minMediumHandsetWith ?? this.minMediumHandsetWith,
        minLargeHandsetWith: minLargeHandsetWith ?? this.minLargeHandsetWith,
        minSmallTabletWidth: minSmallTabletWidth ?? this.minSmallTabletWidth,
        minLargeTabletWidth: minLargeTabletWidth ?? this.minLargeTabletWidth,
        minSmallDesktopWidth: minSmallDesktopWidth ?? this.minSmallDesktopWidth,
        minMediumDesktopWidth: minMediumDesktopWidth ?? this.minMediumDesktopWidth,
        minLargeDesktopWidth: minLargeDesktopWidth ?? this.minLargeDesktopWidth,
      );

  @override
  bool operator ==(Object other) {
    if (other is! BreakpointData) return false;
    if (identical(this, other)) return true;

    if (minSmallScreenWidth != other.minSmallScreenWidth) return false;
    if (minMediumScreenWidth != other.minMediumScreenWidth) return false;
    if (minLargeScreenWidth != other.minLargeScreenWidth) return false;
    if (minXLargeScreenWidth != other.minXLargeScreenWidth) return false;
    if (minMediumHandsetWith != other.minMediumHandsetWith) return false;
    if (minLargeHandsetWith != other.minLargeHandsetWith) return false;
    if (minSmallTabletWidth != other.minSmallTabletWidth) return false;
    if (minLargeTabletWidth != other.minLargeTabletWidth) return false;
    if (minSmallDesktopWidth != other.minSmallDesktopWidth) return false;
    if (minMediumDesktopWidth != other.minMediumDesktopWidth) return false;
    if (minLargeDesktopWidth != other.minLargeDesktopWidth) return false;

    return true;
  }

  @override
  int get hashCode =>
      minSmallScreenWidth.hashCode ^
      minMediumScreenWidth.hashCode ^
      minLargeScreenWidth.hashCode ^
      minXLargeScreenWidth.hashCode ^
      minMediumHandsetWith.hashCode ^
      minLargeHandsetWith.hashCode ^
      minSmallTabletWidth.hashCode ^
      minLargeTabletWidth.hashCode ^
      minSmallDesktopWidth.hashCode ^
      minMediumDesktopWidth.hashCode ^
      minLargeDesktopWidth.hashCode;

  void debugAssertIsValid() {
    void check(double size1, double size2, String label1, String label2) {
      assert(size2 > size1, '$label2 must be greater than $label1');
    }

    check(
      minSmallScreenWidth,
      minMediumScreenWidth,
      'minSmallScreenWidth',
      'minMediumScreenWidth',
    );
    check(
      minMediumScreenWidth,
      minLargeScreenWidth,
      'minMediumScreenWidth',
      'minLargeScreenWidth',
    );
    check(
      minLargeScreenWidth,
      minXLargeScreenWidth,
      'minLargeScreenWidth',
      'minXLargeScreenWidth',
    );

    check(
      minMediumHandsetWith,
      minLargeHandsetWith,
      'minMediumHandsetWith',
      'minLargeHandsetWith',
    );
    check(
      minLargeHandsetWith,
      minSmallTabletWidth,
      'minLargeHandsetWith',
      'minSmallTabletWidth',
    );
    check(
      minSmallTabletWidth,
      minLargeTabletWidth,
      'minSmallTabletWidth',
      'minLargeTabletWidth',
    );
    check(
      minLargeTabletWidth,
      minSmallDesktopWidth,
      'minLargeTabletWidth',
      'minSmallDesktopWidth',
    );
    check(
      minSmallDesktopWidth,
      minMediumDesktopWidth,
      'minSmallDesktopWidth',
      'minMediumDesktopWidth',
    );
    check(
      minMediumDesktopWidth,
      minLargeDesktopWidth,
      'minMediumDesktopWidth',
      'minLargeDesktopWidth',
    );
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
    return context.dependOnInheritedWidgetOfExactType<Breakpoint>()?.breakpointData;
  }
}
