import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/documents/documents_cubit.dart';
import 'package:medlike/themes/colors.dart';
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
    final List<Widget> widgets = <Widget>[];
    const Divider pageSeparator = Divider(
      color: AppColors.lightText,
    );

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
    await for (PdfRaster img in Printing.raster(pfdData, dpi: 150)) {
      Image finImage = Image.memory(
        await img.toPng(),
        isAntiAlias: true,
        filterQuality: FilterQuality.high,
      );

      widgets.add(
        GestureDetector(
          onTap: () => showDialog(
            barrierColor: AppColors.mainAppBackground,
            context: context,
            barrierDismissible: true,
            builder: (context) => Stack(
              alignment: AlignmentDirectional.center,
              children: [
                InteractiveViewer(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: finImage,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: AlignmentDirectional.topEnd,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SvgPicture.asset(
                        "assets/icons/app_bar/close_page_icon.svg"),
                  ),
                ),
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightText,
                  spreadRadius: 0.1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: finImage,
          ),
        ),
      );
      widgets.add(pageSeparator);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [...widgets],
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
