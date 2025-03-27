import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortafolioRecord extends FirestoreRecord {
  PortafolioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _foto = snapshotData['foto'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Portafolio')
          : FirebaseFirestore.instance.collectionGroup('Portafolio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Portafolio').doc(id);

  static Stream<PortafolioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortafolioRecord.fromSnapshot(s));

  static Future<PortafolioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortafolioRecord.fromSnapshot(s));

  static PortafolioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortafolioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortafolioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortafolioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortafolioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortafolioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortafolioRecordData({
  String? foto,
  DateTime? fecha,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'foto': foto,
      'fecha': fecha,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortafolioRecordDocumentEquality implements Equality<PortafolioRecord> {
  const PortafolioRecordDocumentEquality();

  @override
  bool equals(PortafolioRecord? e1, PortafolioRecord? e2) {
    return e1?.foto == e2?.foto && e1?.fecha == e2?.fecha;
  }

  @override
  int hash(PortafolioRecord? e) =>
      const ListEquality().hash([e?.foto, e?.fecha]);

  @override
  bool isValidKey(Object? o) => o is PortafolioRecord;
}
