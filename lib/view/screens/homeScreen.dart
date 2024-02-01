import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/constants/constants.dart';
import 'package:petpas/view/widgets/petCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              context.go('/profile');
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
                context.go('/profile');
              },
            ),
            ListTile(
              title: const Text('Hayvanlarim'),
              onTap: () {
                context.go('/petList');
              },
            ),
            ListTile(
              title: const Text('Takvim'),
              onTap: () {
                context.go('/calender');
              },
            ),
            ListTile(
              title: const Text('Hayvan Ekle'),
              onTap: () {
                context.go("/petAdd");
              },
            ),
            ListTile(
              title: const Text('Cikis'),
              onTap: () {
                context.go('/signIn');
                // log out
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PetCard(
                  petName: "Odin",
                  petAge: 5,
                  petType: "Sarman",
                  image: "assets/cat.png",
                ),
                PetCard(
                  petName: "Odin",
                  petAge: 5,
                  petType: "Sarman",
                  image: "assets/cat.png",
                ),
                PetCard(
                  petName: "Odin",
                  petAge: 5,
                  petType: "Sarman",
                  image: "assets/cat.png",
                )
                // Add more PetCard widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
