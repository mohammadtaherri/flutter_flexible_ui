part of flutter_adaptive_ui;

enum DeviceType {
  smallHandset(0, 359, 'Small Handset'),
  mediumHandset(360, 399, 'Medium Handset'),
  largeHandset(400, 599, 'Large Handset'),
  smallTablet(600, 719, 'Small Tablet'),
  largeTablet(720, 1023, 'Large Tablet'),
  desktop(1024, double.infinity, 'Desktop');

  const DeviceType(this.minWidth, this.maxWidth, [this.debugLabel]);
  final double minWidth;
  final double maxWidth;
  final String? debugLabel;
}
