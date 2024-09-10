import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/db/users.dart';
import 'package:skill_snap/views/profile_screen.dart';
import 'package:skill_snap/widgets/user_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextEditingController = TextEditingController();
  final _searchFocusNode = FocusNode();
  List<dynamic> _users = [];
  List<Widget> _userWidgets = [];
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    Users.fetch().then((value) => _users = value);
  }

  void _searchChanged(String value) {
    value = value.toLowerCase();
    setState(() {
      if (value.isEmpty) {
        _userWidgets = [];
        return;
      }

      _userWidgets = _users.where(
        (u) {
          var title = u["name"].toLowerCase();
          return title.contains(value) ||
              title.startsWith(value) ||
              title.endsWith(value);
        },
      ).map((u) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen(id: u["id"])),
          ),
          child: UserListItem(
              avatarColor: Color(int.parse(u["color"], radix: 16)),
              username: u["name"],
              subTitle:
                  '@${u["name"].replaceAll(' ', '')}${Random().nextInt(99)}'),
        );
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
                  onPressed: () => setState(
                        () {
                          _searching = false;
                          searchTextEditingController.clear();
                          _searchFocusNode.unfocus();
                        },
                      ),
                  icon: const Icon(Icons.arrow_back_rounded))
              : null,
          title: Padding(
            padding: EdgeInsets.fromLTRB((_searching ? 0 : 20), 10, 20, 10),
            child: SizedBox(
              height: 40,
              child: TextField(
                focusNode: _searchFocusNode,
                controller: searchTextEditingController,
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
        body: _searching ? _searchBody() : _gridPlaceholder());
  }

  Widget _searchBody() {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        ..._userWidgets
      ],
    );
  }

  Widget _gridPlaceholder() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 3 / 4,
      children: List.generate(99, (index) {
        return Card(
          margin: const EdgeInsets.all(1),
          child: Center(
            child: Text(
              '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        );
      }),
    );
  }
}
