import 'dart:io';

import 'package:brilliant_app/Post/domain/entity/post_entity.dart';
import 'package:brilliant_app/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfReader extends StatefulWidget {
  final PostEntity post;
  const pdfReader({Key? key, required this.post}) : super(key: key);

  @override
  State<pdfReader> createState() => _pdfReaderState();
}

class _pdfReaderState extends State<pdfReader> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        body: SfPdfViewer.network('${widget.post.postImageUrl}',
            scrollDirection: PdfScrollDirection.vertical,
            controller: _pdfViewerController,
            key: _pdfViewerStateKey),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _pdfViewerController.zoomLevel = 1.25;
                },
                icon: const Icon(
                  Icons.zoom_in,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
