import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:printing/printing.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget(
      {Key? key,
      required this.pdfUrl,
      required this.fileId,
      required this.fileName})
      : super(key: key);

  final String pdfUrl;
  final String fileId;
  final String fileName;

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  Future<Widget> openPDF(BuildContext context) async {
    List<Image> imgs = <Image>[];

    File file =
        await context.read<DocumentsCubit>().getDocumentByUrl(widget.pdfUrl);
    Uint8List pfdData = await file.readAsBytes();
    await for (PdfRaster img in Printing.raster(pfdData)) {
      imgs.add(Image.memory(await img.toPng()));
    }
    return GestureDetector(
      onTap: () {
        context.router.push(PdfFileViewerRoute(
            pdfUrl: widget.pdfUrl,
            fileId: widget.fileId,
            fileName: widget.fileName));
      },
      child: Column(
        children: [...imgs],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: openPDF(context),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SingleChildScrollView(
              child: snapshot.data ?? const SizedBox());
        }
        return const SizedBox();
      },
    );
  }
}
