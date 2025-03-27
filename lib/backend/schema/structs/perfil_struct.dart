// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PerfilStruct extends FFFirebaseStruct {
  PerfilStruct({
    DocumentReference? usuario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usuario = usuario,
        super(firestoreUtilData);

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  set usuario(DocumentReference? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  static PerfilStruct fromMap(Map<String, dynamic> data) => PerfilStruct(
        usuario: data['usuario'] as DocumentReference?,
      );

  static PerfilStruct? maybeFromMap(dynamic data) =>
      data is Map ? PerfilStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'usuario': _usuario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usuario': serializeParam(
          _usuario,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static PerfilStruct fromSerializableMap(Map<String, dynamic> data) =>
      PerfilStruct(
        usuario: deserializeParam(
          data['usuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
      );

  @override
  String toString() => 'PerfilStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PerfilStruct && usuario == other.usuario;
  }

  @override
  int get hashCode => const ListEquality().hash([usuario]);
}

PerfilStruct createPerfilStruct({
  DocumentReference? usuario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PerfilStruct(
      usuario: usuario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PerfilStruct? updatePerfilStruct(
  PerfilStruct? perfil, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    perfil
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPerfilStructData(
  Map<String, dynamic> firestoreData,
  PerfilStruct? perfil,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (perfil == null) {
    return;
  }
  if (perfil.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && perfil.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final perfilData = getPerfilFirestoreData(perfil, forFieldValue);
  final nestedData = perfilData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = perfil.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPerfilFirestoreData(
  PerfilStruct? perfil, [
  bool forFieldValue = false,
]) {
  if (perfil == null) {
    return {};
  }
  final firestoreData = mapToFirestore(perfil.toMap());

  // Add any Firestore field values
  perfil.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPerfilListFirestoreData(
  List<PerfilStruct>? perfils,
) =>
    perfils?.map((e) => getPerfilFirestoreData(e, true)).toList() ?? [];
