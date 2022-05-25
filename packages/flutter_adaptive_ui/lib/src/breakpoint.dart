part of flutter_adaptive_ui;

abstract class BreakPointData {
  BreakPointData._() {
    debugAssertIsValid();
  }

  factory BreakPointData({
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

  factory BreakPointData.dftl() = _DefaultBreakpointData;

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
    if (widht >= xlarge) return ScreenSize.xlarge;
    if (widht >= large) return ScreenSize.large;
    if (widht >= medium) return ScreenSize.medium;
    if (widht >= small) return ScreenSize.small;
    return ScreenSize.xsmall;
  }

  ScreenType getScreenType(double width) {
    if (width >= largeDesktop) return ScreenType.largeDesktop;
    if (width >= mediumDesktop) return ScreenType.mediumDesktop;
    if (width >= smallDesktop) return ScreenType.smallDesktop;
    if (width >= largeTablet) return ScreenType.largeTablet;
    if (width >= smallTablet) return ScreenType.smallTablet;
    if (width >= largeHandset) return ScreenType.largeHandset;
    if (width >= mediumHandset) return ScreenType.mediumHandset;
    return ScreenType.smallHandset;
  }

  BreakPointData copyWith({
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
      BreakPointData(
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

class _DefaultBreakpointData extends BreakPointData {
  _DefaultBreakpointData() : super._();

  @override
  double get small => 600;

  @override
  double get medium => 1024;

  @override
  double get large => 1440;

  @override
  double get xlarge => 1920;

  @override
  double get mediumHandset => 360;

  @override
  double get largeHandset => 400;

  @override
  double get smallTablet => 600;

  @override
  double get largeTablet => 720;

  @override
  double get smallDesktop => 1024;

  @override
  double get mediumDesktop => 1440;

  @override
  double get largeDesktop => 1920;
}

class _CustomBreakpointData extends BreakPointData {
  _CustomBreakpointData({
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
  }) : super._();

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
    this.breakPointData,
    required super.child,
  });
  final BreakPointData? breakPointData;

  @override
  bool updateShouldNotify(covariant Breakpoint oldWidget) {
    return true;
  }

  BreakPointData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Breakpoint>()!
        .breakPointData!;
  }

  BreakPointData? meybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Breakpoint>()
        ?.breakPointData;
  }
}
