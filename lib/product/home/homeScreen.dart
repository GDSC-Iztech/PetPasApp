import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/constants/constants.dart';
import 'package:petpas/widgets/petList.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewmodel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Pets"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                context.push('/profile');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                      // user pp
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'User Name ',
                      style: TextStyle(
                        color: appColor.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Other Drawer items
              ListTile(
                title: const Text(' Profil'),
                onTap: () {
                  context.push('/profile');
                },
              ),
              ListTile(
                title: const Text('Hayvanlarim'),
                onTap: () {
                  context.push('/petList');
                },
              ),
              ListTile(
                // gelecek asilari gosteren bir takvim olmali.
                // takvim sayfasi su an hayvanin profilini gosteriyor.
                title: const Text('Takvim'),
                onTap: () {
                  context.push('/calender');
                },
              ),
              ListTile(
                title: const Text('Hayvan Ekle'),
                onTap: () {
                  context.push("/petAdd");
                },
              ),
              ListTile(
                title: const Text('Cikis'),
                onTap: () {
                  authManager.logout();
                  context.push('/signIn');
                  // log out
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PetList(
              filteredPets: listManager.allPets,
              isVertical: false,
            ),
          ],
        ));
  }
}
