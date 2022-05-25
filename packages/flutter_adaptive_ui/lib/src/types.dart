part of flutter_adaptive_ui;

enum ScreenSize {
  xsmall('XSmall'),
  small('Small'),
  medium('Medium'),
  large('Large'),
  xlarge('XLarge');

  const ScreenSize([this.debugLabel]);
  final String? debugLabel;
}

enum ScreenType {
  smallHandset('Small Handset'),
  mediumHandset('Medium Handset'),
  largeHandset('Large Handset'),
  smallTablet('Small Tablet'),
  largeTablet('Large Tablet'),
  smallDesktop('Small Desktop'),
  mediumDesktop('Medium Desktop'),
  largeDesktop('Large Desktop');

  const ScreenType([this.debugLabel]);
  final String? debugLabel;
}

enum DesignLanguage {
  material('Material'),
  cupertino('Cupertino'),
  fluent('Fluent');

  const DesignLanguage([this.debugLabel]);
  final String? debugLabel;
}

enum PlatformType {
  android('Android'),
  fuchsia('Fuchsia'),
  ios('IOS'),
  macos('MacOS'),
  windows('Windows'),
  linux('Linux'),
  web('Web');

  const PlatformType([this.debuglabel]);
  final String? debuglabel;
}
