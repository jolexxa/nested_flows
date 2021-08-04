import 'package:flutter/material.dart';

class PageWithoutEnter<T> extends Page<T> {
  const PageWithoutEnter({
    LocalKey? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (_, animation, secondaryAnimation) {
        if (animation.status == AnimationStatus.forward) {
          return child;
        } else {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }
      });
}
