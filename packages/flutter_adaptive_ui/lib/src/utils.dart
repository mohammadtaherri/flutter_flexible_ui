part of flutter_adaptive_ui;

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
