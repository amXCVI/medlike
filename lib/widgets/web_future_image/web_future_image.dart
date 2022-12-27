import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:medlike/data/repository/images_repository.dart';
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
  late final Future<Uint8List> imageFuture;
  late final Future<String> botXImage;

  @override
  void initState() {
    super.initState();
    botXImage = _getData();
  }

  Future<String> _getData() {
    return ImagesRepository.getPathImageFile(url: widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: botXImage,
      builder: (BuildContext context, AsyncSnapshot<String> image) {
        if (image.hasData || !widget.isWithButton) {
          return Center(
            child: Image.asset(
              image.data as String,
              fit: BoxFit.cover,
            ),
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
