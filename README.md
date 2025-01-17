<a name="readme-top"></a>

<!-- Top Links Bar -->

[![LinkedIn][linkedin-shield]][linkedin-url]
[![Twitter][twitter-shield]][twitter-url]
[![Instagram][instagram-shield]][instagram-url]

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <img src="images/logo.png" alt="Logo" width="80" height="80">
  <h1 align="center">Japanes Tutorial App</h1>

  <p align="left">
      TDD, clean architecture and BloC Training app inspired by 
     <a href="https://github.com/dastagir-ahmed"><strong>Dastagir Ahmed</strong></a> .
  </p>

  <p align="left">
    <a href="https://github.com/foxnoir/japanese_tutorials_app/tree/develop/lib"><strong>Explore the project »</strong></a>
    <br/>
  </p>

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#style-guide">Style Guide</a>
      <ul>
        <li><a href="#color-palette">Color Palette</a></li>
      </ul>
      <ul>
        <li><a href="#fonts">Fonts</a></li>
      </ul>
      <ul>
        <li><a href="#icons">Icons</a></li>
      </ul>
      <ul>
        <li><a href="#final-layout">Final Layout</a></li>
      </ul>
    </li>
    <li><a href="#app-demonstration">App Demonstration</a>
      <ul>
        <li><a href="#happy-case">Happy Case</a></li>
        <li><a href="#error-handling">Error Handling</a></li>
      </ul>
    </li>
    <li><a href="#tech-stack">Tech Stack</a></li>
      <ul>
        <li><a href="#build-with">Build With</a></li>
      </ul>
      <ul>
        <li><a href="#most-important-libraries-and-tools">Most important Libraries and Tools</a></li>
      </ul>
    <li><a href="#getting-started">Getting Started</a></li>
        <ul>
        <li><a href="#generate-launcher-icon">Generate Launcher Icon</a></li>
        <li><a href="#generate-splash-screen">Generate Splash Screen</a></li>
      </ul>
    <li><a href="#app-architecture-and-folder-structure">App Architecture and Folder Structure</a>
      <ul>
        <li><a href="#feature-first-approach">Feature-First Approach</a></li>
        <li><a href="#explanation">Explanation</a>
          <ul>
            <li><a href="#data">Data</a></li>
            <li><a href="#domain">Domain</a></li>
            <li><a href="#presentation">Presentation</a></li>
            <li><a href="#global-widgets">Global Widgets</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#packages-and-reasons-for-use">Packages and Reasons for Use</a></li>
    <li><a href="#test-coverage">Test Coverage</a></li>
    <li><a href="#changelog">Changelog</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>

  </ol>
</details>

---

## Style Guide

### Color Palette

<img src="images/palette.jpg" alt="palette" width="65%" height="100%">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Fonts

- [Default Flutter ios font (San Francisco)](https://developer.apple.com/fonts/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Icons

- [Default Flutter materials icons](https://api.flutter.dev/flutter/material/Icons-class.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Final Layout

<!-- <img src="images/finalLayout.png" alt="layout" width="100%" height="100%"> -->

[Image comming soon]

  <p align="left">
    <a href="#References-to-the-images-used"><strong>References to the images used »</strong></a>
    <br/>
  </p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **App Demonstration**

### **Happy Case**

[Video comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### **Error Handling**

[Video comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Tech Stack**

### Build With

- [![Flutter][flutter]][flutter-url]
- [![Dart][dart]][dart-url]
- [![Firebase][firebase]][firebase-url]

### Most Important Packages and Tools

[![Auto Route][auto-route]][auto-route-url]
[![Bloc][bloc]][bloc-url]
[![Dartz][dartz]][dartz-url]
[![Dio][dio]][dio-url]
[![Equatable][equatable]][equatable-url]
[![Flutter Bloc][flutter-bloc]][flutter-bloc-url]
[![Flutter Localizations][flutter-localizations]][flutter-localizations-url]
[![Flutter Secure Storage][flutter-secure-storage]][flutter-secure-storage-url]
[![GetIt][get-it]][get-it-url]
[![Hive][hive]][hive-url]
[![Injectable][injectable]][injectable-url]
[![Intl][intl]][intl-url]
[![Mocktail][mocktail]][mocktail-url]
[![Very Good Analysis][very-good]][very-good-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Getting Started**

### **Repository Cloning**

- Download or clone this repo by using the link or the SSH URL below:

```
https://github.com/foxnoir/japanese_tutorials_app.git
```

```
git@github.com:foxnoir/japanese_tutorials_app.git
```

- Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

```
flutter run
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Generate Launcher Icon

> :warning: **(Normally, this should not need to be executed.)**

```
flutter pub run flutter_launcher_icons:main
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Generate Splash Screen

```
flutter pub run flutter_native_splash:create
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **App Architecture and Folder Structure**

```
flutter-app/
  ├── android
  ├── assets/
  │     ├── fonts/
  │     ├── icons/
  │     └── img/
  ├── build/
  ├── images/
  ├── ios/
  ├── lib/
  │     ├── core/
  │     │     ├── di/
  │     │     ├── errors/
  │     │     ├── localization/
  │     │     ├── log/
  │     │     ├── router/
  │     │     ├── theme/
  │     │     ├── usecases/
  │     │     └── utils/
  │     ├── features/
  │     │     └── feature/
  │     │          ├── data/
  │     │          │     ├── models/
  │     │          │     ├── repositories/
  │     │          │     └── data_sources/
  │     │          ├── domain/
  │     │          │     ├── entities/
  │     │          │     ├── repositories/
  │     │          │     └── usecases/
  │     │          └── presentation/
  │     │                ├── views/
  │     │                ├── widgets/
  │     │                └── bloc/
  │     │     └── navigation/
  │     │     └── storage/
  │     └── global_widgets
  │     └── main.dart
  ├── test/
  ├── web/
  └── pubspec.yaml
```

### **Feature-First Approach**

The `features/` folder structure groups code by **feature domains** (e.g., `hotels/`), enabling better maintainability and scalability. Changes to one feature do not affect other modules.

### **Explanation**

#### **Data**

- **models/**: Defines **data models** that come from APIs, JSON, or local data sources.  
  **Examples**: `hotel_model.dart`

- **repositories/**: Contains **implementation of repository interfaces** from the domain layer.  
  **Examples**: `hotel_repository_impl.dart`

- **data_sources/**: Defines **remote or local data sources** that access the API (e.g., Dio) or a local database (e.g., Hive).  
  **Examples**: `hotel_api_service.dart`, `local_hotel_data_source.dart`

#### **Domain**

- **entities/**: Defines **"pure" objects** that reflect business logic (independent of API).  
  **Examples**: `hotel_entity.dart`

- **repositories/**: Defines **abstract interfaces** for the repositories implemented in the **data layer**.  
  **Examples**: `hotel_repository.dart`

#### **Presentation**

- **screens/**: Defines **main screens** displayed to the user.  
  **Examples**: `hotel_list_screen.dart`, `hotel_detail_screen.dart`

- **widgets/**: Contains **reusable widgets** used in multiple screens.  
  **Examples**: `hotel_card.dart`, `loading_indicator.dart`

- **blocs/**: Contains **Bloc files** to manage the **state of the UI**.  
  **Examples**: `hotel_bloc.dart`, `hotel_event.dart`, `hotel_state.dart`

#### **Global Widgets**

Contains **reusable widgets** that can be used across multiple screens.  
 **Examples**: `app_card.dart`, `app_icon.dart`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## **Test Coverage**

[Image comming soon]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Changelog**

View changes and updates to the app [here](https://github.com/foxnoir/japanese_tutorials_app/blob/develop/CHANGELOG.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## **Acknowledgments**

- [Feature-first vs Layer-first Structure (Kody TechnoLab)](https://kodytechnolab.com/blog/layer-first-or-feature-first-flutter-project-structure/)
- [Flutter Project Structure (Code with Andrea)](https://codewithandrea.com/articles/flutter-project-structure/)
- [Dartz](https://medium.com/@samra.sajjad0001/exploring-the-purpose-and-usage-of-the-dartz-package-in-flutter-7902509939e9)
- [TDD](https://www.browserstack.com/guide/tdd-in-flutter)
- [clean architecture](https://dev.to/marwamejri/flutter-clean-architecture-1-an-overview-project-structure-4bhf)
- [Mocktail](https://www.dbestech.com/tutorials/flutter-test-with-mocktail)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
[auto-route]: https://img.shields.io/badge/Auto%20Route-00D09C.svg?style=for-the-badge&logo=autoroute&logoColor=white
[auto-route-url]: https://pub.dev/packages/auto_route

[auto-route]: https://img.shields.io/badge/Auto%20Route-00D09C.svg?style=for-the-badge&logo=autoroute&logoColor=white
[auto-route-url]: https://pub.dev/packages/auto_route
[bloc]: https://img.shields.io/badge/Bloc-8B0000.svg?style=for-the-badge&logo=bloc&logoColor=white
[bloc-url]: https://pub.dev/packages/bloc
[dart]: https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white
[dart-url]: https://dart.dev/
[dio]: https://img.shields.io/badge/Dio-FE5000.svg?style=for-the-badge&logo=internet-explorer&logoColor=white
[dio-url]: https://pub.dev/packages/dio
[dartz]: https://img.shields.io/badge/Dartz-1C4E80.svg?style=for-the-badge&logo=dart&logoColor=white
[dartz-url]: https://pub.dev/packages/dartz
[equatable]: https://img.shields.io/badge/Equatable-32CD32.svg?style=for-the-badge&logo=equatable&logoColor=white
[equatable-url]: https://pub.dev/packages/equatable
[firebase]: https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=firebase&logoColor=white
[firebase-url]: https://firebase.google.com/
[flutter]: https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-url]: https://flutter.dev/
[flutter-bloc]: https://img.shields.io/badge/Flutter%20Bloc-2E86C1.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-bloc-url]: https://pub.dev/packages/flutter_bloc
[flutter-localizations]: https://img.shields.io/badge/Flutter%20Localizations-0170F3.svg?style=for-the-badge&logo=flutter&logoColor=white
[flutter-localizations-url]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[flutter-secure-storage]: https://img.shields.io/badge/Flutter%20Secure%20Storage-2F4F4F.svg?style=for-the-badge&logo=lock&logoColor=white
[flutter-secure-storage-url]: https://pub.dev/packages/flutter_secure_storage
[get-it]: https://img.shields.io/badge/GetIt-007ACC.svg?style=for-the-badge&logo=getit&logoColor=white
[get-it-url]: https://pub.dev/packages/get_it
[hive]: https://img.shields.io/badge/Hive-FFB300.svg?style=for-the-badge&logo=hive&logoColor=white
[hive-url]: https://pub.dev/packages/hive
[injectable]: https://img.shields.io/badge/Injectable-009688.svg?style=for-the-badge&logo=injectable&logoColor=white
[injectable-url]: https://pub.dev/packages/injectable
[intl]: https://img.shields.io/badge/Intl-FFA500.svg?style=for-the-badge&logo=dart&logoColor=white
[intl-url]: https://pub.dev/packages/intl
[instagram-shield]: https://img.shields.io/badge/Instagram-%23E4405F.svg?style=for-the-badge&logo=instagram&logoColor=white
[instagram-url]: https://www.instagram.com/codeincouture/
[license-shield]: https://img.shields.io/badge/License-MIT-%23000000.svg?style=for-the-badge&logo=license&logoColor=white
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/LinkedIn-%230A66C2.svg?style=for-the-badge&logo=linkedin&logoColor=white
[linkedin-url]: https://www.linkedin.com/in/tanja-polz-5636401a5/
[mocktail]: https://img.shields.io/badge/Mocktail-blue.svg?style=for-the-badge&logo=dart&logoColor=white
[mocktail-url]: https://pub.dev/packages/mocktail
[twitter-shield]: https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=twitter&logoColor=white
[twitter-url]: https://twitter.com/_foxnoir_?lang=de
[very-good]: https://img.shields.io/badge/Very%20Good%20Analysis-B22C89.svg?style=for-the-badge&logo=verygood&logoColor=white
[very-good-url]: https://pub.dev/packages/very_good_analysis
