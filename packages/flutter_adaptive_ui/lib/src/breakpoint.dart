part of flutter_adaptive_ui;

abstract class BreakpointData {
  const BreakpointData.constructor();

  const factory BreakpointData({
    required double small,
    required double medium,
    required double large,
    required double xlarge,
    required double mediumHandset,
    required double largeHandset,
    required double smallTablet,
    required double largeTablet,
    required double smallDesktop,
    required double mediumDesktop,
    required double largeDesktop,
  }) = _CustomBreakpointData;

  const factory BreakpointData.dftl() = _DefaultBreakpointData;

  double get small;
  double get medium;
  double get large;
  double get xlarge;

  double get mediumHandset;
  double get largeHandset;
  double get smallTablet;
  double get largeTablet;
  double get smallDesktop;
  double get mediumDesktop;
  double get largeDesktop;

  ScreenSize getScreenSize(double widht) {
    debugAssertIsValid();
    if (widht >= xlarge) return ScreenSize.xlarge;
    if (widht >= large) return ScreenSize.large;
    if (widht >= medium) return ScreenSize.medium;
    if (widht >= small) return ScreenSize.small;
    return ScreenSize.xsmall;
  }

  ScreenType getScreenType(double width) {
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

class _DefaultBreakpointData extends BreakpointData {
  const _DefaultBreakpointData() : super.constructor();

  @override
  double get small => defaultMinSmallScreenWidth;

  @override
  double get medium => defaultMinMediumScreenWidth;

  @override
  double get large => defaultMinLargeScreenWidth;

  @override
  double get xlarge => defaultMinXLargeScreenWidth;

  @override
  double get mediumHandset => defaultMinMediumhandsetScreenWidth;

  @override
  double get largeHandset => defaultMinLargehandsetScreenWidth;

  @override
  double get smallTablet => defaultMinSmallTabletScreenWidth;

  @override
  double get largeTablet => defaultMinLargeTabletScreenWidth;

  @override
  double get smallDesktop => defaultMinSmallDesktopScreenWidth;

  @override
  double get mediumDesktop => defaultMinMediumDesktopScreenWidth;

  @override
  double get largeDesktop => defaultMinLargeDesktopScreenWidth;
}

class _CustomBreakpointData extends BreakpointData {
  const _CustomBreakpointData({
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
    required this.mediumHandset,
    required this.largeHandset,
    required this.smallTablet,
    required this.largeTablet,
    required this.smallDesktop,
    required this.mediumDesktop,
    required this.largeDesktop,
  }) : super.constructor();

  @override
  final double largeDesktop;

  @override
  final double largeHandset;

  @override
  final double largeTablet;

  @override
  final double medium;

  @override
  final double mediumDesktop;

  @override
  final double mediumHandset;

  @override
  final double small;

  @override
  final double smallDesktop;

  @override
  final double smallTablet;

  @override
  final double xlarge;

  @override
  final double large;
}

class Breakpoint extends InheritedWidget {
  const Breakpoint({
    super.key,
    this.breakPointData = const BreakpointData.dftl(),
    required super.child,
  });
  final BreakpointData breakPointData;

  @override
  bool updateShouldNotify(covariant Breakpoint oldWidget) {
    return oldWidget.breakPointData != breakPointData;
  }

  static BreakpointData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<Breakpoint>()
            ?.breakPointData ??
        const BreakpointData.dftl();
  }

  static BreakpointData? meybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Breakpoint>()
        ?.breakPointData;
  }
}
