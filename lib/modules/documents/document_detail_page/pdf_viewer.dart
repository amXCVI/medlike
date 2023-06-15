import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({Key? key, required this.pdfUrl, required this.fileId})
      : super(key: key);

  final String pdfUrl;
  final String fileId;

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  bool? isLoaded = false;
  Uint8List? theImage;
  File? file;
  late PdfViewerController viewerController = PdfViewerController();

  @override
  void initState() {
    getFile();
    super.initState();
  }

  Future<void> getFile() async {
    file = await context.read<DocumentsCubit>().getDocumentByUrl(widget.pdfUrl);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded == true
        ? Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: viewerController != null
                    ? viewerController.pageCount * 500
                    : 500,
                child: PdfViewer.openFile(
                  file!.path,
                  viewerController: viewerController,
                  params: PdfViewerParams(
                      pageDecoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.background,
                        blurRadius: 0,
                        offset: const Offset(0, 0))
                  ])),
                ),
              ),
            ],
          )
        : const Center(
            child: CircularLoader(
              radius: 50,
            ),
          );
  }
}
