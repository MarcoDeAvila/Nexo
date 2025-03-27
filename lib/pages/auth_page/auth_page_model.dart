import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for TextFieldCorreo widget.
  FocusNode? textFieldCorreoFocusNode;
  TextEditingController? textFieldCorreoTextController;
  String? Function(BuildContext, String?)?
      textFieldCorreoTextControllerValidator;
  String? _textFieldCorreoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es obligatorio.';
    }

    return null;
  }

  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  String? _textFieldPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El campo es obligatorio.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    textFieldCorreoTextControllerValidator =
        _textFieldCorreoTextControllerValidator;
    textFieldPasswordVisibility = false;
    textFieldPasswordTextControllerValidator =
        _textFieldPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldCorreoFocusNode?.dispose();
    textFieldCorreoTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();
  }
}
