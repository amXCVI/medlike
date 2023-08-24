import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gif/gif.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/tour/tour_cubit.dart';
import 'package:medlike/utils/api/api_constants.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/tour_tooltip/tour_tooltip.dart';
import 'package:skeletons/skeletons.dart';

class CabinetFindImage extends StatefulWidget {
  const CabinetFindImage({required this.cabinetId});

  final String cabinetId;

  @override
  _CabinetFindImageState createState() => _CabinetFindImageState();
}

class _CabinetFindImageState extends State<CabinetFindImage>
    with TickerProviderStateMixin {
  late GifController _gifCtrl;
  final GlobalKey<State<StatefulWidget>> _gifKey = GlobalKey();

  @override
  void initState() {
    _gifCtrl = GifController(vsync: this);
    super.initState();
  }

  Widget _loadAsGif(BuildContext context) => Gif(
        key: _gifKey,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        autostart: Autostart.once,
        image: NetworkImage(
          '${ApiConstants.baseUrl}/api/v1.0/doctors/image/${widget.cabinetId}?isThumbnail=false',
          headers: {
            'Authorization':
                'Bearer ${UserSecureStorage.getField(AppConstants.accessToken)}'
          },
        ),
        controller: _gifCtrl,
        placeholder: (context) => const Center(
          heightFactor: 10,
          child: CircularProgressIndicator(),
        ),
        // onFetchCompleted: () {
        //   final Map<TourChecked, bool>? tourState =
        //       context.read<TourCubit>().state.tourChecked;
        //   if (!(tourState?[TourChecked.gifReload] ?? false)) {
        //     TourTooltip.of(context).create(
        //         "Нажмите чтобы перезапустить анимацию", _gifKey,
        //         onDismiss: () =>
        //             context.read<TourCubit>().checkItem(TourChecked.gifReload));
        //   }
        // },
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _gifCtrl.reset();
        _gifCtrl.forward();
      },
      child: _loadAsGif(context),
    );
  }
}
