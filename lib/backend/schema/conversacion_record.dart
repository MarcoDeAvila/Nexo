import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversacionRecord extends FirestoreRecord {
  ConversacionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "message_seen" field.
  bool? _messageSeen;
  bool get messageSeen => _messageSeen ?? false;
  bool hasMessageSeen() => _messageSeen != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "last_message_userRef" field.
  DocumentReference? _lastMessageUserRef;
  DocumentReference? get lastMessageUserRef => _lastMessageUserRef;
  bool hasLastMessageUserRef() => _lastMessageUserRef != null;

  // "last_message_ref" field.
  DocumentReference? _lastMessageRef;
  DocumentReference? get lastMessageRef => _lastMessageRef;
  bool hasLastMessageRef() => _lastMessageRef != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _messageSeen = snapshotData['message_seen'] as bool?;
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _lastMessageUserRef =
        snapshotData['last_message_userRef'] as DocumentReference?;
    _lastMessageRef = snapshotData['last_message_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Conversacion');

  static Stream<ConversacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversacionRecord.fromSnapshot(s));

  static Future<ConversacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversacionRecord.fromSnapshot(s));

  static ConversacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConversacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConversacionRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  bool? messageSeen,
  DocumentReference? userA,
  DocumentReference? userB,
  DocumentReference? lastMessageUserRef,
  DocumentReference? lastMessageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'message_seen': messageSeen,
      'user_a': userA,
      'user_b': userB,
      'last_message_userRef': lastMessageUserRef,
      'last_message_ref': lastMessageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConversacionRecordDocumentEquality
    implements Equality<ConversacionRecord> {
  const ConversacionRecordDocumentEquality();

  @override
  bool equals(ConversacionRecord? e1, ConversacionRecord? e2) {
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.messageSeen == e2?.messageSeen &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.lastMessageUserRef == e2?.lastMessageUserRef &&
        e1?.lastMessageRef == e2?.lastMessageRef;
  }

  @override
  int hash(ConversacionRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.messageSeen,
        e?.userA,
        e?.userB,
        e?.lastMessageUserRef,
        e?.lastMessageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ConversacionRecord;
}
