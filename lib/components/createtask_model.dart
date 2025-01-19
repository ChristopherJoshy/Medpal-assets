import '/flutter_flow/flutter_flow_util.dart';
import 'createtask_widget.dart' show CreatetaskWidget;
import 'package:flutter/material.dart';

class CreatetaskModel extends FlutterFlowModel<CreatetaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tasktitle widget.
  FocusNode? tasktitleFocusNode;
  TextEditingController? tasktitleTextController;
  String? Function(BuildContext, String?)? tasktitleTextControllerValidator;
  // State field(s) for taskdiscrip widget.
  FocusNode? taskdiscripFocusNode;
  TextEditingController? taskdiscripTextController;
  String? Function(BuildContext, String?)? taskdiscripTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tasktitleFocusNode?.dispose();
    tasktitleTextController?.dispose();

    taskdiscripFocusNode?.dispose();
    taskdiscripTextController?.dispose();
  }
}
