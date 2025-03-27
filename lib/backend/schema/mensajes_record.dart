import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensajesRecord extends FirestoreRecord {
  MensajesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "send_time" field.
  DateTime? _sendTime;
  DateTime? get sendTime => _sendTime;
  bool hasSendTime() => _sendTime != null;

  // "message_seen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _sendTime = snapshotData['send_time'] as DateTime?;
    _messageSeen = snapshotData['message_seen'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Mensajes')
          : FirebaseFirestore.instance.collectionGroup('Mensajes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Mensajes').doc(id);

  static Stream<MensajesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MensajesRecord.fromSnapshot(s));

  static Future<MensajesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MensajesRecord.fromSnapshot(s));

  static MensajesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MensajesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MensajesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MensajesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MensajesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MensajesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMensajesRecordData({
  String? text,
  String? image,
  DateTime? sendTime,
  bool? messageSeen,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'image': image,
      'send_time': sendTime,
      'message_seen': messageSeen,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class MensajesRecordDocumentEquality implements Equality<MensajesRecord> {
  const MensajesRecordDocumentEquality();

  @override
  bool equals(MensajesRecord? e1, MensajesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.sendTime == e2?.sendTime &&
        e1?.messageSeen == e2?.messageSeen &&
        e1?.user == e2?.user;
  }

  @override
  int hash(MensajesRecord? e) => const ListEquality()
      .hash([e?.text, e?.image, e?.sendTime, e?.messageSeen, e?.user]);

  @override
  bool isValidKey(Object? o) => o is MensajesRecord;
}
