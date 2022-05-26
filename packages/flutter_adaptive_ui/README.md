### [Persian](https://github.com/mohammadtaherri/flutter_flexible_ui/blob/main/packages/flutter_adaptive_ui/README_fa.md)

# Flutter Adaptive UI

Flutter provides new opportunities to build apps that can run on mobile, desktop, and the web from a single codebase. However, with these opportunities, come new challenges. You want your app to feel familiar to users, adapting to each platform by maximizing usability and ensuring a comfortable and seamless experience. That is, you need to build apps that are not just multiplatform, but are fully platform adaptive.

For more informations follow this [link](https://docs.flutter.dev/development/ui/layout/building-adaptive-apps).

This package uses **_Screen Size_** , **_Screen Type_** and **_Design language_** for building Adaptive UI.

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

By default **_Screen Size_** and **_SCreen Type_** are obtained from following table:

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

| Platform           | Design Language |
| -------------------| ----------------|
| Android - Fuchsia  | Material        | 
| IOS - MacOs        | Cupertino       |
| Windows            | Fluent          |
| Others             | Material        | 


You can change these default sizes by wrapping your `MaterialApp` in `Breakpoint`:

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

Now you can override the default sizes by set `breakpointData` param:


```dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Breakpoint(
      // Use default sizes or override.
      breakPointData: BreakpointData(
        // Base on [ScreenSize] (xSmall , small , medium , large , xLarge)
        small: 600,
        medium: 1024,
        large: 1440,
        xlarge: 1920,
        // Base on [ScreenType] (smallHandset , mediumHandset , largeHandset , smallTablet , largetablet , smallDesktop , mediumDesktop , largeDesktop)
        mediumHandset: 360,
        largeHandset: 400,
        smallTablet: 600,
        largeTablet: 720,
        smallDesktop: 1024,
        mediumDesktop: 1440,
        largeDesktop: 1920,
      ),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

All params are optional.

| Param              | Definition    | Default value |
| -------------------| ------------- | ------------- |
| small              | Small Window width                        | 600           |
| medium             | Medium Window width                       | 1024          |
| large              | Large Window width                        | 1440          |
| xLarge             | X Large Window width                      | 1920          |
| mediumHandset      | Medium Desktop Minimum Screen Width       | 360           |
| LargeHandset       | Large Handset Minimum Screen Width        | 400           |
| smallTablet        | Small Desktop Minimum Screen Width        | 600           |
| largeTablet        | Large Tablet Minimum Screen Width         | 720           |
| smallDesktop       | Small Desktop Minimum Screen Width        | 1024          |
| MediumDesktop      | Medium Desktop Minimum Screen Width       | 1440          |
| largeDesktop       | Large Desktop Minimum Screen Width        | 1920          |


- If screen width is less than the _small_ (default = 600), **Screen Size** will be **xSmall**
- If screen width is less than the _mediumHandset_ (default = 360), **Screen Type** will be **smallHandset**


## Usage

You should use `AdaptiveBuilder` to build adaptive UI.

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


| Param                 | Type                                      |  
| ----------------------| ----------------------------------------- | 
| Builder               | AdaptiveWidgetBuilder   (Required)        | 
| androidDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| fuchsiaDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| iosDelegate           | AdaptiveLayoutDelegate? (Optional)        | 
| WindowsDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| macosDelegate         | AdaptiveLayoutDelegate? (Optional)        | 
| linuxDelegate         | AdaptiveLayoutDelegate? (Optional)        | 
| webDelegate           | AdaptiveLayoutDelegate? (Optional)        | 
| allPlatformsDelegate  | AdaptiveLayoutDelegate? (Optional)        |
| breakpointData        | BreakpointData?         (Optional)        |


### Description

- **breakpointData**

This Widget obtains `BreakpointData` based on following rules:

1. `breakpointData` param that is passed to constructor.
2. If `breakpointData` param is null(no param is passed to constructor), It will obtain `breakpointData` from nearest `Breakpoint` (InheritedWidget) in widget tree.
3. If there is no `Breakpoint` in widget tree above this widget, it will use the default sizes.


Use this param to override the default sizes:

1. Use `Breakpoint.of(context)` to obtain `breakpointData` from nearest `Breakpoint` and then override sizes by calling `copyWith()` method:
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
      breakpointData: Breakpoint.of(context).copyWith(
        small: ,
        medium: ,
        large: ,
        mediumHandset: ,
        ...
      ),
    );
  }
}
```

2. Or pass a fresh `breakpointData` by creating a `breakpointData` from scratch:
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
      breakpointData: BreakpointData(
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
    );
  }
}
```

- **builder**
- **androidDelegate**
- **fuchsiaDelegate**
- **iosDelegate**
- **windowsDelegate**
- **macosDelegate**
- **linuxDelegate**
- **webDelegate**
- **allPlatformsDelegate**

First of all, this widget obtains **ScreenSize** , **ScreenType** and **Designlanguage** and then builds UI based on following rules:

1. **PlatformType**

PlatformType is _android_ , _fuchsia_ , _iOS_ , _windows_ , _linux_ , _macOS_ or _web_ .

First of all, this widget uses a custom delegate based on **PaltformType** (androidDelegate , fuchsiaDelegate , iosDelegate , windowsDelegate , macOSDelegate , linuxDelegate or webDelegate) to building UI.

2. **allPlatformDelagate**

If a custom delegate is not provided or the custom delegate is provided but it does not provide a custom builder for the desired size, It will use the **allPlatformDelegate** for building UI.

3. **builder**

Eventually, If for the desired platform is not provided a custom delegate or the custom delegate does not provide a custom builder for the desired size 
and the **allPlatformDelegate** also does not provide that builder ,it will use the builder param for building UI.


- **builder**

This param is **required** and it is used as default builder to building UI.

You must pass a `AdaptiveWidgetBuilder` : 

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
      builder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
    );
  }
}
```
 **Screen** is an object that gives you some informations from the screen.
 
| Param                 | Type                  |   Definition    |
| ----------------------| --------------------- | ----------------|
| mediaQueryData        | MediaQueryData        | Obtain from nearest MediaQuery widget |
| breakpointData        | BreakpointData        | _                                     |
| layoutConstraints     | BoxConstraints?       | Obtain from LayoutBuilder widget      |
| screenSize            | ScreenSize            | xSmall , small , medium , large , xLarge |
| screenType            | ScreenType            | (small,medium,large)Handset , (small,large)Tablet , (small,medium,large)Desktop |
| designLanguage        | DesignLanguage        | material , cupertino , fluent | 
| platform              | PlatformType          | android , fuchsia , ios , windows , macos , linux , web |

- **Custom Delegates**

All these params are **optional**.

You must pass a `AdaptiveLayoutDelegate`.this class is an abstract class and you can use following implementations or create your custom implementation from scratch:

#### AdaptiveLayoutDelegateWithScreenType

  This delegate builds layout based on **ScreenType** (smallHandset , mediumhandset , largeHandset , smallTablet , largeTablet , smallDesktop ,       mediumDesktop , largeDesktop).

  All params are **optional**.

<details><summary>Example</summary>

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
      builder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
      webDelegate: AdaptiveLayoutDelegateWithScreenType(
        smallHandset: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Small Handset'),
          );
        },
        mediumHandset: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Medium Handset'),
          );
        },
        largeHandset: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Large Handset'),
          );
        },
        smallTablet: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Small Tablet'),
          );
        },
        largeTablet: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Large Tablet'),
          );
        },
        smallDesktop: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Small Desktop'),
          );
        },
        mediumDesktop: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Medium Desktop'),
          );
        },
        largeDesktop: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Large Desktop'),
          );
        },
      ),
    );
  }
}
```

</details>


#### AdaptiveLayoutDelegateWithMinimallScreenType
  
   This delegate builds layout based on minimall **ScreenType** (handset , tablet , desktop);
  
  <details><summary>Example</summary>

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
        builder: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Default Builder'),
          );
        },
        webDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
          handset: (BuildContext context, Screen screen) {
            return const Center(
              child: Text('Web - Handset'),
            );
          },
          tablet: (BuildContext context, Screen screen) {
            return const Center(
              child: Text('Web - Handset'),
            );
          },
          desktop: (BuildContext context, Screen screen) {
            return const Center(
              child: Text('Web - Handset'),
            );
          },
        ));
  }
}

```

</details>
 
    
#### AdaptiveLayoutDelegateWithScreenSize
    
    
  <details><summary>Example</summary>

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
      builder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
      webDelegate: AdaptiveLayoutDelegateWithScreenSize(
        xSmall: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - XSmall Window'),
          );
        },
        small: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - Small Window'),
          );
        },
        medium: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web -  Medium Window'),
          );
        },
        large: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web -  large Window'),
          );
        },
        xLarge: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Web - XLarge Window'),
          );
        },
      ),
    );
  }
}

```

</details>
  
    
#### AdaptiveLayoutDelegateWithDesignLanguage

 This delegate builds layout based on **DesignLaguage** (material , cupertino , fluent).
    
 All params are **optional**.
    
    
  <details><summary>Example</summary>

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
      builder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
      allOsDelegate: AdaptiveLayoutDelegateWithDesignLanguage(
        material: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Material'),
          );
        },
        cupertino: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Cupertino'),
          );
        },
        fluent: (BuildContext context, Screen screen) {
          return const Center(
            child: Text('Fluent'),
          );
        },
      ),
    );
  }
}

```

</details>
  

