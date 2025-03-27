import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'lista_vacia_component_model.dart';
export 'lista_vacia_component_model.dart';

class ListaVaciaComponentWidget extends StatefulWidget {
  const ListaVaciaComponentWidget({super.key});

  @override
  State<ListaVaciaComponentWidget> createState() =>
      _ListaVaciaComponentWidgetState();
}

class _ListaVaciaComponentWidgetState extends State<ListaVaciaComponentWidget> {
  late ListaVaciaComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaVaciaComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sin Conversaciones ',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend',
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
