import '/flutter_flow/flutter_flow_util.dart';
import 'form_login_widget.dart' show FormLoginWidget;
import 'package:flutter/material.dart';

class FormLoginModel extends FlutterFlowModel<FormLoginWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for CorreoTextField widget.
  FocusNode? correoTextFieldFocusNode;
  TextEditingController? correoTextFieldTextController;
  String? Function(BuildContext, String?)?
      correoTextFieldTextControllerValidator;
  String? _correoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresa un correo valido.';
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextFieldTextControllerValidator =
        _correoTextFieldTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    correoTextFieldFocusNode?.dispose();
    correoTextFieldTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();
  }
}
