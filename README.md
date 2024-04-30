
# 🌍 About Project
Digital banking Neo Bank.

# 🛠 Built With
- platform/ language: [Flutter / Dart](https://docs.flutter.dev/)
- state manager: [BLOC](https://bloclibrary.dev/#/)
- architecture: [BLOC](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1) / [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- build_runner: [Build runner](https://pub.dev/packages/build_runner)
- injectable: [Injectable](https://pub.dev/packages/injectable)
- get_it: [Get it](https://pub.dev/packages/get_it)

# 📐 Structure and Architecture

### source structure :
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

**core**: includes error hand-long, general use-cases ....
* **base** : includes all extension.
* **common** : includes all extension.
* **config** : includes all extension.
* **di** : includes dependency injection related files.
* **encryption** : includes dependency injection related files.
* **search** : includes dependency injection related files.
* **service** : includes dependency injection related files.
* **share**: includes all regex, ....
* **uikit**: includes widgets, general ui component, styles, colors, ....

**data**: includes data sources, models.
**domain**: is clean architecture domain layout (include use-cases, entities, ...).
**presentation**: includes all feature pages and presentation base classes.

**l10n**: includes strings in different language.

- flutter pub run build_runner build --delete-conflicting-outputs

# 📚 Acknowledgements

- [Clean architecture in flutter](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)
- [Clean coding in flutter](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)
- [Modularization in flutter](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a)
- [Dependency injection with get it](https://pub.dev/packages/get_it)
- [Bloc Architecture in flutter](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)