part of flutter_adaptive_ui;

enum WindowType {
  xsmall(0, 599),
  small(600, 1023),
  medium(1024, 1439),
  large(1440, 1919),
  xlarge(1920, double.infinity);

  const WindowType(this.minWidth, this.maxWidth);
  final double minWidth;
  final double maxWidth;
}
