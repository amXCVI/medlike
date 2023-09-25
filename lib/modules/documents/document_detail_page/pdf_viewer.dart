import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:printing/printing.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget(
      {Key? key,
      required this.pdfUrl,
      required this.fileId,
      required this.fileName})
      : super(key: key);

  final String pdfUrl;
  final String fileId;
  final String fileName;

  Future<Widget> openPDF(BuildContext context) async {
    List<Image> imgs = <Image>[];

    // Retrieving style here so we won get 'context in async gap warning'
    final TextStyle? errTextStyle = Theme.of(context).textTheme.titleMedium;

    File? file;
    try {
      file = await context.read<DocumentsCubit>().getDocumentByUrl(pdfUrl);
    } catch (e) {
      return Padding(
        padding: const EdgeInsets.all(50),
        child: Text("Что-то пошло не так", style: errTextStyle),
      );
    }

    Uint8List pfdData = await file.readAsBytes();
    await for (PdfRaster img in Printing.raster(pfdData)) {
      imgs.add(Image.memory(await img.toPng()));
    }
    return GestureDetector(
      onTap: () {
        context.router.push(PdfFileViewerRoute(
            pdfUrl: pdfUrl, fileId: fileId, fileName: fileName));
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
        return const Padding(
          padding: EdgeInsets.all(100),
          child: Center(
            child: CircularLoader(
              radius: 50,
            ),
          ),
        );
      },
    );
  }
}
