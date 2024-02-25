import 'package:flutter/material.dart';

void pushSlideRoute(BuildContext context, Widget page, String pageName) {
  Navigator.of(context).push(
    PageRouteBuilder(
      settings: RouteSettings(name: '/$pageName'),
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondAnimation) =>
          page,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondAnimation, Widget child) =>
          SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastLinearToSlowEaseIn,
                    reverseCurve: Curves.fastOutSlowIn)),
        child: child,
      ),
    ),
  );
}

void pushSlideRouteWithCallBack(BuildContext context, Widget page,
    String pageName, Function(dynamic value) onReturn) {
  Navigator.of(context)
      .push(
        PageRouteBuilder(
          settings: RouteSettings(name: '/$pageName'),
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastLinearToSlowEaseIn,
                    reverseCurve: Curves.fastOutSlowIn)),
            child: child,
          ),
        ),
      )
      .then((value) => onReturn(value));
}

void pushAndRemoveUntil(BuildContext context, Widget page, String pageName) {
  Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        settings: RouteSettings(name: '/$pageName'),
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) =>
            page,
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation, Widget child) =>
            SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastLinearToSlowEaseIn,
                      reverseCurve: Curves.fastOutSlowIn)),
          child: child,
        ),
      ),
      (Route<dynamic> route) => false);
}

void pushAndRemoveUntilSpecificPage(
    BuildContext context, Widget page, String pageName, String specificPage) {
  Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        settings: RouteSettings(name: '/$pageName'),
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation, Widget child) =>
            SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastLinearToSlowEaseIn,
                      reverseCurve: Curves.fastOutSlowIn)),
          child: child,
        ),
      ),
      ModalRoute.withName('/$specificPage'));
}

void pushAndRemoveUntilSpecificPageWithCallBack(BuildContext context,
    Widget page, String pageName, String specificPage, Function onReturn) {
  Navigator.of(context)
      .pushAndRemoveUntil(
          PageRouteBuilder(
            settings: RouteSettings(name: '/$pageName'),
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return page;
            },
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondAnimation,
                    Widget child) =>
                SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastLinearToSlowEaseIn,
                      reverseCurve: Curves.fastOutSlowIn)),
              child: child,
            ),
          ),
          ModalRoute.withName('/$specificPage'))
      .then((value) => onReturn(value));
}

void pushReplacement(BuildContext context, Widget page, String pageName) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      settings: RouteSettings(name: '/$pageName'),
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondAnimation, Widget child) =>
          SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastLinearToSlowEaseIn,
                    reverseCurve: Curves.fastOutSlowIn)),
        child: child,
      ),
    ),
  );
}

void popUntil(BuildContext context, String untilPageName) {
  Navigator.popUntil(context, ModalRoute.withName('/$untilPageName'));
}

Future<dynamic> asyncPushSlideRouteWithCallBack(
    BuildContext context, Widget page, String pageName) async {
  dynamic finalResult;
  finalResult = await Navigator.of(context).push(PageRouteBuilder(
    settings: RouteSettings(name: '/$pageName'),
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation) =>
        page,
    transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, Widget child) =>
        SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn)),
      child: child,
    ),
  ));
  return finalResult;
}

void popPage(BuildContext context, {dynamic returnData}) {
  Navigator.pop(context, returnData);
}
