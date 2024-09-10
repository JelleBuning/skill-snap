import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/db/users.dart';
import 'package:skill_snap/views/qr_screen.dart';

class ProfileScreen extends StatefulWidget {
  final int id;
  const ProfileScreen({super.key, required this.id});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Users.fetchById(widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          if (snapshot.hasError) return const Text("error");
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                snapshot.data["name"],
                style: const TextStyle(fontSize: 18),
              ),
              actions: [
                IconButton(
                  splashRadius: 25,
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                  icon: Icon(
                    Icons.tune,
                    color: ThemeColors.textSecondary,
                  ),
                ),
              ],
            ),
            endDrawerEnableOpenDragGesture: false,
            endDrawer: Drawer(
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      splashRadius: 25,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded)),
                  title: const Text(
                    'Configure profile',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                body: const Center(
                  child: Text('drawer'),
                ),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  profileInfo(
                      Color(int.parse(snapshot.data["color"], radix: 16)),
                      snapshot.data["posts"],
                      snapshot.data["followers"],
                      snapshot.data["following"]),
                ])),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  sliver: SliverGrid.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    children: List.generate(
                      12,
                      (index) {
                        return Card(
                          margin: const EdgeInsets.all(1),
                          child: Center(
                            child: Text(
                              '',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget profileInfo(
      Color avatarColor, int posts, int followers, int following) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: avatarColor,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _followingState(posts, "posts"),
                    const SizedBox(
                      width: 20,
                    ),
                    _followingState(followers, "followers"),
                    const SizedBox(
                      width: 20,
                    ),
                    _followingState(following, "following"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("follow"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("message"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QrScreen()),
                  ),
                  child: const Text("share profile"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _followingState(int amount, String text) {
    return Column(
      children: [
        Text(
          amount.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: TextStyle(color: ThemeColors.textSecondary),
        ),
      ],
    );
  }
}
