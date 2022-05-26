part of flutter_adaptive_ui;

/// A top level function taht obtains [PlatformType] based on
/// the [TargetPlatform] and the [kIsWeb].
///
/// If the [kIsWeb] is true, it will be web.
/// If the [kIsWeb] is false, it will be obtained based on the [TargetPlatform].
///
/// See also:
///
///  * [Screen]
///  * [PlatformType]
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

/// A top level function taht obtains [DesignLanguage] based on
/// the [PlatformType].
///
/// If the [PlatformType] is android or fuchsia, it will be material.
/// If the [PlatformType] is iOS or macOS, it will be cupertino.
/// If the [PlatformType] is windows, it will be fluent.
/// If the [PlatformType] is linux or web, it will be material.
///
/// See also:
///
///  * [Screen]
///  * [DesignLanguage]
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
