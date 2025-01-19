import '/flutter_flow/flutter_flow_util.dart';
import 'profilesettings_widget.dart' show ProfilesettingsWidget;
import 'package:flutter/material.dart';

class ProfilesettingsModel extends FlutterFlowModel<ProfilesettingsWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Newdisplayname widget.
  FocusNode? newdisplaynameFocusNode;
  TextEditingController? newdisplaynameTextController;
  String? Function(BuildContext, String?)?
      newdisplaynameTextControllerValidator;
  // State field(s) for newbio widget.
  FocusNode? newbioFocusNode;
  TextEditingController? newbioTextController;
  String? Function(BuildContext, String?)? newbioTextControllerValidator;
  // State field(s) for profileviz widget.
  bool? profilevizValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newdisplaynameFocusNode?.dispose();
    newdisplaynameTextController?.dispose();

    newbioFocusNode?.dispose();
    newbioTextController?.dispose();
  }
}
