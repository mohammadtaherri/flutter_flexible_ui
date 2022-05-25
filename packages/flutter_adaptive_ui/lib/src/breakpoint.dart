part of flutter_adaptive_ui;

abstract class BreakPoint {
  BreakPoint() {
    debugAssertIsValid();
  }

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

class DefaultBreakpoint extends BreakPoint {
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
