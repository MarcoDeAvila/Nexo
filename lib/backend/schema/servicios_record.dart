import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiciosRecord extends FirestoreRecord {
  ServiciosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _id = snapshotData['Id'] as String?;
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Servicios');

  static Stream<ServiciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiciosRecord.fromSnapshot(s));

  static Future<ServiciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiciosRecord.fromSnapshot(s));

  static ServiciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiciosRecordData({
  String? id,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Id': id,
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiciosRecordDocumentEquality implements Equality<ServiciosRecord> {
  const ServiciosRecordDocumentEquality();

  @override
  bool equals(ServiciosRecord? e1, ServiciosRecord? e2) {
    return e1?.id == e2?.id && e1?.nombre == e2?.nombre;
  }

  @override
  int hash(ServiciosRecord? e) => const ListEquality().hash([e?.id, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is ServiciosRecord;
}
