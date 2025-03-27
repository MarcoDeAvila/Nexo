import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaRecord extends FirestoreRecord {
  AgendaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fechas" field.
  List<DocumentReference>? _fechas;
  List<DocumentReference> get fechas => _fechas ?? const [];
  bool hasFechas() => _fechas != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fechas = getDataList(snapshotData['fechas']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Agenda')
          : FirebaseFirestore.instance.collectionGroup('Agenda');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Agenda').doc(id);

  static Stream<AgendaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendaRecord.fromSnapshot(s));

  static Future<AgendaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendaRecord.fromSnapshot(s));

  static AgendaRecord fromSnapshot(DocumentSnapshot snapshot) => AgendaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendaRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AgendaRecordDocumentEquality implements Equality<AgendaRecord> {
  const AgendaRecordDocumentEquality();

  @override
  bool equals(AgendaRecord? e1, AgendaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.fechas, e2?.fechas);
  }

  @override
  int hash(AgendaRecord? e) => const ListEquality().hash([e?.fechas]);

  @override
  bool isValidKey(Object? o) => o is AgendaRecord;
}
