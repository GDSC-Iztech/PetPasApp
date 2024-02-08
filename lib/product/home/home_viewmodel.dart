import 'package:flutter/material.dart';
import 'package:petpas/manager/petlistmanager/list_manager.dart';

import '../../manager/auth_manager.dart';
import 'homeScreen.dart';

abstract class HomeViewmodel extends State<HomeView> {
  AuthManager authManager = AuthManager();
  ListManager listManager = ListManager();
}
