import 'package:flutter/material.dart';

import '../../manager/petlistmanager/list_manager.dart';
import 'profileScreen.dart';

abstract class ProfileViewModel extends State<ProfileView> {
  ListManager listManager = ListManager();
}
