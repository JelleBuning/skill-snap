import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';

class UserListItem extends StatelessWidget {
  final String username;
  final String subTitle;
  final Color? avatarColor;
  const UserListItem(
      {super.key,
      required this.username,
      required this.subTitle,
      this.avatarColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: avatarColor ?? ThemeColors.card,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width * 0.66),
                  child: Text(
                    subTitle,
                    style: TextStyle(
                        color: ThemeColors.textSecondary,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
