import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';

class ScheduleAppBar extends StatefulWidget {
  const ScheduleAppBar({
    Key? key,
    required this.title,
    required this.isChildrenPage,
    this.backgroundImageUrl,
    required this.actions,
    required this.isDoctorAppBar,
  }) : super(key: key);

  final String title;
  final bool isChildrenPage;
  final bool isDoctorAppBar;
  final String? backgroundImageUrl;
  final List<Widget> actions;

  @override
  State<ScheduleAppBar> createState() => _ScheduleAppBarState();
}

class _ScheduleAppBarState extends State<ScheduleAppBar> {
  @override
  Widget build(BuildContext context) {
    double top = 0.0;

    return SliverAppBar(
      snap: true,
      pinned: true,
      floating: true,
      expandedHeight: widget.isDoctorAppBar ? 250.0 : 80,
      collapsedHeight: 80,
      elevation: 0.0,
      actions: widget.actions,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        top = constraints.biggest.height;
        return FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          expandedTitleScale: 1,
          collapseMode: CollapseMode.pin,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: top < 150 ? 1.0 : 0.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  child: Text(
                    widget.title.characters
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.bottomCenter,
                height: 24,
                // margin: EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 4,
                      offset: Offset(0, -1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          background: widget.backgroundImageUrl != null && widget.isDoctorAppBar
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                    return CachedNetworkImage(
                      height: 250,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      imageUrl: widget.backgroundImageUrl as String,
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      httpHeaders: {'Authorization': 'Bearer ${state.token}'},
                    );
                  }),
                )
              : const SizedBox(),
        );
      }),
    );
  }
}
