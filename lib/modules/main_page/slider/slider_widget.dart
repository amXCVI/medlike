import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/clinics/clinics_cubit.dart';
import 'package:medlike/modules/main_page/slider/slide_item.dart';
import 'package:medlike/modules/main_page/slider/slider_page_indicators.dart';
import 'package:medlike/modules/main_page/slider/slider_skeleton.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    context.read<ClinicsCubit>().getMainscreenPromotionsList();

    return BlocBuilder<ClinicsCubit, ClinicsState>(
      builder: (context, state) {
        if (state.getMainscreenPromotionsListStatus ==
                GetMainscreenPromotionsListStatuses.failed ||
            state.getMainscreenPromotionsListStatus ==
                    GetMainscreenPromotionsListStatuses.success &&
                state.mainscreenPromotionsList!.isEmpty) {
          return const SizedBox();
        } else if (state.getMainscreenPromotionsListStatus ==
            GetMainscreenPromotionsListStatuses.success) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CarouselSlider(
                    items: state.mainscreenPromotionsList
                        ?.map((e) => SlideItem(
                              promotionItem: e,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 0.93,
                      aspectRatio: 16 / 9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      onPageChanged: (page, reason) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 16 * 9 - 32,
                  width: MediaQuery.of(context).size.width,
                  child: SliderPageIndicators(
                    indicators: state.mainscreenPromotionsList!
                        .asMap()
                        .map((index, item) => MapEntry(index, ''))
                        .keys
                        .toList(),
                    activeIndicator: activePage,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SliderSkeleton();
        }
      },
    );
  }
}
