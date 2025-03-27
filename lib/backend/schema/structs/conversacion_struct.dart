// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversacionStruct extends FFFirebaseStruct {
  ConversacionStruct({
    String? nombre,
    String? foto,
    String? servicio,
    String? locacion,
    List<DocumentReference>? mensajes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _foto = foto,
        _servicio = servicio,
        _locacion = locacion,
        _mensajes = mensajes,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "servicio" field.
  String? _servicio;
  String get servicio => _servicio ?? '';
  set servicio(String? val) => _servicio = val;

  bool hasServicio() => _servicio != null;

  // "locacion" field.
  String? _locacion;
  String get locacion => _locacion ?? '';
  set locacion(String? val) => _locacion = val;

  bool hasLocacion() => _locacion != null;

  // "mensajes" field.
  List<DocumentReference>? _mensajes;
  List<DocumentReference> get mensajes => _mensajes ?? const [];
  set mensajes(List<DocumentReference>? val) => _mensajes = val;

  void updateMensajes(Function(List<DocumentReference>) updateFn) {
    updateFn(_mensajes ??= []);
  }

  bool hasMensajes() => _mensajes != null;

  static ConversacionStruct fromMap(Map<String, dynamic> data) =>
      ConversacionStruct(
        nombre: data['nombre'] as String?,
        foto: data['foto'] as String?,
        servicio: data['servicio'] as String?,
        locacion: data['locacion'] as String?,
        mensajes: getDataList(data['mensajes']),
      );

  static ConversacionStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversacionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'foto': _foto,
        'servicio': _servicio,
        'locacion': _locacion,
        'mensajes': _mensajes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'servicio': serializeParam(
          _servicio,
          ParamType.String,
        ),
        'locacion': serializeParam(
          _locacion,
          ParamType.String,
        ),
        'mensajes': serializeParam(
          _mensajes,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ConversacionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversacionStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        servicio: deserializeParam(
          data['servicio'],
          ParamType.String,
          false,
        ),
        locacion: deserializeParam(
          data['locacion'],
          ParamType.String,
          false,
        ),
        mensajes: deserializeParam<DocumentReference>(
          data['mensajes'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Conversacion', 'Mensajes'],
        ),
      );

  @override
  String toString() => 'ConversacionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConversacionStruct &&
        nombre == other.nombre &&
        foto == other.foto &&
        servicio == other.servicio &&
        locacion == other.locacion &&
        listEquality.equals(mensajes, other.mensajes);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombre, foto, servicio, locacion, mensajes]);
}

ConversacionStruct createConversacionStruct({
  String? nombre,
  String? foto,
  String? servicio,
  String? locacion,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConversacionStruct(
      nombre: nombre,
      foto: foto,
      servicio: servicio,
      locacion: locacion,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConversacionStruct? updateConversacionStruct(
  ConversacionStruct? conversacion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    conversacion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConversacionStructData(
  Map<String, dynamic> firestoreData,
  ConversacionStruct? conversacion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (conversacion == null) {
    return;
  }
  if (conversacion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && conversacion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final conversacionData =
      getConversacionFirestoreData(conversacion, forFieldValue);
  final nestedData =
      conversacionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = conversacion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConversacionFirestoreData(
  ConversacionStruct? conversacion, [
  bool forFieldValue = false,
]) {
  if (conversacion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(conversacion.toMap());

  // Add any Firestore field values
  conversacion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConversacionListFirestoreData(
  List<ConversacionStruct>? conversacions,
) =>
    conversacions?.map((e) => getConversacionFirestoreData(e, true)).toList() ??
    [];
