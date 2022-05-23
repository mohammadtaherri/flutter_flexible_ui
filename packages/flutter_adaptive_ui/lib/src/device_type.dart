part of flutter_adaptive_ui;

enum DeviceType {
  smallHandset(0, 359),
  mediumHandset(360, 399),
  largeHanset(400, 599),
  smallTablet(600, 719),
  largeTablet(720, 1023),
  desktop(1024, double.infinity);

  const DeviceType(this.minWidth, this.maxWidth);
  final double minWidth;
  final double maxWidth;
}
