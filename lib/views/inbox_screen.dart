import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/widgets/user_list_item.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final List<UserListItem> _allUserWidgets = const [
    UserListItem(
        avatarColor: Color(0x718294ff),
        username: "Alice Smith",
        subTitle: "Hi, how are you doing?"),
  ];
  List<UserListItem> _userWidgets = [];

  @override
  void initState() {
    super.initState();
    _userWidgets = _allUserWidgets;
  }

  void _searchChanged(String value) {
    value = value.toLowerCase();
    setState(() {
      _userWidgets = _allUserWidgets.where((u) {
        var title = u.username.toLowerCase();
        var subTitle = u.subTitle.toLowerCase();
        return title.contains(value) ||
            title.startsWith(value) ||
            title.endsWith(value) ||
            subTitle.contains(value) ||
            u.subTitle.toLowerCase().startsWith(value) ||
            u.subTitle.toLowerCase().endsWith(value);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: SizedBox(
              height: 40,
              child: TextField(
                onChanged: (value) => _searchChanged(value),
                cursorColor: ThemeColors.primaryColor,
                autofocus: false,
                style: const TextStyle(fontSize: 16, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: ThemeColors.card,
                  focusColor: ThemeColors.primaryColor,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  prefixIconColor: ThemeColors.primaryColor,
                  hintStyle: TextStyle(
                    color: ThemeColors.textSecondary,
                  ),
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
        ),
        body: _inboxBody());
  }

  Widget _inboxBody() {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        ..._userWidgets
      ],
    );
  }
}
