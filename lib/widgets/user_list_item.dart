import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';

class UserListItem extends StatefulWidget {
  final String title;
  final String subTitle;
  const UserListItem({super.key, required this.title, required this.subTitle});

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
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
                  widget.title,
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width * 0.66),
                  child: Text(
                    widget.subTitle,
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
