part of flutter_adaptive_ui;

class Device {
  Device({
    required this.windowSize,
    required this.windowType,
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

  final WindowSize windowSize;
  final WindowType windowType;

  late final DesignLanguage designLanguage;
  late final TargetPlatform targetPlatform;
  late final bool isWeb;

  factory Device.fromMediaQuery(BuildContext context) {
    return _calc(MediaQuery.of(context).size.width);
  }

  static Device _calc(double width) {
    if (width >= 1920) {
      return Device(
        windowType: WindowType.desktop,
        windowSize: WindowSize.xlarge,
      );
    }
    if (width >= 1600) {
      return Device(
        windowType: WindowType.desktop,
        windowSize: WindowSize.large,
      );
    }
    if (width >= 1440) {
      return Device(
        windowType: WindowType.desktop,
        windowSize: WindowSize.large,
      );
    }
    if (width >= 1280) {
      return Device(
        windowType: WindowType.desktop,
        windowSize: WindowSize.medium,
      );
    }
    if (width >= 1024) {
      return Device(
        windowType: WindowType.desktop,
        windowSize: WindowSize.medium,
      );
    }
    if (width >= 960) {
      return Device(
        windowType: WindowType.largeTablet,
        windowSize: WindowSize.small,
      );
    }
    if (width >= 840) {
      return Device(
        windowType: WindowType.largeTablet,
        windowSize: WindowSize.small,
      );
    }
    if (width >= 720) {
      return Device(
        windowType: WindowType.largeTablet,
        windowSize: WindowSize.small,
      );
    }
    if (width >= 600) {
      return Device(
        windowType: WindowType.smallTablet,
        windowSize: WindowSize.small,
      );
    }
    if (width >= 480) {
      return Device(
        windowType: WindowType.largeHandset,
        windowSize: WindowSize.xsmall,
      );
    }
    if (width >= 400) {
      return Device(
        windowType: WindowType.largeHandset,
        windowSize: WindowSize.xsmall,
      );
    }
    if (width >= 360) {
      return Device(
        windowType: WindowType.mediumHandset,
        windowSize: WindowSize.xsmall,
      );
    }
    return Device(
      windowType: WindowType.smallHandset,
      windowSize: WindowSize.xsmall,
    );
  }
}
