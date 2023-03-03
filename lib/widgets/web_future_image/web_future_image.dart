import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/images/image_cubit.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class WebFutureImage extends StatefulWidget {
  const WebFutureImage({
    Key? key,
    required this.imageUrl,
    this.radius,
    this.isWithButton = false,
  }) : super(key: key);

  final String imageUrl;
  final double? radius;
  final bool isWithButton;

  @override
  State<WebFutureImage> createState() => _WebFutureImageState();
}

class _WebFutureImageState extends State<WebFutureImage> {

  @override
  void initState() {
    super.initState();
    _checkData();
  }

  void _checkData() {
    if(!context.read<ImageCubit>().state.hasUrl(widget.imageUrl)) {
      context.read<ImageCubit>().addUrl(widget.imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (BuildContext context, ImageState state) {
        if (state.hasUrl(widget.imageUrl) || !widget.isWithButton) {
          return Center(
            child: state.getUrl(widget.imageUrl).isNotEmpty
                ? Image.asset(
                    state.getUrl(widget.imageUrl),
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
          );
        } else {
          return const Center(
            child: CircularLoader(),
          );
        }
      },
    );
  }
}
