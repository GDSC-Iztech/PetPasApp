import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'manager/firebase_options.dart';
import 'product/auth/signInScreen.dart';
import 'product/auth/signUpScreen.dart';
import 'product/calendar/calendar.dart';
import 'product/home/homeScreen.dart';
import 'product/listPet/petAddToList.dart';
import 'product/listPet/petListScreen.dart';
import 'product/profile/passportScreen.dart';
import 'product/profile/profileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      pageBuilder: (context, state) => const MaterialPage(child: HomeView()),
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
          const MaterialPage(child: CalendarView()),
    ),
    GoRoute(
      path: '/passport',
      pageBuilder: (context, state) =>
          const MaterialPage(child: PassportScreen()),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => const MaterialPage(child: ProfileView()),
    ),
  ]);
}
