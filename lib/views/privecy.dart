import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/ui/route/route.dart';
import 'package:tour_application/widgets/violet_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Privacy extends StatelessWidget {
  PdfViewerController? _pdfviewerControll;
  RxBool _loaded = false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w, bottom: 30.h),
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  'https://firebasestorage.googleapis.com/v0/b/shelter-c28ba.appspot.com/o/Privacy%2FCV%20for%20job.pdf?alt=media&token=885dcb93-1dc0-43b2-9fc1-1c0d88cbb9c1',
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    _loaded.value = true;
                  },
                ),
              ),
              Divider(),
             Obx(() => _loaded==true?
             VioletButton(
               'Agree',
                 ()=> Get.toNamed(main_home_screen),
             ):
                 Text('Still Loading'),
             ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
