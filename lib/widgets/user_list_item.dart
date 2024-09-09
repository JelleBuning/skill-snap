import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';

class UserListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const UserListItem({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ThemeColors.card,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: ThemeColors.textSecondary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
