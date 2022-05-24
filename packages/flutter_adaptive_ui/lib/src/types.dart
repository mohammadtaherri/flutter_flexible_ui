part of flutter_adaptive_ui;

enum WindowSize {
  xsmall(0, 599, 'XSmall'),
  small(600, 1023, 'Small'),
  medium(1024, 1439, 'Medium'),
  large(1440, 1919, 'Large'),
  xlarge(1920, double.infinity, 'XLarge');

  const WindowSize(this.minWidth, this.maxWidth, [this.debugLabel]);
  final double minWidth;
  final double maxWidth;
  final String? debugLabel;
}

enum WindowType {
  smallHandset(0, 359, 'Small Handset'),
  mediumHandset(360, 399, 'Medium Handset'),
  largeHandset(400, 599, 'Large Handset'),
  smallTablet(600, 719, 'Small Tablet'),
  largeTablet(720, 1023, 'Large Tablet'),
  desktop(1024, double.infinity, 'Desktop');

  const WindowType(this.minWidth, this.maxWidth, [this.debugLabel]);
  final double minWidth;
  final double maxWidth;
  final String? debugLabel;
}
