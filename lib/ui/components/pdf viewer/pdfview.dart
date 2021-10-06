// import 'package:flutter/material.dart';

// class PdfView extends StatelessWidget {
//   const PdfView({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

// import 'dart:io';
// import 'dart:math' as math;
// import 'dart:ui' as ui;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:native_pdf_renderer/native_pdf_renderer.dart';
// import 'package:path_provider/path_provider.dart';

// class PDFPage extends StatefulWidget {
//   @override
//   _PDFPageState createState() => _PDFPageState();
// }

// class _PDFPageState extends State<PDFPage> {
//   PdfPageImage image;
//   List<PdfPageImage> images = [];
//   @override
//   void initState() {
//     super.initState();
//     native();
//   }

//   final controller = GlobalKey<PageTurnState>();
//   Future<File> createFileOfPdfUrl() async {
//     final url =
//         "http://web.eecs.utk.edu/~leparker/Courses/CS581-spring14/Lectures/12-Feb-25-MST.pdf";
//     final filename = url.substring(url.lastIndexOf("/") + 1);
//     var request = await HttpClient().getUrl(Uri.parse(url));
//     var response = await request.close();
//     var bytes = await consolidateHttpClientResponseBytes(response);
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     File file = File('$dir/$filename');
//     await file.writeAsBytes(bytes);

//     return file;
//   }

//   int currentPage = 1;
//   void native() async {
//     var file = (await createFileOfPdfUrl());
//     var filePath = file.path;
//     final document = await PdfDocument.openFile(filePath);
//     print(document.pagesCount);
//     for (int i = 1; i <= document.pagesCount; i++) {
//       var page = await document.getPage(i);
//       print(i);
//       final image = await page.render(width: page.height, height: page.width);
//       images.add(image);
//       await page.close();
//       page = null;
//     }
//     print(images.length);
//     file.delete();
//     setState(() {});
//   }

//   List<Widget> displays() {
//     //
//     List<Widget> widgets = [];
//     for (int i = 0; i <= 5; i++) {
//       widgets.addAll([
//         //
//         Image(
//           image: MemoryImage(images[currentPage - 1].bytes),
//           width: images[currentPage - 1].width.toDouble(),
//           height: images[currentPage - 1].height.toDouble(),
//           // fit: BoxFit.fitWidth,
//         ),
//         Image(
//           image: MemoryImage(images[currentPage].bytes),
//           width: images[currentPage].width.toDouble(),
//           height: images[currentPage].height.toDouble(),
//           // fit: BoxFit.fitWidth,
//         ),
//         Image(
//           image: MemoryImage(images[currentPage + 1].bytes),
//           width: images[currentPage + 1].width.toDouble(),
//           height: images[currentPage + 1].height.toDouble(),
//           // fit: BoxFit.fitWidth,
//         )
//       ]);
//     }

//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Pdf Title",
//         ),
//         centerTitle: true,
//       ),
//       body: images.length == 0
//           ? Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 15.0),
//                   Text("Loading pdf file for you"),
//                 ],
//               ),
//             )
//           : Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: PageTurn(
//                   key: controller,
//                   initialIndex: 1,
//                   onPageChanged: (i) {
//                     currentPage = i;
//                     displays();
//                     // setState(() {});
//                     print(currentPage);
//                   },
//                   backgroundColor: Colors.white,
//                   showDragCutoff: false,
//                   duration: Duration(microseconds: 50),
//                   children:
//                       //
//                       //     [
//                       //   for (int i = 0; i < images.length; i++) ...{
//                       //     Image(
//                       //       image: MemoryImage(images[i].bytes),
//                       //       width: images[i].width.toDouble(),
//                       //       height: images[i].height.toDouble(),
//                       //       // fit: BoxFit.fitWidth,
//                       //     ),
//                       //   }
//                       // ],
//                       displays()),
//             ),
//     );
//   }
// }

// class PageTurn extends StatefulWidget {
//   const PageTurn({
//     Key key,
//     this.duration = const Duration(milliseconds: 450),
//     this.cutoff = 0.6,
//     this.backgroundColor = const Color(0xFFFFFFCC),
//     @required this.children,
//     this.initialIndex = 0,
//     this.lastPage,
//     this.showDragCutoff = false,
//     this.onPageChanged,
//   }) : super(key: key);

//   final Color backgroundColor;
//   final List<Widget> children;
//   final Duration duration;
//   final int initialIndex;
//   final Widget lastPage;
//   final bool showDragCutoff;
//   final double cutoff;
//   final ValueChanged<int> onPageChanged;
//   @override
//   PageTurnState createState() => PageTurnState();
// }

// class PageTurnState extends State<PageTurn> with TickerProviderStateMixin {
//   int pageNumber = 0;
//   List<Widget> pages = [];

//   List<AnimationController> _controllers = [];
//   bool _isForward;

//   @override
//   void didUpdateWidget(PageTurn oldWidget) {
//     if (oldWidget.children != widget.children) {
//       _setUp();
//     }
//     if (oldWidget.duration != widget.duration) {
//       _setUp();
//     }
//     if (oldWidget.backgroundColor != widget.backgroundColor) {
//       _setUp();
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _controllers.forEach((c) => c.dispose());
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _setUp();
//   }

//   void _setUp() {
//     _controllers.clear();
//     pages.clear();
//     for (var i = 0; i < widget.children.length; i++) {
//       final _controller = AnimationController(
//         value: 1,
//         duration: widget.duration,
//         vsync: this,
//       );
//       _controllers.add(_controller);
//       final _child = Container(
//         child: PageTurnWidget(
//           backgroundColor: widget.backgroundColor,
//           amount: _controller,
//           child: widget.children[i],
//         ),
//       );
//       pages.add(_child);
//     }
//     pages = pages.reversed.toList();
//     pageNumber = widget.initialIndex;
//   }

//   bool get _isLastPage => pages != null && (pages.length - 1) == pageNumber;

//   bool get _isFirstPage => pageNumber == 0;

//   void _turnPage(DragUpdateDetails details, BoxConstraints dimens) {
//     final _ratio = details.delta.dx / dimens.maxWidth;
//     if (_isForward == null) {
//       if (details.delta.dx > 0) {
//         _isForward = false;
//       } else {
//         _isForward = true;
//       }
//     }
//     if (_isForward || pageNumber == 0) {
//       _controllers[pageNumber].value += _ratio;
//     } else {
//       _controllers[pageNumber - 1].value += _ratio;
//     }
//   }

//   Future _onDragFinish() async {
//     if (_isForward != null) {
//       if (_isForward) {
//         if (!_isLastPage &&
//             _controllers[pageNumber].value <= (widget.cutoff + 0.15)) {
//           await nextPage();
//         } else {
//           await _controllers[pageNumber].forward();
//         }
//       } else {
//         print(
//             'Val:${_controllers[pageNumber - 1].value} -> ${widget.cutoff + 0.28}');
//         if (!_isFirstPage &&
//             _controllers[pageNumber - 1].value >= widget.cutoff) {
//           await previousPage();
//         } else {
//           if (_isFirstPage) {
//             await _controllers[pageNumber].forward();
//           } else {
//             await _controllers[pageNumber - 1].reverse();
//           }
//         }
//       }
//     }
//     _isForward = null;
//   }

//   Future nextPage() async {
//     print('Next Page..');
//     await _controllers[pageNumber].reverse();
//     if (mounted)
//       setState(() {
//         pageNumber++;
//       });
//     widget.onPageChanged(pageNumber);
//   }

//   Future previousPage() async {
//     print('Previous Page..');
//     await _controllers[pageNumber - 1].forward();
//     if (mounted)
//       setState(() {
//         pageNumber--;
//       });
//     widget.onPageChanged(pageNumber);
//   }

//   Future goToPage(int index) async {
//     print('Navigate Page ${index + 1}..');
//     if (mounted)
//       setState(() {
//         pageNumber = index;
//       });
//     for (var i = 0; i < _controllers.length; i++) {
//       if (i == index) {
//         _controllers[i].forward();
//       } else if (i < index) {
//         // _controllers[i].value = 0;
//         _controllers[i].reverse();
//       } else {
//         if (_controllers[i].status == AnimationStatus.reverse)
//           _controllers[i].value = 1;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: LayoutBuilder(
//         builder: (context, dimens) => GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onHorizontalDragCancel: () => _isForward = null,
//           onHorizontalDragUpdate: (details) => _turnPage(details, dimens),
//           onHorizontalDragEnd: (details) => _onDragFinish(),
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               if (widget?.lastPage != null) ...[
//                 widget.lastPage,
//               ],
//               if (pages != null)
//                 ...pages
//               else ...[
//                 Container(child: CircularProgressIndicator()),
//               ],
//               Positioned.fill(
//                 child: Flex(
//                   direction: Axis.horizontal,
//                   children: <Widget>[
//                     Flexible(
//                       flex: (widget.cutoff * 10).round(),
//                       child: Container(
//                         color: widget.showDragCutoff
//                             ? Colors.blue.withAlpha(100)
//                             : null,
//                         child: GestureDetector(
//                           behavior: HitTestBehavior.opaque,
//                           onTap: _isFirstPage ? null : previousPage,
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       flex: 10 - (widget.cutoff * 10).round(),
//                       child: Container(
//                         color: widget.showDragCutoff
//                             ? Colors.red.withAlpha(100)
//                             : null,
//                         child: GestureDetector(
//                           behavior: HitTestBehavior.opaque,
//                           onTap: _isLastPage ? null : nextPage,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class PageTurnEffect extends CustomPainter {
// //   PageTurnEffect({
// //     @required this.amount,
// //     @required this.image,
// //     this.backgroundColor,
// //     this.radius = 0.18,
// //   })  : assert(amount != null && image != null && radius != null),
// //         super(repaint: amount);

// //   final Animation<double> amount;
// //   final ui.Image image;
// //   final Color backgroundColor;
// //   final double radius;

// //   @override
// //   void paint(ui.Canvas canvas, ui.Size size) {
// //     final pos = amount.value;
// //     final movX = (1.0 - pos) * 0.85;
// //     final calcR = (movX < 0.20) ? radius * movX * 5 : radius;
// //     final wHRatio = 1 - calcR;
// //     final hWRatio = image.height / image.width;
// //     final hWCorrection = (hWRatio - 1.0) / 2.0;

// //     final w = size.width.toDouble();
// //     final h = size.height.toDouble();
// //     final c = canvas;
// //     final shadowXf = (wHRatio - movX);
// //     final shadowSigma =
// //         Shadow.convertRadiusToSigma(8.0 + (32.0 * (1.0 - shadowXf)));
// //     final pageRect = Rect.fromLTRB(0.0, 0.0, w * shadowXf, h);
// //     if (backgroundColor != null) {
// //       c.drawRect(pageRect, Paint()..color = backgroundColor);
// //     }
// //     if (pos != 0) {
// //       c.drawRect(
// //         pageRect,
// //         Paint()
// //           ..color = Colors.black54
// //           ..maskFilter = MaskFilter.blur(BlurStyle.outer, shadowSigma),
// //       );
// //     }

// //     final ip = Paint();
// //     for (double x = 0; x < size.width; x++) {
// //       final xf = (x / w);
// //       final v = (calcR * (math.sin(math.pi / 0.5 * (xf - (1.0 - pos)))) +
// //           (calcR * 1.1));
// //       final xv = (xf * wHRatio) - movX;
// //       final sx = (xf * image.width);
// //       final sr = Rect.fromLTRB(sx, 0.0, sx + 1.0, image.height.toDouble());
// //       final yv = ((h * calcR * movX) * hWRatio) - hWCorrection;
// //       final ds = (yv * v);
// //       final dr = Rect.fromLTRB(xv * w, 0.0 - ds, xv * w + 1.0, h + ds);
// //       c.drawImageRect(image, sr, dr, ip);
// //     }
// //   }

// //   @override
// //   bool shouldRepaint(PageTurnEffect oldDelegate) {
// //     return oldDelegate.image != image ||
// //         oldDelegate.amount.value != amount.value;
// //   }
// // }

// // class PageTurnWidget extends StatefulWidget {
// //   const PageTurnWidget({
// //     Key key,
// //     this.amount,
// //     this.backgroundColor = const Color(0xFFFFFFCC),
// //     this.child,
// //   }) : super(key: key);

// //   final Animation<double> amount;
// //   final Color backgroundColor;
// //   final Widget child;

// //   @override
// //   _PageTurnWidgetState createState() => _PageTurnWidgetState();
// // }

// // class _PageTurnWidgetState extends State<PageTurnWidget> {
// //   final _boundaryKey = GlobalKey();
// //   ui.Image _image;

// //   @override
// //   void didUpdateWidget(PageTurnWidget oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (oldWidget.child != widget.child) {
// //       _image = null;
// //     }
// //   }

// //   void _captureImage(Duration timeStamp) async {
// //     final pixelRatio = MediaQuery.of(context).devicePixelRatio;
// //     final boundary =
// //         _boundaryKey.currentContext.findRenderObject() as RenderRepaintBoundary;
// //     if (boundary.debugNeedsPaint) {
// //       await Future.delayed(const Duration(milliseconds: 20));
// //       return _captureImage(timeStamp);
// //     }
// //     final image = await boundary.toImage(pixelRatio: pixelRatio);
// //     setState(() => _image = image);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (_image != null) {
// //       return CustomPaint(
// //         painter: PageTurnEffect(
// //           amount: widget.amount,
// //           image: _image,
// //           backgroundColor: widget.backgroundColor,
// //         ),
// //         size: Size.infinite,
// //       );
// //     } else {
// //       WidgetsBinding.instance.addPostFrameCallback(_captureImage);
// //       return LayoutBuilder(
// //         builder: (BuildContext context, BoxConstraints constraints) {
// //           final size = constraints.biggest;
// //           return Stack(
// //             overflow: Overflow.clip,
// //             children: <Widget>[
// //               Positioned(
// //                 left: 1 + size.width,
// //                 top: 1 + size.height,
// //                 width: size.width,
// //                 height: size.height,
// //                 child: RepaintBoundary(
// //                   key: _boundaryKey,
// //                   child: widget.child,
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     }
// //   }
// // }

// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/pdf%20viewer/pdfviewModel.dart';

import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class PdfView extends StatelessWidget {
  final url;
  const PdfView({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PdfViewModel>.reactive(
        onModelReady: (PdfViewModel model) {
          // model.loadDocument(url);
        },
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: const Text(''),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    model.pdfViewerKey.currentState?.openBookmarkView();
                  },
                ),
              ],
            ),
            body: SfPdfViewer.network(
              '$url',
              key: model.pdfViewerKey,
            ),
          ));
        },
        viewModelBuilder: () => PdfViewModel());
  }
}
