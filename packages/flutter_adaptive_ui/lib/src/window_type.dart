part of flutter_adaptive_ui;

enum WindowType {
  xsmall(0, 599, 'XSmall'),
  small(600, 1023, 'Small'),
  medium(1024, 1439, 'Medium'),
  large(1440, 1919, 'Large'),
  xlarge(1920, double.infinity, 'XLarge');

  const WindowType(this.minWidth, this.maxWidth, [this.debugLabel]);
  final double minWidth;
  final double maxWidth;
  final String? debugLabel;
}
