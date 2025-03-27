import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'form_register_widget.dart' show FormRegisterWidget;
import 'package:flutter/material.dart';

class FormRegisterModel extends FlutterFlowModel<FormRegisterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingresa un correo valido.';
    }
    return null;
  }

  // State field(s) for Pass1 widget.
  FocusNode? pass1FocusNode;
  TextEditingController? pass1TextController;
  late bool pass1Visibility;
  String? Function(BuildContext, String?)? pass1TextControllerValidator;
  String? _pass1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Pass2 widget.
  FocusNode? pass2FocusNode;
  TextEditingController? pass2TextController;
  late bool pass2Visibility;
  String? Function(BuildContext, String?)? pass2TextControllerValidator;
  String? _pass2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Apellido widget.
  FocusNode? apellidoFocusNode;
  TextEditingController? apellidoTextController;
  String? Function(BuildContext, String?)? apellidoTextControllerValidator;
  String? _apellidoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obligatorio.';
    }

    return null;
  }

  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for Localidad widget.
  String? localidadValue;
  FormFieldController<String>? localidadValueController;
  // State field(s) for RolChips widget.
  FormFieldController<List<String>>? rolChipsValueController;
  String? get rolChipsValue => rolChipsValueController?.value?.firstOrNull;
  set rolChipsValue(String? val) =>
      rolChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PortafolioRecord? portafolio;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AgendaRecord? agenda;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? comentarios;
  // State field(s) for Servicio widget.
  String? servicioValue;
  FormFieldController<String>? servicioValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
    pass1Visibility = false;
    pass1TextControllerValidator = _pass1TextControllerValidator;
    pass2Visibility = false;
    pass2TextControllerValidator = _pass2TextControllerValidator;
    nombreTextControllerValidator = _nombreTextControllerValidator;
    apellidoTextControllerValidator = _apellidoTextControllerValidator;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    pass1FocusNode?.dispose();
    pass1TextController?.dispose();

    pass2FocusNode?.dispose();
    pass2TextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();
  }
}
