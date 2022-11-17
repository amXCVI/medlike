import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:medlike/data/repository/images_repository.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';

class WebFutureImage extends StatefulWidget {
  const WebFutureImage({Key? key, required this.imageUrl, this.radius})
      : super(key: key);

  final String imageUrl;
  final double? radius;

  @override
  State<WebFutureImage> createState() => _WebFutureImageState();
}

class _WebFutureImageState extends State<WebFutureImage> {
  late final Future<Uint8List> imageFuture;

  @override
  void initState() {
    super.initState();
    imageFuture = _getData();
  }

  Future<Uint8List> _getData() {
    return ImagesRepository.downloadImageFile(url: widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageFuture,
      builder: (BuildContext context, AsyncSnapshot<Uint8List> bytesBuffer) {
        if (bytesBuffer.hasData) {
          return Center(
            child: Image.memory(
              bytesBuffer.data!,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Center(child: CircularLoader(radius: widget.radius ?? 20));
        }
      },
    );
  }
}
