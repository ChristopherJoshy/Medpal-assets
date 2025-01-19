import '/flutter_flow/flutter_flow_util.dart';
import 'global_chat_widget.dart' show GlobalChatWidget;
import 'package:flutter/material.dart';

class GlobalChatModel extends FlutterFlowModel<GlobalChatWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for messagesfield widget.
  FocusNode? messagesfieldFocusNode;
  TextEditingController? messagesfieldTextController;
  String? Function(BuildContext, String?)? messagesfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messagesfieldFocusNode?.dispose();
    messagesfieldTextController?.dispose();
  }
}
