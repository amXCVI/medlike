import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/navigation/routes_names_map.dart';
import 'package:medlike/themes/colors.dart';

class MedcardAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MedcardAppBar({
    Key? key,
    required this.title,
    required this.filteringFunction,
    this.isChildrenPage = false, required this.handleTapOnFiltersButton,
    required this.handleResetFilters,
  })  : preferredSize = const Size.fromHeight(56),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final bool isChildrenPage;
  final void Function(String searchingStr) filteringFunction;
  final void Function() handleTapOnFiltersButton;
  final void Function() handleResetFilters;

  @override
  _MedcardAppBarState createState() => _MedcardAppBarState();
}

class _MedcardAppBarState extends State<MedcardAppBar> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearchMode = false;
  String searchQuery = "Search query";

  bool _isFiltersMode = false;

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
    if (newQuery.length > 2 || newQuery.isEmpty) {
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
    widget.filteringFunction('');
  }

  void _handleSearch() {
    widget.filteringFunction(_searchQueryController.text);
  }

  void _startFiltering() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopFiltering));

    widget.handleTapOnFiltersButton();
    setState(() {
      _isFiltersMode = true;
    });
  }

  void _stopFiltering() {
    setState(() {
      _isFiltersMode = false;
    });
  }

  void _handleFiltering() {
    widget.handleTapOnFiltersButton();
    Navigator.pop(context);
    _stopFiltering();
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
                  focusedBorder: InputBorder.none,
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
            : _isFiltersMode
                ? Text('Фильтр',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500))
                : Text(
                    widget.title.characters
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
        leading: _isFiltersMode
            ? IconButton(
                onPressed: () {
                  widget.handleResetFilters();
                  RouteData.of(context).router.popTop();
                  HapticFeedback.vibrate();
                },
                icon: SvgPicture.asset('assets/icons/app_bar/close_search.svg'))
            : widget.isChildrenPage
                ? IconButton(
                    onPressed: () {
                      RouteData.of(context).router.popTop();
                      HapticFeedback.vibrate();
                    },
                    icon: SvgPicture.asset(
                        'assets/icons/app_bar/app_bar_back_icon.svg'))
                : IconButton(
                    onPressed: () {
                      RouteData.of(context)
                          .router
                          .navigateNamed(AppRoutes.main);
                      HapticFeedback.vibrate();
                    },
                    icon: Image.asset('assets/icons/ic_logo_launch.png',
                        width: 28.0),
                  ),
        actions: [
          !_isFiltersMode && !_isSearchMode
              ? IconButton(
                  onPressed: () {
                    _startFiltering();
                  },
                  icon:
                      SvgPicture.asset('assets/icons/app_bar/filters_icon.svg'))
              : const SizedBox(),
          _isFiltersMode
              ? IconButton(
                  onPressed: () {
                    _handleFiltering();
                  },
                  icon:
                      SvgPicture.asset('assets/icons/app_bar/ic_check_filters.svg'))
              : IconButton(
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
        ]);
  }
}
