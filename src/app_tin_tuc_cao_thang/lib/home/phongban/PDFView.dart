import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFView extends StatefulWidget {
  const PDFView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  final controller = PdfViewerController();
  TapDownDetails? _doubleTapDetails;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: ValueListenableBuilder<Matrix4>(
              valueListenable: controller,
              builder: (context, _, child) => Text(controller.isReady
                  ? 'Page #${controller.currentPageNumber}'
                  : 'Page -')),
        ),
        backgroundColor: Colors.grey,
        body: GestureDetector(
            onDoubleTapDown: (details) => _doubleTapDetails = details,
            onDoubleTap: () => controller.ready?.setZoomRatio(
                  zoomRatio: controller.zoomRatio * 1.5,
                  center: _doubleTapDetails!.localPosition,
                ),
            child: PdfViewer.openFutureFile(
              () async => (await DefaultCacheManager().getSingleFile(
                  widget.url)).path,
              viewerController: controller,
              onError: (err) => print(err),
              params: const PdfViewerParams(
                padding: 10,
                minScale: 1.0,
              ),
            )),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       child: const Icon(Icons.first_page),
        //       onPressed: () => controller.ready?.goToPage(pageNumber: 1),
        //     ),
        //     FloatingActionButton(
        //       child: const Icon(Icons.last_page),
        //       onPressed: () =>
        //           controller.ready?.goToPage(pageNumber: controller.pageCount),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
