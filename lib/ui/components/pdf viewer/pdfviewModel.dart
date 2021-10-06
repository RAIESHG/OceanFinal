// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewModel extends BaseViewModel {
  bool isLoading = true;
   final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  // PDFDocument? document;

  // loadDocument(String url) async {
  //   // document = await PDFDocument.fromURL(url);

  //   isLoading = false;
  //   notifyListeners();
  // }

  
}
