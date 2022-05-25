part of flutter_adaptive_ui;

class DeviceConfig {
  DeviceConfig({
    required this.screenSize,
    required this.screenType,
  }) {
    platform = getDefaultPlatform();
    designLanguage = getDefaultDesignLanguage();
  }

  factory DeviceConfig.fromMediaQueryAndBreakpoint(
    MediaQueryData mediaQueryData,
    BreakpointData breakpointData,
  ) {
    final double screenWidth = mediaQueryData.size.width;

    return DeviceConfig(
      screenSize: breakpointData.getScreenSize(screenWidth),
      screenType: breakpointData.getScreenType(screenWidth),
    );
  }

  /// xsmall , small , medium , large , xlarge
  final ScreenSize screenSize;

  /// small handset , medium handset , large hanset
  /// small tablet , large tablet
  /// small desktop , medium desktop , large desktop
  final ScreenType screenType;

  /// If [targetPlatform] is android or fuchsia, it will be [DesignLanguage.material]
  /// If [targetPlatform] is ios or macos, it will be [DesignLanguage.cupertino]
  /// If [targetPlatform] is windows, it will be [DesignLanguage.fluent]
  /// For other [targetPlatform]s (linux , web), it will be [DesignLanguage.material]
  late final DesignLanguage designLanguage;

  late final PlatformType platform;
}

PlatformType getDefaultPlatform() {
  if (kIsWeb) return PlatformType.web;

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return PlatformType.android;
    case TargetPlatform.fuchsia:
      return PlatformType.fuchsia;
    case TargetPlatform.iOS:
      return PlatformType.iOS;
    case TargetPlatform.macOS:
      return PlatformType.macOS;
    case TargetPlatform.windows:
      return PlatformType.windows;
    case TargetPlatform.linux:
      return PlatformType.linux;
  }
}

DesignLanguage getDefaultDesignLanguage() {
  if (kIsWeb) return DesignLanguage.material;

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      return DesignLanguage.material;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return DesignLanguage.cupertino;
    case TargetPlatform.windows:
      return DesignLanguage.fluent;
    default:
      return DesignLanguage.material;
  }
}
