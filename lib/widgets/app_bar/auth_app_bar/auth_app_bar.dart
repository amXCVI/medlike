import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.onPressedAppLogo,
  })  : preferredSize = const Size.fromHeight(80),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  final String title;
  final String subtitle;
  final bool isChildrenPage;
  final bool isSearch;
  final List<Widget> actions;
  final void Function(String searchingStr)? filteringFunction;
  final void Function()? onPressedAppLogo;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearchMode = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    super.initState();
    actions = widget.actions.isNotEmpty ? widget.actions : [const SizedBox(width: 28,)];
  }

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

    /// Здесь можно задать минимальо необходимое кол-во букв для начала поиска
    if (newQuery.isNotEmpty || newQuery.isEmpty) {
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

  late List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainAppBackground,
      foregroundColor: AppColors.mainText,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.isChildrenPage
              ? IconButton(
                  onPressed: () {
                    RouteData.of(context).router.popTop();
                  },
                  icon: SvgPicture.asset(
                      'assets/icons/app_bar/app_bar_back_icon.svg'))
              : IconButton(
                  onPressed: () {
                    widget.onPressedAppLogo != null
                        ? widget.onPressedAppLogo!()
                        : RouteData.of(context)
                            .router
                            .navigateNamed(AppRoutes.main);
                    HapticFeedback.lightImpact();
                  },
                  icon: Image.asset('assets/icons/app_bar/ic_logo_filled.png',
                      width: 28.0),
                ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _isSearchMode
                  ? [
                      SizedBox(
                        width: 250,
                        child: TextField(
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
                        ),
                      ),
                    ]
                  : [
                      FittedBox(
                        fit: BoxFit.scaleDown, 
                        child: Text(
                          widget.title.characters
                              .replaceAll(Characters(''), Characters('\u{200B}'))
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      widget.subtitle.isNotEmpty
                          ? Text(
                              widget.subtitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 10),
                    ],
            ),
          ),
          Row(
            children: widget.isSearch
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
                : actions,
          )
        ],
      ),
      // title: _isSearchMode
      //     ? TextField(
      //         controller: _searchQueryController,
      //         autofocus: true,
      //         decoration: InputDecoration(
      //           hintText: "Поиск...",
      //           border: InputBorder.none,
      //           focusedBorder: InputBorder.none,
      //           hintStyle: Theme.of(context)
      //               .textTheme
      //               .labelLarge
      //               ?.copyWith(color: AppColors.lightText),
      //         ),
      //         style: Theme.of(context).textTheme.labelLarge,
      //         onChanged: (query) => updateSearchQuery(query),
      //         textInputAction: TextInputAction.search,
      //         onSubmitted: (value) {
      //           _handleSearch();
      //         },
      //       )
      //     : Column(
      //         children: [
      //           Text(
      //             widget.title.characters
      //                 .replaceAll(Characters(''), Characters('\u{200B}'))
      //                 .toString(),
      //             style: Theme.of(context)
      //                 .textTheme
      //                 .headlineMedium
      //                 ?.copyWith(fontWeight: FontWeight.w500),
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //           widget.subtitle.isNotEmpty
      //               ? Text(
      //                   widget.subtitle,
      //                   style: Theme.of(context).textTheme.headlineSmall,
      //                 )
      //               : const SizedBox(),
      //         ],
      //       ),
      // leading: widget.isChildrenPage
      //     ? IconButton(
      //         onPressed: () {
      //           RouteData.of(context).router.popTop();
      //         },
      //         icon: SvgPicture.asset(
      //             'assets/icons/app_bar/app_bar_back_icon.svg'))
      //     : IconButton(
      //         onPressed: () {
      //           widget.onPressedAppLogo != null
      //               ? widget.onPressedAppLogo!()
      //               : RouteData.of(context)
      //                   .router
      //                   .navigateNamed(AppRoutes.main);
      //           HapticFeedback.lightImpact();
      //         },
      //         icon: Image.asset('assets/icons/app_bar/ic_logo_filled.png',
      //             width: 28.0),
      //       ),
      // actions: widget.isSearch
      //     ? [
      //         IconButton(
      //             onPressed: () {
      //               if (_isSearchMode) {
      //                 _stopSearching();
      //                 Navigator.pop(context);
      //               } else {
      //                 _startSearch();
      //               }
      //             },
      //             icon: SvgPicture.asset(_isSearchMode
      //                 ? 'assets/icons/app_bar/close_search.svg'
      //                 : 'assets/icons/app_bar/search_icon.svg'))
      //       ]
      //     : widget.actions,
    );
  }
}
