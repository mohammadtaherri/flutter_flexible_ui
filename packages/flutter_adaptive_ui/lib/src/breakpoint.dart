part of flutter_adaptive_ui;

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

  final double small;
  final double medium;
  final double large;
  final double xlarge;

  final double smallDesktop;
  final double mediumHandset;
  final double largeHandset;
  final double smallTablet;
  final double largeTablet;
  final double mediumDesktop;
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

class Breakpoint extends InheritedWidget {
  const Breakpoint({
    super.key,
    this.breakPointData = const BreakpointData(),
    required super.child,
  });
  final BreakpointData breakPointData;

  @override
  bool updateShouldNotify(covariant Breakpoint oldWidget) {
    return oldWidget.breakPointData != breakPointData;
  }

  /// Find the current [BreakPointData] in the widget tree.
  static BreakpointData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Breakpoint>()
        ?.breakPointData;
  }
}
