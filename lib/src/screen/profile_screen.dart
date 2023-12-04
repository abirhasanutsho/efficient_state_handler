import 'package:flutter/material.dart';

import '../../controller/profile_controller.dart';
import '../../widget/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Builder(builder: (BuildContext context) {
          final profile = controller.profileInfo;

          return profile.onState(
            fetched: (value) => ProfileCard(value),
            failed: (e) => const Center(
              child: Text("Something Went Wrong"),
            ),
            loading: () => const CircularProgressIndicator(),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.fetchData();
              });
            },
            child: const Text('Fetch'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.setFailed();
              });
            },
            child: const Text('Failed'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.setLoading();
              });
            },
            child: const Text('Loading'),
          ),
        ],
      ),
    );
  }
}
