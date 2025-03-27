import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_page_widget.dart' show MessagePageWidget;
import 'package:flutter/material.dart';

class MessagePageModel extends FlutterFlowModel<MessagePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - Read Document] action in ConversacionDesktop widget.
  UsersRecord? contacto;
  // Stores action output result for [Backend Call - Read Document] action in ConversacionDesktop widget.
  ConversacionRecord? selectedChat;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListViewMs widget.
  ScrollController? listViewMs;
  List<MensajesRecord>? listViewMsPreviousSnapshot;
  // State field(s) for TextFieldMessage widget.
  FocusNode? textFieldMessageFocusNode;
  TextEditingController? textFieldMessageTextController;
  String? Function(BuildContext, String?)?
      textFieldMessageTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MensajesRecord? newMessage;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MensajesRecord? newImageMessage;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    listViewController = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    listViewMs = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    listViewController?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    listViewMs?.dispose();
    textFieldMessageFocusNode?.dispose();
    textFieldMessageTextController?.dispose();
  }
}
