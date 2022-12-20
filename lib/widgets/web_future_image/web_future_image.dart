import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:medlike/data/models/smartapp_models/smartapp_models.dart';
import 'package:medlike/data/repository/images_repository.dart';

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
  late final Future<SmartappGetFileResponseModel> botXImage;

  @override
  void initState() {
    super.initState();
    // imageFuture = _getData();
    botXImage = _getData();
  }

  // Future<Uint8List> _getData() {
  //   return ImagesRepository.downloadImageFile(url: widget.imageUrl);
  // }

  Future<SmartappGetFileResponseModel> _getData() {
    return ImagesRepository.downloadImageFile(url: widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: botXImage,
      builder: (BuildContext context,
          AsyncSnapshot<SmartappGetFileResponseModel> image) {
        if (image.hasData || !widget.isWithButton) {
          return Center(
            child: Image.network(
              image.data!.fileUrl as String,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Center(
              child: MaterialButton(
            onPressed: _getData,
            child: const Text('GET IMAGE'),
          ));
        }
      },
    );
  }
}
