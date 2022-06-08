import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isChildrenPage,
    this.isSearch = false,
    required this.actions,
    this.filteringFunction,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final String subtitle;
  final bool isChildrenPage;
  final bool isSearch;
  final List<Widget> actions;
  final void Function(String searchingStr)? filteringFunction;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearchMode = false;
  String searchQuery = "Search query";

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearchMode = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
    if (newQuery.length > 2) {
      _handleSearch();
    }
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearchMode = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
    widget.filteringFunction!('');
  }

  void _handleSearch() {
    widget.filteringFunction!(_searchQueryController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      centerTitle: true,
      title: _isSearchMode
          ? TextField(
              controller: _searchQueryController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Поиск...",
                border: InputBorder.none,
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightText),
              ),
              style: Theme.of(context).textTheme.labelLarge,
              onChanged: (query) => updateSearchQuery(query),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                _handleSearch();
              },
            )
          : Column(
              children: [
                Text(widget.title,
                    style: Theme.of(context).textTheme.headlineMedium),
                widget.subtitle.isNotEmpty
                    ? Text(
                        widget.subtitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    : const SizedBox(),
              ],
            ),
      leading: widget.isChildrenPage
          ? IconButton(
              onPressed: () {
                RouteData.of(context).router.popTop();
              },
              icon: SvgPicture.asset(
                  'assets/icons/app_bar/app_bar_back_icon.svg'))
          : IconButton(
              onPressed: () {
                RouteData.of(context).router.navigateNamed(AppRoutes.main);
              },
              icon: Image.asset('assets/icons/ic_logo_launch.png'),
            ),
      actions: widget.isSearch
          ? [
              IconButton(
                  onPressed: () {
                    if (_isSearchMode) {
                      _stopSearching();
                      Navigator.pop(context);
                    } else {
                      _startSearch();
                    }
                  },
                  icon: SvgPicture.asset(_isSearchMode
                      ? 'assets/icons/app_bar/close_search.svg'
                      : 'assets/icons/app_bar/search_icon.svg'))
            ]
          : widget.actions,
    );
  }
}
