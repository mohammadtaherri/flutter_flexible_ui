## 0.8.0+1

* **docs**: Update README

## 0.8.0

* **BREAKING**:feat: Add Screen.fromContext (factory) to Screen
* **BREAKING**:feat: Add Screen.fromWindow (factory) to Screen
* **BREAKING**:refactor: Make Screen's default constructor private 
* **BREAKING**:fix: Remove LayoutBuilder from AdaptiveBuilder and remove layoutConstraints field from Screen
* **DEPRECATE**: Screen.of(context) deprecated in favor of Screen.fromContext

## 0.8.0-dev.2

* **BREAKING**:feat: Add PlatformBuilder (widget)
* **BREAKING**:feat: Add AdaptiveDesign  (widget)
* **BREAKING**:feat: Add AdaptiveBuilder.custom constructor to AdaptiveBuilder widget
- **DEPRECATE**:fix: some params in AdaptiveBuilder constructor deprecated in favor of AdaptiveBuilder.custom constructor.

## 0.8.0-dev.1

- **BREAKING**:refactor: Rename BreakpointData's fields 
  - small to minSmallScreenWidth
  - medium to minMediumScreenWidth
  - large to minLargeScreenWidht
  - xLarge to minXLargeScreenWidht
  - mediumHandset to minMediumHandsetwidth
  - ...

## 0.7.0

* **BREAKING**:feat: Add some extension methods to Screen
* **Fix**: Update -Min Dart SDK- version to 2.12.0

## 0.6.0+1

* Add persian README

## 0.6.0

* **BREAKING**:feat: Add AdaptiveLayoutDelegateWithMinimallScreenSize
* **BREAKING**:feat: Add AdaptiveLayoutDelegateWithSingleBuilder
* **BREAKING**:refactor: Rename builder to defaultBuilder in AdaptiveBuilder
* **BREAKING**:feat: Add defaultBuilder field to AdaptiveLayoutDelegate(s)

## 0.5.1+3

## 0.5.1+2

* **Doc**: Add some documents.
* Update README

## 0.5.1+1

## 0.5.1

* **BREAKING**:refactor: Rename allOsDelegate to allPlatformsDelegate (AdaptiveBuilder)
* Update README

## 0.5.0+1

* Put an example

## 0.5.0

* **BREAKING**:refactor: Rename DeviceConfig to Screen
* **BREAKING**:feat: Add mediaQUeryData , breakpointData and layoutConstraints to Screen
* **BREAKING**:feat: Obtain ScreenType and ScreenSize base on layoutConstraint and then media query
* **BREAKING**:feat: Wrap AdaptiveBuilder result in LayoutBuilder
* **BREAKING**:refactor: Remove maybeOf from Breakpoint
* **BREAKING**:feat: Add of(context) method to Screen

## 0.4.0+1

* **BREAKING**:feat: Add some extension methods to BuildContext (breakpoint , mabybreakpoint)
* **Fix**: Rename builder to delegate in AdaptiveBuilder fields
* **Fix**: Change AdaptiveLayoutDelegates fields to name params.
* Doc: Add some documents.
* Add README

## 0.4.0

* Update AdaptiveBuilder: get breakpointData in constructor.
* **BREAKING**:feat: Add PlatformType (enum).
* **BREAKING**:feat: Add getDefaultPlatform top level function.
* **BREAKING**:feat: Add getDefaultDesignLanguage top level function.

## 0.3.0

* **BREAKING**:feat: Add BreakpointData.
* **BREAKING**:feat: Add Breakpoint (InheritedWidget).
* **BREAKING**:feat: Update DeviceConfig to use breakpoint.

## 0.2.0

* **BREAKING**:refactor:Rename WindowType to ScreenType.
* **BREAKING**:refactor:Rename WindowSize to ScreenSize.

## 0.1.1+3

* **Doc**: Add some documents.

## 0.1.1+2

## 0.1.1+1

* Update README.md

## 0.1.1

* Add description to pubsepc.yaml
* Add repository to pubsepc.yaml
* **Fix**: Update -Min Dart SDK- version to 2.17.0

## 0.1.0

* TODO: Describe initial release.

