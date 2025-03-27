import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_component_model.dart';
export 'review_component_model.dart';

class ReviewComponentWidget extends StatefulWidget {
  const ReviewComponentWidget({super.key});

  @override
  State<ReviewComponentWidget> createState() => _ReviewComponentWidgetState();
}

class _ReviewComponentWidgetState extends State<ReviewComponentWidget> {
  late ReviewComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewComponentModel());

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
                          'https://picsum.photos/seed/238/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Juan Rodriguez',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Ago 31, 2024',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color: Color(0xFF7B7B7B),
                                  fontSize: 20.0,
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
                  rating: 5.0,
                  unratedColor: Color(0x27FF5C00),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Text(
              'Fue respetuoso, puntual con los pagos y estuvo siempre dispuesto a colaborar cuando era necesario. Además, mostró mucha paciencia y comprensión ante cualquier imprevisto que surgió durante la ejecución del trabajo.',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Lexend',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
