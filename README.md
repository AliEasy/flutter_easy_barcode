
# 🌍 About Project
Digital banking Neo Bank.

# 🛠 Built With
- platform/ language: [Flutter / Dart](https://docs.flutter.dev/)
- state manager: [BLOC](https://bloclibrary.dev/#/)
- architecture: [BLOC](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1) / [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- build_runner: [Build runner](https://pub.dev/packages/build_runner)
- retrofit: [Retrofit](https://pub.dev/packages/retrofit)
- freezed: [Freezed](https://pub.dev/packages/freezed)
- injectable: [Injectable](https://pub.dev/packages/injectable)
- get_it: [Get it](https://pub.dev/packages/get_it)
- auto_route: [Auto route](- hive: [Hive](https://pub.dev/packages/hive) / [Hive Generator](https://pub.dev/packages/hive_generator)
  https://pub.dev/packages/auto_route)

# 📐 Structure and Architecture

### source structure :
```
/core
  lib/
    core/
        base/
          data/ 
                local/
                remote/
                repositories/
          domain/
                  entities/
                  repositories/
                  usecase/
        di/
            base/
            local/
            network/
        service/
                network/
                storage/
        validators/    
    l10n/
    utils/
          constants/
          enumeration/
          extension/
          helper/
    features/
          account_opening/       
          balance_inquiry/       
          base/       
          bill_payment/       
          bill_payment_by_id/       
          biometric_activation/       
          card_activation/       
          card_ban/       
          change_password/       
          change_username/       
          connection_failed/       
          deposit_card_account_list/       
          deposit_detail_inquiry/       
          intro/       
          login/       
          mobile_bill_payment/       
          password_management/       
          receipt/       
          register/   
          report_statement/    
          reports/
                card_transaction_history/
                transaction_history/
          splash/
          transfer/
                ach_transfer/
                card_transfer/
                card_transfer_to_deposit/
                deposit_transfer/
                pol_transfer/
                rtgs_transfer/
          utility_features/
                        app_version/
                        banks_info/
                        nearby_branches/
                        user_info/
                       
           
                
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

# 🛠 Build command used
- flutter build apk --flavor prod -t lib/main_prod.dart
- flutter build appbundle --flavor prod -t lib/main_prod.dart

- flutter build apk --flavor stage -t lib/main_stage.dart
- flutter build appbundle --flavor stage -t lib/main_stage.dart

- flutter build apk --flavor dev -t lib/main_dev.dart
- flutter build appbundle --flavor dev -t lib/main_dev.dart

- flutter pub run build_runner build --delete-conflicting-outputs

### Cleaning :

- No DRY violations. Create utility files to avoid duplicate code.
- Components should follow the single responsibility principle.
- If you have unfinished task, put a `TODO` before commit.
- Methods that are longer than the screen should be refactored into smaller units.


# 🧾 Coding Rules

### Naming

| what | how     | etc    |
| :-------- | :------- | :---------- |
| Classes, enums, typedefs | Pascal Case | ProductBloc  |
| Libraries, packages, directories, and source files names | snake_case | product_detail_view  |
| Variables, constants, parameters, and named parameters | camel Case | variants  |

### Cleaning
[Read this article about clean coding in flutter]("https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5")
- Create widgets int uikit for common components
- Don't use directly colors or font style, use uikit
- Split widgets into sub Widgets
- Create components package for sub widgets in each features
- Specify types for class member
- Use if condition instead of conditional expression
- Use ?? and ?. operators
    ```
    var result = title ?? "-";
    var result = person?.name ?? "-";
    ```
- User cascade operators
    ```
    // Don't
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    // Do
    var path = Path()
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();
    ```
- Use Const in Widgets

# ⛑ Code Review

**What Do Code Reviewers Look For?**
- Code reviews should look at:

- Design: Is the code well-designed and appropriate for your system?
- Functionality: Does the code behave as the author likely intended? Is the way the code behaves well for its users?
- Complexity: Could the code be made simpler? Would another developer be able to easily understand and use this code when they come across it in the future?
- Tests: Does the code have correct and well-designed automated tests?
- Naming: Did the developer choose clear names for variables, classes, methods, etc.?
- Comments: Are the comments clear and useful?
- Style: Does the code follow our style guides?
- Documentation: Did the developer also update relevant documentation?
- How to implement code review?


**According to the above points every merge request (pull request), must meet the check-list for ensuring about any concern maybe happened in the process.**

- check branch is not broken
- check feature is fulfill
- check test-case is passed
- check code style (with lint or manually)
- check readability
- check side-effects
- check consistency with other class/package/module
- check all comments on the merge request
- The reviewer if has any point about the merge request (pull request) leaves a comment on the line.

# 📚 Acknowledgements

- [Clean architecture in flutter](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)
- [Clean coding in flutter](https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5)
- [Modularization in flutter](https://medium.com/flutter-community/mastering-flutter-modularization-in-several-ways-f5bced19101a)
- [Dependency injection with get it](https://pub.dev/packages/get_it)
- [Bloc Architecture in flutter](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)