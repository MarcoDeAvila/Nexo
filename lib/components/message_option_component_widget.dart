import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'message_option_component_model.dart';
export 'message_option_component_model.dart';

class MessageOptionComponentWidget extends StatefulWidget {
  const MessageOptionComponentWidget({
    super.key,
    required this.activeOption,
  });

  final PageMenuOption? activeOption;

  @override
  State<MessageOptionComponentWidget> createState() =>
      _MessageOptionComponentWidgetState();
}

class _MessageOptionComponentWidgetState
    extends State<MessageOptionComponentWidget> {
  late MessageOptionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageOptionComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.activeOption == PageMenuOption.Mensajes)
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Mensajes',
            icon: Icon(
              Icons.message_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 20.0,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0x277B7B7B),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).secondary,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        if (widget.activeOption != PageMenuOption.Mensajes)
          FlutterFlowIconButton(
            borderRadius: 180.0,
            borderWidth: 0.0,
            buttonSize: 40.0,
            fillColor: Color(0x277B7B7B),
            icon: Icon(
              Icons.message_rounded,
              color: FlutterFlowTheme.of(context).alternate,
              size: 20.0,
            ),
            onPressed: () async {
              FFAppState().MenuOption = PageMenuOption.Mensajes;
              _model.updatePage(() {});
            },
          ),
      ],
    );
  }
}
