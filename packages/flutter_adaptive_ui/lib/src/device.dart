part of flutter_adaptive_ui;

class DeviceConfig {
  DeviceConfig({
    required this.screenSize,
    required this.screenType,
  }) {
    targetPlatform = defaultTargetPlatform;
    isWeb = kIsWeb;

    switch (targetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        designLanguage = DesignLanguage.material;
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        designLanguage = DesignLanguage.cupertino;
        break;
      case TargetPlatform.windows:
        designLanguage = DesignLanguage.fluent;
        break;
      default:
        designLanguage = DesignLanguage.material;
        break;
    }
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

  /// Base on [defaultTargetPlatform]
  late final TargetPlatform targetPlatform;

  /// Base on [kIsWeb]
  late final bool isWeb;

  factory DeviceConfig.fromMediaQuery(BuildContext context) {
    return _calc(MediaQuery.of(context).size.width);
  }

  static DeviceConfig _calc(double width) {
    if (width >= 1920) {
      return DeviceConfig(
        screenType: ScreenType.largeDesktop,
        screenSize: ScreenSize.xlarge,
      );
    }
    if (width >= 1440) {
      return DeviceConfig(
        screenType: ScreenType.mediumDesktop,
        screenSize: ScreenSize.large,
      );
    }
    if (width >= 1024) {
      return DeviceConfig(
        screenType: ScreenType.smallDesktop,
        screenSize: ScreenSize.medium,
      );
    }

    if (width >= 720) {
      return DeviceConfig(
        screenType: ScreenType.largeTablet,
        screenSize: ScreenSize.small,
      );
    }
    if (width >= 600) {
      return DeviceConfig(
        screenType: ScreenType.smallTablet,
        screenSize: ScreenSize.small,
      );
    }
    if (width >= 400) {
      return DeviceConfig(
        screenType: ScreenType.largeHandset,
        screenSize: ScreenSize.xsmall,
      );
    }
    if (width >= 360) {
      return DeviceConfig(
        screenType: ScreenType.mediumHandset,
        screenSize: ScreenSize.xsmall,
      );
    }
    return DeviceConfig(
      screenType: ScreenType.smallHandset,
      screenSize: ScreenSize.xsmall,
    );
  }
}
