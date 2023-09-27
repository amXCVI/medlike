import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/documents/document_detail_page/pdf_viewer.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class PdfFileViewerPage extends StatelessWidget {
  const PdfFileViewerPage({
    Key? key,
    required this.pdfUrl,
    required this.fileId,
    required this.fileName,
  }) : super(key: key);

  final String pdfUrl;
  final String fileId;
  final String fileName;

  @override
  Widget build(BuildContext context) => DefaultScaffold(
        appBarTitle: fileName,
        child:
            PdfViewerWidget(pdfUrl: pdfUrl, fileId: fileId, fileName: fileName),
      );
  //State<PdfFileViewerPage> createState() => _PdfFileViewerPageState();
}

// class _PdfFileViewerPageState extends State<PdfFileViewerPage> {
//   bool? isLoaded = false;
//   File? file;
//   late String fileLoadError = '';

//   @override
//   void initState() {
//     getFile();
//     super.initState();
//   }

//   Future<void> getFile() async {
//     try {
//       File f =
//           await context.read<DocumentsCubit>().getDocumentByUrl(widget.pdfUrl);
//       setState(() {
//         file = f;
//         isLoaded = true;
//       });
//     } catch (err) {
//       setState(() {
//         fileLoadError = err.toString();
//         isLoaded = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultScaffold(
//       appBarTitle: widget.fileName,
//       child: isLoaded == true
//           ? Column(
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height - 212,
//                   child: PdfViewer.openFile(
//                     file!.path,
//                   ),
//                 ),
//               ],
//             )
//           : fileLoadError.isNotEmpty
//               ? Text('Не удалось загрузить содержимое файла. \n$fileLoadError')
//               : SingleChildScrollView(
//                   child: SkeletonParagraph(
//                     style: SkeletonParagraphStyle(
//                         padding: const EdgeInsets.all(0),
//                         lines: 50,
//                         spacing: 4,
//                         lineStyle: SkeletonLineStyle(
//                           randomLength: true,
//                           height: 10,
//                           borderRadius: BorderRadius.circular(8),
//                         )),
//                   ),
//                 ),
//     );
//   }
// }
