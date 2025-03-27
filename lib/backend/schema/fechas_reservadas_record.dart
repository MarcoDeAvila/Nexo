import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FechasReservadasRecord extends FirestoreRecord {
  FechasReservadasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "professional" field.
  DocumentReference? _professional;
  DocumentReference? get professional => _professional;
  bool hasProfessional() => _professional != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  void _initializeFields() {
    _client = snapshotData['client'] as DocumentReference?;
    _professional = snapshotData['professional'] as DocumentReference?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FechasReservadas');

  static Stream<FechasReservadasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FechasReservadasRecord.fromSnapshot(s));

  static Future<FechasReservadasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FechasReservadasRecord.fromSnapshot(s));

  static FechasReservadasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FechasReservadasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FechasReservadasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FechasReservadasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FechasReservadasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FechasReservadasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFechasReservadasRecordData({
  DocumentReference? client,
  DocumentReference? professional,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'client': client,
      'professional': professional,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class FechasReservadasRecordDocumentEquality
    implements Equality<FechasReservadasRecord> {
  const FechasReservadasRecordDocumentEquality();

  @override
  bool equals(FechasReservadasRecord? e1, FechasReservadasRecord? e2) {
    return e1?.client == e2?.client &&
        e1?.professional == e2?.professional &&
        e1?.fecha == e2?.fecha;
  }

  @override
  int hash(FechasReservadasRecord? e) =>
      const ListEquality().hash([e?.client, e?.professional, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is FechasReservadasRecord;
}
