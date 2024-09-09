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
        title: "Henry",
        subTitle:
            "d dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived no"),
    UserListItem(title: "Fatima Blake", subTitle: "I’m going to the bathroom."),
    UserListItem(
        title: "Vincent Yang",
        subTitle: "I have to go to the meeting in an hour."),
    UserListItem(title: "John Doe", subTitle: "hahah, okay!"),
    UserListItem(
        title: "Parker Hale",
        subTitle: "Everything is coming to you, but you’re in the wrong lane."),
    UserListItem(
        title: "Mavis Love",
        subTitle: "If animals could talk, which would be the rudest?"),
    UserListItem(
        title: "Crosby Valencia",
        subTitle: "Do you ever get the random urge to spend 50 for no reason?"),
    UserListItem(
        title: "Brynlee Stevens",
        subTitle: "I respect the opinion of everyone who agrees with me."),
  ];
  List<UserListItem> _userWidgets = [];
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    _userWidgets = _allUserWidgets;
  }

  void _searchChanged(String value) {
    value = value.toLowerCase();
    setState(() {
      _userWidgets = _allUserWidgets.where((u) {
        var title = u.title.toLowerCase();
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
          leading: _searching
              ? IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => setState(() => _searching = false),
                  icon: const Icon(Icons.arrow_back_rounded))
              : null,
          title: Padding(
            padding: EdgeInsets.fromLTRB((_searching ? 0 : 20), 10, 20, 10),
            child: SizedBox(
              height: 40,
              child: TextField(
                onTap: () => setState(() => _searching = true),
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
