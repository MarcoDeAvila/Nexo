import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/conversacion_desktop_widget.dart';
import '/components/lista_vacia_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'message_page_model.dart';
export 'message_page_model.dart';

class MessagePageWidget extends StatefulWidget {
  const MessagePageWidget({super.key});

  static String routeName = 'MessagePage';
  static String routePath = '/messagePage';

  @override
  State<MessagePageWidget> createState() => _MessagePageWidgetState();
}

class _MessagePageWidgetState extends State<MessagePageWidget>
    with TickerProviderStateMixin {
  late MessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagePageModel());

    _model.textFieldMessageTextController ??= TextEditingController();
    _model.textFieldMessageFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.5, 0.5),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.5, 0.5),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().showConversacion = false;
                              safeSetState(() {});
                              context.safePop();
                            },
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: Color(0xFF0F0F0F),
                              size: 32.0,
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().showMenu = true;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  currentUserPhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Container(
                              width: 400.0,
                              height: 596.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: SingleChildScrollView(
                                controller: _model.columnController1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          'Conversaciones',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<ConversacionRecord>>(
                                      stream: queryConversacionRecord(
                                        queryBuilder: (conversacionRecord) =>
                                            conversacionRecord.where(Filter.or(
                                          Filter(
                                            'user_a',
                                            isEqualTo: currentUserReference,
                                          ),
                                          Filter(
                                            'user_b',
                                            isEqualTo: currentUserReference,
                                          ),
                                        )),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ConversacionRecord>
                                            containerConversacionRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final chat =
                                                    containerConversacionRecordList
                                                        .toList();
                                                if (chat.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 200.0,
                                                      child:
                                                          ListaVaciaComponentWidget(),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: chat.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 16.0),
                                                  itemBuilder:
                                                      (context, chatIndex) {
                                                    final chatItem =
                                                        chat[chatIndex];
                                                    return Visibility(
                                                      visible:
                                                          (currentUserReference !=
                                                                  chatItem
                                                                      .userB) ||
                                                              (currentUserReference !=
                                                                  chatItem
                                                                      .userA),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.contacto = await UsersRecord
                                                              .getDocumentOnce(chatItem
                                                                          .userA ==
                                                                      currentUserReference
                                                                  ? chatItem
                                                                      .userB!
                                                                  : chatItem
                                                                      .userA!);
                                                          _model.selectedChat =
                                                              await ConversacionRecord
                                                                  .getDocumentOnce(
                                                                      chatItem
                                                                          .reference);
                                                          FFAppState()
                                                                  .showConversacion =
                                                              true;
                                                          safeSetState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward();
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child:
                                                            ConversacionDesktopWidget(
                                                          key: Key(
                                                              'Keybc0_${chatIndex}_of_${chat.length}'),
                                                          conversacion:
                                                              chatItem,
                                                          contacto: chatItem
                                                                      .userA ==
                                                                  currentUserReference
                                                              ? chatItem.userB!
                                                              : chatItem.userA!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  controller:
                                                      _model.listViewController,
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          if (FFAppState().showConversacion)
                            Container(
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Container(
                                      width: 640.0,
                                      height: 596.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 0.0),
                                                child: Container(
                                                  height: 496.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(16.0),
                                                      bottomRight:
                                                          Radius.circular(16.0),
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                132.0,
                                                                0.0,
                                                                0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      primary: false,
                                                      controller: _model
                                                          .columnController2,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                controller: _model
                                                                    .columnController3,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            MensajesRecord>>(
                                                                      stream:
                                                                          queryMensajesRecord(
                                                                        parent: _model
                                                                            .selectedChat
                                                                            ?.reference,
                                                                        queryBuilder:
                                                                            (mensajesRecord) =>
                                                                                mensajesRecord.orderBy('send_time'),
                                                                      )..listen((snapshot) {
                                                                              List<MensajesRecord> listViewMsMensajesRecordList = snapshot;
                                                                              if (_model.listViewMsPreviousSnapshot != null && !const ListEquality(MensajesRecordDocumentEquality()).equals(listViewMsMensajesRecordList, _model.listViewMsPreviousSnapshot)) {
                                                                                () async {
                                                                                  await _model.listViewMs?.animateTo(
                                                                                    _model.listViewMs!.position.maxScrollExtent,
                                                                                    duration: Duration(milliseconds: 100),
                                                                                    curve: Curves.ease,
                                                                                  );

                                                                                  safeSetState(() {});
                                                                                }();
                                                                              }
                                                                              _model.listViewMsPreviousSnapshot = snapshot;
                                                                            }),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<MensajesRecord>
                                                                            listViewMsMensajesRecordList =
                                                                            snapshot.data!;

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              listViewMsMensajesRecordList.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 16.0),
                                                                          itemBuilder:
                                                                              (context, listViewMsIndex) {
                                                                            final listViewMsMensajesRecord =
                                                                                listViewMsMensajesRecordList[listViewMsIndex];
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if ((listViewMsMensajesRecord.user != currentUserReference) && (listViewMsMensajesRecord.image == ''))
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 304.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(16.0),
                                                                                            bottomRight: Radius.circular(16.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(16.0),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Wrap(
                                                                                                spacing: 0.0,
                                                                                                runSpacing: 0.0,
                                                                                                alignment: WrapAlignment.start,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.start,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewMsMensajesRecord.text,
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lexend',
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                    child: Text(
                                                                                                      dateTimeFormat("jm", listViewMsMensajesRecord.sendTime!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Lexend',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Icon(
                                                                                                    Icons.done_all_rounded,
                                                                                                    color: listViewMsMensajesRecord.messageSeen ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).alternate,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                if ((listViewMsMensajesRecord.user == currentUserReference) && (listViewMsMensajesRecord.text != ''))
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 304.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(16.0),
                                                                                            bottomRight: Radius.circular(16.0),
                                                                                            topLeft: Radius.circular(16.0),
                                                                                            topRight: Radius.circular(0.0),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Wrap(
                                                                                                spacing: 0.0,
                                                                                                runSpacing: 0.0,
                                                                                                alignment: WrapAlignment.start,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.start,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewMsMensajesRecord.text,
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lexend',
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                    child: Text(
                                                                                                      dateTimeFormat("jm", listViewMsMensajesRecord.sendTime!),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Lexend',
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Icon(
                                                                                                    Icons.done_all_rounded,
                                                                                                    color: listViewMsMensajesRecord.messageSeen ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).alternate,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 4.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                if ((_model.selectedChat?.userA == currentUserReference) && (listViewMsMensajesRecord.image != ''))
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Stack(
                                                                                        alignment: AlignmentDirectional(1.0, 1.0),
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: Image.network(
                                                                                                      listViewMsMensajesRecord.image,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: listViewMsMensajesRecord.image,
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: listViewMsMensajesRecord.image,
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(16.0),
                                                                                                  bottomRight: Radius.circular(16.0),
                                                                                                  topLeft: Radius.circular(16.0),
                                                                                                  topRight: Radius.circular(0.0),
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  listViewMsMensajesRecord.image,
                                                                                                  width: 300.0,
                                                                                                  height: 200.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("jm", listViewMsMensajesRecord.sendTime!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lexend',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Icon(
                                                                                                  Icons.done_all_rounded,
                                                                                                  color: listViewMsMensajesRecord.messageSeen ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).alternate,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                if ((_model.selectedChat?.userA != currentUserReference) && (listViewMsMensajesRecord.image != ''))
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Stack(
                                                                                        alignment: AlignmentDirectional(1.0, 1.0),
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: Image.network(
                                                                                                      listViewMsMensajesRecord.image,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: listViewMsMensajesRecord.image,
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: listViewMsMensajesRecord.image,
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(16.0),
                                                                                                  bottomRight: Radius.circular(16.0),
                                                                                                  topLeft: Radius.circular(0.0),
                                                                                                  topRight: Radius.circular(16.0),
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  listViewMsMensajesRecord.image,
                                                                                                  width: 300.0,
                                                                                                  height: 200.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                  child: Text(
                                                                                                    dateTimeFormat("jm", listViewMsMensajesRecord.sendTime!),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Lexend',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Icon(
                                                                                                  Icons.done_all_rounded,
                                                                                                  color: listViewMsMensajesRecord.messageSeen ? FlutterFlowTheme.of(context).tertiary : FlutterFlowTheme.of(context).alternate,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ].divide(SizedBox(height: 16.0)),
                                                                            );
                                                                          },
                                                                          controller:
                                                                              _model.listViewMs,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 24.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Transform.rotate(
                                                          angle: (FFAppState()
                                                                      .showMessageActions
                                                                  ? 45.0
                                                                  : 0.0) *
                                                              (math.pi / 180),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 180.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              Icons.add_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 32.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .showMessageActions =
                                                                  !(FFAppState()
                                                                          .showMessageActions ??
                                                                      true);
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textFieldMessageTextController,
                                                              focusNode: _model
                                                                  .textFieldMessageFocusNode,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Nuevo Mensaje...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Color(
                                                                    0xFFD9D9D9),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              validator: _model
                                                                  .textFieldMessageTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 180.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 48.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          icon: Icon(
                                                            Icons
                                                                .message_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 28.0,
                                                          ),
                                                          onPressed: () async {
                                                            if (_model.textFieldMessageTextController
                                                                        .text !=
                                                                    '') {
                                                              var mensajesRecordReference =
                                                                  MensajesRecord
                                                                      .createDoc(_model
                                                                          .selectedChat!
                                                                          .reference);
                                                              await mensajesRecordReference
                                                                  .set(
                                                                      createMensajesRecordData(
                                                                text: _model
                                                                    .textFieldMessageTextController
                                                                    .text,
                                                                sendTime:
                                                                    getCurrentTimestamp,
                                                                messageSeen:
                                                                    false,
                                                                user:
                                                                    currentUserReference,
                                                              ));
                                                              _model.newMessage =
                                                                  MensajesRecord
                                                                      .getDocumentFromData(
                                                                          createMensajesRecordData(
                                                                            text:
                                                                                _model.textFieldMessageTextController.text,
                                                                            sendTime:
                                                                                getCurrentTimestamp,
                                                                            messageSeen:
                                                                                false,
                                                                            user:
                                                                                currentUserReference,
                                                                          ),
                                                                          mensajesRecordReference);

                                                              await _model
                                                                  .selectedChat!
                                                                  .reference
                                                                  .update(
                                                                      createConversacionRecordData(
                                                                lastMessage: _model
                                                                    .newMessage
                                                                    ?.text,
                                                                lastMessageTime:
                                                                    _model
                                                                        .newMessage
                                                                        ?.sendTime,
                                                                lastMessageUserRef:
                                                                    _model
                                                                        .newMessage
                                                                        ?.user,
                                                                lastMessageRef: _model
                                                                    .newMessage
                                                                    ?.reference,
                                                              ));
                                                              safeSetState(() {
                                                                _model
                                                                    .textFieldMessageTextController
                                                                    ?.clear();
                                                              });
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (FFAppState().showMessageActions)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          56.0, 0.0, 0.0, 80.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 3.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                      child: Container(
                                                        width: 224.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    16.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    16.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    16.0),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          32.0,
                                                                    ),
                                                                    Text(
                                                                      'Ubicacion',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .fileContract,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        size:
                                                                            32.0,
                                                                      ),
                                                                      Text(
                                                                        'Contratacion',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  final selectedMedia =
                                                                      await selectMediaWithSourceBottomSheet(
                                                                    context:
                                                                        context,
                                                                    imageQuality:
                                                                        100,
                                                                    allowPhoto:
                                                                        true,
                                                                    allowVideo:
                                                                        true,
                                                                  );
                                                                  if (selectedMedia !=
                                                                          null &&
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    safeSetState(() =>
                                                                        _model.isDataUploading =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];

                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = selectedMedia
                                                                          .map((m) => FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                              ))
                                                                          .toList();

                                                                      downloadUrls = (await Future
                                                                              .wait(
                                                                        selectedMedia
                                                                            .map(
                                                                          (m) async => await uploadData(
                                                                              m.storagePath,
                                                                              m.bytes),
                                                                        ),
                                                                      ))
                                                                          .where((u) =>
                                                                              u !=
                                                                              null)
                                                                          .map((u) =>
                                                                              u!)
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isDataUploading =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  var mensajesRecordReference =
                                                                      MensajesRecord.createDoc(_model
                                                                          .selectedChat!
                                                                          .reference);
                                                                  await mensajesRecordReference
                                                                      .set(
                                                                          createMensajesRecordData(
                                                                    image: _model
                                                                        .uploadedFileUrl,
                                                                    sendTime:
                                                                        getCurrentTimestamp,
                                                                    messageSeen:
                                                                        false,
                                                                    user:
                                                                        currentUserReference,
                                                                  ));
                                                                  _model.newImageMessage =
                                                                      MensajesRecord.getDocumentFromData(
                                                                          createMensajesRecordData(
                                                                            image:
                                                                                _model.uploadedFileUrl,
                                                                            sendTime:
                                                                                getCurrentTimestamp,
                                                                            messageSeen:
                                                                                false,
                                                                            user:
                                                                                currentUserReference,
                                                                          ),
                                                                          mensajesRecordReference);

                                                                  await _model
                                                                      .selectedChat!
                                                                      .reference
                                                                      .update(
                                                                          createConversacionRecordData(
                                                                    lastMessage:
                                                                        'Foto 📷',
                                                                    lastMessageTime: _model
                                                                        .newImageMessage
                                                                        ?.sendTime,
                                                                    lastMessageUserRef: _model
                                                                        .newImageMessage
                                                                        ?.user,
                                                                  ));
                                                                  FFAppState()
                                                                          .showMessageActions =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .image_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).warning,
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                        Text(
                                                                          'Imagen',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Lexend',
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().showConversacion)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 32.0, 32.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: 576.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16.0),
                                              bottomRight:
                                                  Radius.circular(16.0),
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 64.0,
                                                        height: 64.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          _model.contacto!
                                                              .photoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _model.contacto!
                                                                .nombre,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (_model
                                                              .contacto?.rol ==
                                                          Rol.Profesional.name)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x270072C4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            24.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            24.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            24.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            24.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    _model
                                                                        .contacto!
                                                                        .servicio,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Text(
                                                                      _model
                                                                          .contacto!
                                                                          .locacion,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      SizedBox(
                                                        height: 100.0,
                                                        child: VerticalDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                                  .showDeleteChat =
                                                              !(FFAppState()
                                                                      .showDeleteChat ??
                                                                  true);
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.more_vert,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().showDeleteChat)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 96.0, 56.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
                                          ),
                                          child: Container(
                                            width: 224.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.delete_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 32.0,
                                                      ),
                                                      Text(
                                                        'Eliminar \nConversacion',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ),
                                ],
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation']!,
                            ),
                        ].divide(SizedBox(width: 64.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
