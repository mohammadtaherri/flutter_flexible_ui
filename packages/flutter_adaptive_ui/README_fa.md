
### [انگلیسی](https://github.com/mohammadtaherri/flutter_flexible_ui/blob/main/packages/flutter_adaptive_ui/README.md)

# Flutter Adaptive UI

![0_t8MtUq5ko9abs0TD](https://user-images.githubusercontent.com/44123678/170714501-28c21458-4447-469c-8975-f14b64fc31f4.jpg)

فلاتر امکان ساخت برنامه های برای پلتفرم های مختلف مثل پلتفرم های دسکتاپی , موبایل و ... را می دهد.در نتیجه کاربر باید یک تجربه خوب از ارتباط با برنامه ما در پلتفرم های مختلف داشته باشد..

برای مطالعه بیشتر این [لینک](https://docs.flutter.dev/development/ui/layout/building-adaptive-apps) را دنبال کنید.

این پکیج از **_Screen Size_** , **_Screen Type_** و **_Design Language_** برای ساختن Adaptive UI استفاده می کند.

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

به صورت پیش فرض **_Screen Size_** و **_Screen Type_** براساس جدول زیر محاسبه می شوند:

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



و **_Design Language_** :  

| Platform           | Design Language |
| -------------------| ----------------|
| Android - Fuchsia  | Material        | 
| IOS - MacOs        | Cupertino       |
| Windows            | Fluent          |
| Others             | Material        | 


شما می توانید با قرار دادن ‍`MaterialAPP` در یک ویجت `Breakpint` این سایزهای پیش فرض را تغییر دهید: 
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

حالا شما می توانید سایز های پیش فرض را با پاس دادن پارامتر `BreakpointData` تغییر دهید:


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

همه پارامتر ها اختیاری هستند.

| Param              | Definition                                           | Default value |
| -------------------| ---------------------------------------------------- | ------------- |
| small              | The Minimum Width of the small Screen                | 600           |
| medium             | The Minimum Width of the medium Screen               | 1024          |
| large              | The Minimum Width of the large Screen                | 1440          |
| xLarge             | The Minimum Width of the xLarge Screen               | 1920          |
| mediumHandset      | The Minimum Screen Width of the medium handset       | 360           |
| LargeHandset       | The Minimum Screen Width of the large hanset         | 400           |
| smallTablet        | The Minimum Screen Width of the small tablet         | 600           |
| largeTablet        | The Minimum Screen Width of the large tablet         | 720           |
| smallDesktop       | The Minimum Screen Width of the small desktop        | 1024          |
| MediumDesktop      | The Minimum Screen Width of the medium desktop       | 1440          |
| largeDesktop       | The Minimum Screen Width of the large desktop        | 1920          |


- اگر عرض صفحه کوچک تر از مقدار small (default = 600) باشد, **_ScreenSize_** برابر با xSmall خواهد شد.
- اگر عرض صفحه کوچک تر از مقدار medium handset(default = 360) باشد, **_ScreenType_** برابر با smallHandset خواهد شد.


## نحوه استفاده

برای ساخت یک Adaptive UI باید از ویجت `AdaptiveBuilder‍‍` استفاده کنید:

این ویجت را به عنوان اولین ویجت صفحه مورد نظر خود قرار دهید.
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
این ویجت پارامتر های زیر را دریافت می کند:


| Param                 | Type                                      |  
| ----------------------| ----------------------------------------- | 
| defaultBuilder        | AdaptiveWidgetBuilder   (Required)        | 
| androidDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| fuchsiaDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| iosDelegate           | AdaptiveLayoutDelegate? (Optional)        | 
| WindowsDelegate       | AdaptiveLayoutDelegate? (Optional)        | 
| macosDelegate         | AdaptiveLayoutDelegate? (Optional)        | 
| linuxDelegate         | AdaptiveLayoutDelegate? (Optional)        | 
| webDelegate           | AdaptiveLayoutDelegate? (Optional)        | 
| allPlatformsDelegate  | AdaptiveLayoutDelegate? (Optional)        |
| breakpointData        | BreakpointData?         (Optional)        |


### توضیحات

- **breakpointData**

این ویجت مقدار `breakpointData` را به ترتیب براساس قوانین زیر به دست می آورد:

1. پارامتر `breakpointData` که به سازنده ویجت پاس داده شده است

2. اگر هیچ پارامتری برای `breakpointData` به constructor ویجت پاس داده نشود, مقدار `breakpointData` را از نزدیکترین ویجت `Breakpoint‍` که بالای این ویجت در درخت قرار دارد به دست می آورد
.
3. آگر هیچ ویجت `Breakpoint` ای در درخت وجود نداشت, از سایز های پیش فرض استفاده می کند.


در نتیجه از این پارامتر برای شخصی سازی سایز های می توانید استفاده کنید.

1. از `Breakpoint.of(context)` برای به دست آوردن مقدار `breakpointData` از نزدیک ترین ویجت `Breakpoint` در درخت استفاده کنید و سپس با استفاده از متد `copyWith()` سایز ها را تغییر دهید:
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

2. یا از ابتدا یک `BreakpointData` جدید بسازید :
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

- **defaultBuilder**
- **androidDelegate**
- **fuchsiaDelegate**
- **iosDelegate**
- **windowsDelegate**
- **macosDelegate**
- **linuxDelegate**
- **webDelegate**
- **allPlatformsDelegate**

اول از همه این ویجت مقادیر **ScreenSize** , **ScreenType** and **Designlanguage** را محاسبه می کند و سپس UI را براساس اصول زیر می سازد:

1. **PlatformType**

مقدار **_PlatformType_** برابر است با : _android_ , _fuchsia_ , _iOS_ , _windows_ , _linux_ , _macOS_ or _web_

اول از همه این ویجت برای ساخت UI از Delegate های مختص هر پلتفرم (androidDelegate , fuchsiaDelegate , iosDelegate , windowsDelegate , macOSDelegate , linuxDelegate or webDelegate) استفاده می کند.

2. **allPlatformDelagate**

اگر برای پلتفرم مورد نظر Delegate سفارشی ارایه نشد (به constructor پاس داده نشد) یا Delegate مورد نظر براس سایز صفحه builder ای را ارایه نکرد این ویجت از **allPlatformDelegate** برای ساخت  UI استفاده می کند.

3. **defaultBuilder**

در نهایت اگر UI توسط موارد گفته شده بالا ساخته نشد, از این پارامتر برای ساحت UI (پیش فرض ) استفاده می شود.


#### **defaultBuilder**

این پارامتر اجباری است و از آن برای ساخت UI پیش فرض استفاده می شود.
 

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
      defaultBuilder: (BuildContext context, Screen screen) {
        return const Center(
          child: Text('Default Builder'),
        );
      },
    );
  }
}
```
  
  آبجکت **Screen** اطلاعاتی در مورد صفحه نمایش به شما می دهد:
 
| Param                 | Type                  |   Definition    |
| ----------------------| --------------------- | ----------------|
| mediaQueryData        | MediaQueryData        | The `mediaQueryData` from the closest `MediaQuery` instance that encloses the given context. |
| breakpointData        | BreakpointData        | _                                     |
| layoutConstraints     | BoxConstraints?       | Obtain from LayoutBuilder widget      |
| screenSize            | ScreenSize            | xSmall , small , medium , large , xLarge |
| screenType            | ScreenType            | (small,medium,large)Handset , (small,large)Tablet , (small,medium,large)Desktop |
| designLanguage        | DesignLanguage        | material , cupertino , fluent | 
| platform              | PlatformType          | android , fuchsia , ios , windows , macos , linux , web |

#### **Custom Delegates**

همه این پارامتر ها اختیاری هستند.

شما باید یک آبجکت از جنس `AdaptiveLayoutDelegate` به این پارامتر ها پاس بدهید, این کلاس یک  abstract class هست و یا باید از پیاده سازی های زیر استفاده کنید و یا از ابتدا خودتان یک کلاس احتصاصی را بر مبنای این کلاس پیاده سازی کنید.

#### AdaptiveLayoutDelegateWithScreenType

  

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
#### AdaptiveLayoutDelegateWithMinimallScreenSize
    
    
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
  

#### AdaptiveLayoutDelegateWithSingleBuilder
