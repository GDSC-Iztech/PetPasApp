import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/view/screens/calenderScreen.dart';
import 'package:petpas/view/screens/passportScreen.dart';
import 'package:petpas/view/screens/petAddToList.dart';
import 'package:petpas/view/screens/petListScreen.dart';
import 'package:petpas/view/screens/profileScreen.dart';
import 'package:petpas/view/screens/signInScreen.dart';
import 'package:petpas/view/screens/signUpScreen.dart';
import 'package:petpas/view/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'PetPas', routerConfig: _router);
  }

  final GoRouter _router = GoRouter(initialLocation: '/signIn', routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/signIn',
      pageBuilder: (context, state) => const MaterialPage(
          child: SignInScreen(
        title: 'Giriş Yap',
      )),
    ),
    GoRoute(
      path: '/signUp',
      pageBuilder: (context, state) => const MaterialPage(
          child: SignUpScreen(
        title: 'Kayıt Ol',
      )),
    ),
    GoRoute(
      path: '/petList',
      pageBuilder: (context, state) =>
          const MaterialPage(child: PetListScreen()),
    ),
    GoRoute(
      path: '/petAdd',
      pageBuilder: (context, state) =>
          const MaterialPage(child: PetAddToList()),
    ),
    GoRoute(
      path: '/calender',
      pageBuilder: (context, state) =>
          const MaterialPage(child: CalenderScreen()),
    ),
    GoRoute(
      path: '/passport',
      pageBuilder: (context, state) =>
          const MaterialPage(child: PassportScreen()),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) =>
          const MaterialPage(child: ProfileScreen()),
    ),
  ]);
}
