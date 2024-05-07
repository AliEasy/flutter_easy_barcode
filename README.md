
# 🌍 About Project - EasyBarcode
This application has been developed and published to provide a sample code, and continuing its development is recreational. Any PR is accepted though :)

# 🛠 Built With
- platform/ language: [Flutter / Dart](https://docs.flutter.dev/)
- state manager: [BLOC](https://bloclibrary.dev/#/)
- architecture: [BLOC](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1) / [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- build_runner: [Build runner](https://pub.dev/packages/build_runner)
- injectable: [Injectable](https://pub.dev/packages/injectable)
- get_it: [Get it](https://pub.dev/packages/get_it)

# 📐 Structure and Architecture

# source structure :
```
/core
  lib/
    core/
        common/
          util/ 
        config/
           locale/
           theme/
        di/
            base/
        service/
                language_theme/
        uikit/    
    l10n/
    utils/
          constants/
          enumeration/
          extension/
          helper/
    features/
          create_barcode/       
          home_page/       
          scan_barcode/
                       
           
                
```

- core: Includes general and base helpers, ...
- data: Includes data sources, models, ...
- domain: Include use-cases, entities, ...
- presentation: Includes all feature pages and presentation base classes, ...
- l10n: Includes strings in different language.


# 🏳 Highly Used Commands
```bash
   flutter pub run build_runner build --delete-conflicting-outputs
```
```bash
   flutter gen-l10n
```


# 📚 Acknowledgements

- [Clean architecture in flutter](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)
- [Clean coding in flutter](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)
- [Modularization in flutter](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a)
- [Dependency injection with get it](https://pub.dev/packages/get_it)
- [Bloc Architecture in flutter](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)
