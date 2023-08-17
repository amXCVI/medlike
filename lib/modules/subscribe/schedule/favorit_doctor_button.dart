import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/constants/tour_tooltip.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/modules/tour/tour_widget.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';

class FavoriteDoctorButton extends StatefulWidget {
  const FavoriteDoctorButton({
    Key? key,
    required this.userId,
    required this.buildingId,
    required this.clinicId,
    required this.doctorId,
    required this.categoryTypeId,
    required this.isFavorite,
  }) : super(key: key);

  final String userId;
  final String buildingId;
  final String clinicId;
  final String doctorId;
  final int categoryTypeId;
  final bool isFavorite;

  @override
  State<FavoriteDoctorButton> createState() => _FavoriteDoctorButtonState();
}

class _FavoriteDoctorButtonState extends State<FavoriteDoctorButton>
    with TickerProviderStateMixin {
  late final AnimationController _lottieAnimationController;
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _lottieAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    if (widget.isFavorite) {
      _lottieAnimationController.forward();
    }

    // Задерживаем появление подсказки, пока не завершится анимация появления страницы
    // Иначе может появиться не в том месте, где нужно
    Future.delayed(
        _lottieAnimationController.duration ??
            const Duration(milliseconds: 100), () {
      final state = context.read<TourCubit>().state;
      final tooltip = TourTooltip.of(context).create(
          TourTooltips.addDocToFavorite,
          width: 221,
          height: 44, onDismiss: () {
        context.read<TourCubit>().checkFavorite();
      });

      if (state.tourStatuses == TourStatuses.first &&
          state.isFavoriteShown != true) {
        tooltip.show(widgetKey: _key, offset: const Offset(0, 16));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void _handleTapOnFavoriteDoctor() {
      String categoryType =
          CategoryTypes.getCategoryTypeByCategoryTypeId(widget.categoryTypeId)
              .categoryType;

      if (widget.isFavorite) {
        context.read<SubscribeCubit>().deleteDoctorFromFavoritesList(
            userId: widget.userId,
            doctorId: widget.doctorId,
            categoryType: categoryType);
        _lottieAnimationController.reverse();
      } else {
        context.read<SubscribeCubit>().setDoctorToFavoritesList(
              userId: widget.userId,
              buildingId: widget.buildingId,
              clinicId: widget.clinicId,
              doctorId: widget.doctorId,
              categoryType: categoryType,
            );
        _lottieAnimationController.forward();
      }
    }

    return BlocBuilder<TourCubit, TourState>(
      builder: (cxt, state) {
        return IconButton(
          key: _key,
          onPressed: _handleTapOnFavoriteDoctor,
          icon: Lottie.asset(
            'assets/animations/favorite_doctor_button.json',
            controller: _lottieAnimationController,
            alignment: Alignment.center,
            repeat: false,
          ),
          tooltip: widget.isFavorite
              ? 'Удалить из избранных'
              : 'Добавить в избранные',
        );
      },
    );
  }
}
