import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medlike/constants/category_types.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    context.read<TourCubit>().show(TourStage.favorite);
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

    return BlocListener<TourCubit, TourState>(
      listener: (cxt, state) {
        final tooltip = TourTooltip.of(context).create(
          'Добавьте врача в избранные',
          width: 221,
          height: 44
        );

        if(state.tourStatuses == TourStatuses.first
          && state.tourStage == TourStage.favorite
        ) {
          tooltip.show(
            widgetKey: _key,
          );
        }   
      },
      child: IconButton(
        onPressed: _handleTapOnFavoriteDoctor,
        icon: Lottie.asset(
          key: _key,
          'assets/animations/favorite_doctor_button.json',
          controller: _lottieAnimationController,
          alignment: Alignment.center,
          repeat: false,
        ),
        tooltip: widget.isFavorite.toString(),
      )
    );
  }
}
