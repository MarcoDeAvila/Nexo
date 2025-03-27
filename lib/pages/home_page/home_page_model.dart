import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? currentUser;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for CorreoLogMovil widget.
  FocusNode? correoLogMovilFocusNode;
  TextEditingController? correoLogMovilTextController;
  String? Function(BuildContext, String?)?
      correoLogMovilTextControllerValidator;
  String? _correoLogMovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for PassLogMovil widget.
  FocusNode? passLogMovilFocusNode;
  TextEditingController? passLogMovilTextController;
  late bool passLogMovilVisibility;
  String? Function(BuildContext, String?)? passLogMovilTextControllerValidator;
  String? _passLogMovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for NombreMovil widget.
  FocusNode? nombreMovilFocusNode;
  TextEditingController? nombreMovilTextController;
  String? Function(BuildContext, String?)? nombreMovilTextControllerValidator;
  String? _nombreMovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ApellidoMovil widget.
  FocusNode? apellidoMovilFocusNode;
  TextEditingController? apellidoMovilTextController;
  String? Function(BuildContext, String?)? apellidoMovilTextControllerValidator;
  String? _apellidoMovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CorreoMovil widget.
  FocusNode? correoMovilFocusNode;
  TextEditingController? correoMovilTextController;
  String? Function(BuildContext, String?)? correoMovilTextControllerValidator;
  String? _correoMovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Pass1Movil widget.
  FocusNode? pass1MovilFocusNode;
  TextEditingController? pass1MovilTextController;
  late bool pass1MovilVisibility;
  String? Function(BuildContext, String?)? pass1MovilTextControllerValidator;
  String? _pass1MovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Pass2Movil widget.
  FocusNode? pass2MovilFocusNode;
  TextEditingController? pass2MovilTextController;
  late bool pass2MovilVisibility;
  String? Function(BuildContext, String?)? pass2MovilTextControllerValidator;
  String? _pass2MovilTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TelefonoMovil widget.
  FocusNode? telefonoMovilFocusNode;
  TextEditingController? telefonoMovilTextController;
  String? Function(BuildContext, String?)? telefonoMovilTextControllerValidator;
  // State field(s) for LocacionMovil widget.
  String? locacionMovilValue;
  FormFieldController<String>? locacionMovilValueController;
  // State field(s) for RolMovil widget.
  FormFieldController<List<String>>? rolMovilValueController;
  String? get rolMovilValue => rolMovilValueController?.value?.firstOrNull;
  set rolMovilValue(String? val) =>
      rolMovilValueController?.value = val != null ? [val] : [];
  // State field(s) for ServiDropDown widget.
  String? serviDropDownValue;
  FormFieldController<String>? serviDropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Query cache managers for this widget.

  final _profesionalesManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> profesionales({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _profesionalesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfesionalesCache() => _profesionalesManager.clear();
  void clearProfesionalesCacheKey(String? uniqueKey) =>
      _profesionalesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    correoLogMovilTextControllerValidator =
        _correoLogMovilTextControllerValidator;
    passLogMovilVisibility = false;
    passLogMovilTextControllerValidator = _passLogMovilTextControllerValidator;
    nombreMovilTextControllerValidator = _nombreMovilTextControllerValidator;
    apellidoMovilTextControllerValidator =
        _apellidoMovilTextControllerValidator;
    correoMovilTextControllerValidator = _correoMovilTextControllerValidator;
    pass1MovilVisibility = false;
    pass1MovilTextControllerValidator = _pass1MovilTextControllerValidator;
    pass2MovilVisibility = false;
    pass2MovilTextControllerValidator = _pass2MovilTextControllerValidator;
  }

  @override
  void dispose() {
    correoLogMovilFocusNode?.dispose();
    correoLogMovilTextController?.dispose();

    passLogMovilFocusNode?.dispose();
    passLogMovilTextController?.dispose();

    nombreMovilFocusNode?.dispose();
    nombreMovilTextController?.dispose();

    apellidoMovilFocusNode?.dispose();
    apellidoMovilTextController?.dispose();

    correoMovilFocusNode?.dispose();
    correoMovilTextController?.dispose();

    pass1MovilFocusNode?.dispose();
    pass1MovilTextController?.dispose();

    pass2MovilFocusNode?.dispose();
    pass2MovilTextController?.dispose();

    telefonoMovilFocusNode?.dispose();
    telefonoMovilTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearProfesionalesCache();
  }

  /// Action blocks.
  Future createAcount(BuildContext context) async {}
}
