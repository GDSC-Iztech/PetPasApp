import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/petList.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor:
          Colors.blue, // Assuming you have appColor.blue defined elsewhere
      body: SafeArea(
        child: Column(
          children: [
            //header
            const CircleAvatar(
              radius: 80,
              // backgroundImage: AssetImage(widget.imageUrl!),
              // user profile image
              backgroundColor: Colors.white,
            ),
            Text("username"),
            const SizedBox(
              height: 25,
            ),
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to pet list screen
                      context.push('/petList');
                    },
                    child: const Text(
                      "Hayvanlarım",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to calendar screen
                      Navigator.pushNamed(context, '/calendar');
                    },
                    child: const Text(
                      "Gelecek Aşılar",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 6),
                margin: const EdgeInsets.only(top: 53),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: PetList(
                  filteredPets: listManager.allPets,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
