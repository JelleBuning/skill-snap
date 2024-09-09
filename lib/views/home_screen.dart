import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: List.generate(
            99,
            (index) {
              return SizedBox(
                child: Center(
                  child: Text(
                    'video',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
