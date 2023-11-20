import 'package:flutter/material.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfAssetPath;

  PdfViewerPage({required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: 'Panduan MyUnhas',
      ),
      body: SfPdfViewer.asset(
        pdfAssetPath,
        canShowPageLoadingIndicator: false,
      ),
    );
  }
}
