import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

@RoutePage()
class FullScreenPdfViewerPage extends StatefulWidget {
  const FullScreenPdfViewerPage(
      {Key? key, required this.filePath, required this.fileName})
      : super(key: key);

  final String filePath;
  final String fileName;

  @override
  State<FullScreenPdfViewerPage> createState() =>
      _FullScreenPdfViewerPageState();
}

class _FullScreenPdfViewerPageState extends State<FullScreenPdfViewerPage> {
  final controller = PdfViewerController();
  TapDownDetails? doubleTapDetails;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: widget.fileName,
      child: GestureDetector(
        onDoubleTapDown: (details) => doubleTapDetails = details,
        onDoubleTap: () => controller.ready?.setZoomRatio(
          zoomRatio: controller.zoomRatio * 1.5,
          center: doubleTapDetails!.localPosition,
        ),
        child: PdfViewer.openFile(
          widget.filePath,
          params: PdfViewerParams(),
        ),
      ),
    );
  }
}
