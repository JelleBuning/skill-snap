import 'package:flutter/material.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/widgets/user_list_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _searching = false;

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
        body: _searching ? _searchBody() : _recommendedBody());
  }

  Widget _searchBody() {
    return ListView(
      children: const [
        SizedBox(
          height: 10,
        ),
        UserListItem(title: "JohnDoe291", subTitle: "John Doe"),
        UserListItem(title: "JohnDoe291", subTitle: "John Doe"),
        UserListItem(title: "JohnDoe291", subTitle: "John Doe"),
      ],
    );
  }

  Widget _recommendedBody() {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
        children: List.generate(99, (index) {
          return Card(
            margin: const EdgeInsets.all(2.5),
            child: Center(
              child: Text(
                'Item',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }),
      ),
    );
  }
}
