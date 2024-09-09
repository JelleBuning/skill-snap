import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/views/qr_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('John Doe'),
          centerTitle: true,
        ),
        body: _profileContent());
  }

  Widget _profileContent() {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          profileInfo(),
        ])),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            children: List.generate(
              99,
              (index) {
                return Card(
                  margin: const EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      'Item',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget profileInfo() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: ThemeColors.card,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                "@John_Doe19",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Edit profile"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QrScreen()),
                  ),
                  child: const Icon(Icons.qr_code_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
