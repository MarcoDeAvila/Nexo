import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_desktop_model.dart';
export 'review_desktop_model.dart';

class ReviewDesktopWidget extends StatefulWidget {
  const ReviewDesktopWidget({
    super.key,
    required this.review,
  });

  final ReviewsRecord? review;

  @override
  State<ReviewDesktopWidget> createState() => _ReviewDesktopWidgetState();
}

class _ReviewDesktopWidgetState extends State<ReviewDesktopWidget> {
  late ReviewDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewDesktopModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.user =
          await UsersRecord.getDocumentOnce(widget.review!.reviewer!);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 64.0,
                        height: 64.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          _model.user!.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _model.user!.nombre,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            dateTimeFormat("yMMMd", widget.review!.fecha!),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
                RatingBarIndicator(
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFF5C00),
                  ),
                  direction: Axis.horizontal,
                  rating: widget.review!.valoracion.toDouble(),
                  unratedColor: Color(0x27FF5C00),
                  itemCount: 5,
                  itemSize: 32.0,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Text(
              widget.review!.descripcion,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Lexend',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
