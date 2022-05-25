### [Persian](https://github.com/mohammadtaherri/flutter_flexible_ui/blob/main/packages/flutter_adaptive_ui/README_fa.md)

# Flutter Adaptive UI

Flutter provides new opportunities to build apps that can run on mobile, desktop, and the web from a single codebase. However, with these opportunities, come new challenges. You want your app to feel familiar to users, adapting to each platform by maximizing usability and ensuring a comfortable and seamless experience. That is, you need to build apps that are not just multiplatform, but are fully platform adaptive.

For more informations follow this [link](https://docs.flutter.dev/development/ui/layout/building-adaptive-apps).

This package uses **_Screen Size_** , **_Screen Type_** and **_Design language_** for building UI.

### Screen Size
* X Small
* Small
* Medium
* Large
* X Lagre

### Screen Type
* Small Handset
* Medium Handset
* Large Handset
* Small Tablet
* Large Tablet
* Small Desktop
* Medium Desktop
* Large Desktop

### Design Language
* Material
* Cupertino
* Fluent

By default **_Screen Size_** and **_SCreen Type_** obtain from following table:

| Screen Width Range | Screen Size   | Screen Type   |
| -------------------| ------------- | ------------- |
| 0-359              | X Small       | Small Handset |
| 360-399            | X Small       | Medium Handset|
| 400-599            | X Small       | Large Handset |
| 600-719            | Small         | Small Tablet  |
| 720-1023           | Small         | Large Tablet  |
| 1023-1439          | Medium        | Small Desktop |
| 1440-1919          | Large         | Medium Desktop|
| 1920+              | X Large       | Large Desktop |



And **_Design language_** : 

| Platfoem           | Design Language |
| -------------------| ----------------|
| Android - Fuchsia  | Material        | 
| IOS - MacOs        | Cupertino       |
| Windows            | Fluent          |
| Others             | Material        | 


You can change these default sizes by wrap your `MaterialApp` in `Breakpoint`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Breakpoint(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

Now you can override these default sizes by set `breakpointData` param:
* You can use `Breakpoint.dflt()` that use default sizes : 
```dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Breakpoint(
      breakPointData: BreakpointData.dftl(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

* You can override some sizes by `copyWith` method:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Breakpoint(
      breakPointData: BreakpointData.dftl().copyWith(
        small: 350,
        large: 1200,
        mediumHandset: 400,
        largeHandset: 450
      ),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```
* You can also use `BreakpointData()` constructor to override all sizes:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Breakpoint(
      breakPointData: BreakpointData(
        small: 350,
        medium: 700,
        large: 1200,
        xlarge: 1800,
        mediumHandset: 350,
        largeHandset: 420,
        smallTablet: 600,
        largeTablet: 900,
        smallDesktop: 1100,
        mediumDesktop: 1400,
        largeDesktop: 1900,
      ),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

Then you should use `AdaptiveBuilder` to build adaptive UI.
This Widget obtain `BreakpointData` base on following rules:
1. `breakpointData` param in constructor.
2. If `breakpointData` param is null, It will obtain `breakpointData` from nearest `Breakpoint` (InheritedWidget) in widget tree.
3. If there is no `Breakpoint` in widget tree above this widget, it will use `BreakPointData.dflt()` (default sizes)

## Usage

Wrap your entire screen with this widget:
```dart
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      
    );
  }
}
```
This widget accepts following params:
```dart
  final AdaptiveWidgetBuilder builder;
  final AdaptiveLayoutDelegate? androidBuilder;
  final AdaptiveLayoutDelegate? fuchsiaBuilder;
  final AdaptiveLayoutDelegate? iosBuilder;
  final AdaptiveLayoutDelegate? windowsBuilder;
  final AdaptiveLayoutDelegate? linuxBuilder;
  final AdaptiveLayoutDelegate? macosBuilder;
  final AdaptiveLayoutDelegate? webBuilder;
  final AdaptiveLayoutDelegate? allOsBuilder;
  final BreakpointData? breakpointData;
```
