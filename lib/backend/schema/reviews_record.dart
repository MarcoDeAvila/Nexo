import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reviewer" field.
  DocumentReference? _reviewer;
  DocumentReference? get reviewer => _reviewer;
  bool hasReviewer() => _reviewer != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "valoracion" field.
  int? _valoracion;
  int get valoracion => _valoracion ?? 0;
  bool hasValoracion() => _valoracion != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reviewer = snapshotData['reviewer'] as DocumentReference?;
    _descripcion = snapshotData['descripcion'] as String?;
    _valoracion = castToType<int>(snapshotData['valoracion']);
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reviews')
          : FirebaseFirestore.instance.collectionGroup('Reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? reviewer,
  String? descripcion,
  int? valoracion,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewer': reviewer,
      'descripcion': descripcion,
      'valoracion': valoracion,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.reviewer == e2?.reviewer &&
        e1?.descripcion == e2?.descripcion &&
        e1?.valoracion == e2?.valoracion &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality()
      .hash([e?.reviewer, e?.descripcion, e?.valoracion, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
