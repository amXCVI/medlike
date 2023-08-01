import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:skeletons/skeletons.dart';

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
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  bool? isLoaded = false;
  Uint8List? theImage;
  File? file;
  late PdfViewerController viewerController = PdfViewerController();
  TapDownDetails? doubleTapDetails;
  late int pageCount = 0;
  late String fileLoadError = '';

  @override
  void initState() {
    getFile();
    super.initState();
  }

  Future<void> getFile() async {
    try {
      File f =
          await context.read<DocumentsCubit>().getDocumentByUrl(widget.pdfUrl);
      setState(() {
        file = f;
        isLoaded = true;
      });
    } catch (err) {
      setState(() {
        fileLoadError = err.toString();
        isLoaded = false;
      });
    }
  }

  void getPageCount() {
    int count = 0;
    try {
      count = viewerController.pageCount;
    } catch (err) {
      count = 1;
    }
    setState(() {
      pageCount = count;
    });
  }

  void handleTapOnDocument(String filePath) async {
    context.router.push(FullScreenPdfViewerRoute(
      filePath: filePath,
      fileName: widget.fileName,
    ));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (pageCount < 1) {
        Future.delayed(const Duration(seconds: 1), () {
          getPageCount();
        });
      }
    });

    return isLoaded == true
        ? Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: pageCount * 500,
                child: GestureDetector(
                  onDoubleTap: () => viewerController.ready?.setZoomRatio(
                    zoomRatio: viewerController.zoomRatio * 1.5,
                    center: doubleTapDetails!.localPosition,
                  ),
                  onTap: () => handleTapOnDocument(file!.path),
                  // child: PdfDocumentLoader.openFile(
                  //   file!.path,
                  //   documentBuilder: (context, pdfDocument, pageCount) =>
                  //       LayoutBuilder(
                  //           builder: (context, constraints) =>
                  //               ListView.builder(
                  //                   itemCount: pageCount,
                  //                   itemBuilder: (context, index) => Container(
                  //                       // margin: EdgeInsets.all(margin),
                  //                       // padding: EdgeInsets.all(padding),
                  //                       color: Colors.black12,
                  //                       child: PdfPageView(
                  //                         pdfDocument: pdfDocument,
                  //                         pageNumber: index + 1,
                  //                       )))),
                  // )
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
              ),
              // Text(pageCount.toString()),
              // Text('data')
            ],
          )
        : fileLoadError.isNotEmpty
            ? Text('Не удалось загрузить содержимое файла. \n$fileLoadError')
            : SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    padding: const EdgeInsets.all(0),
                    lines: 50,
                    spacing: 4,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    )),
              );
  }
}
