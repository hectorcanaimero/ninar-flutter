import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemesRecord extends FirestoreRecord {
  ThemesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('themes');

  static Stream<ThemesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThemesRecord.fromSnapshot(s));

  static Future<ThemesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThemesRecord.fromSnapshot(s));

  static ThemesRecord fromSnapshot(DocumentSnapshot snapshot) => ThemesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThemesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThemesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThemesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThemesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThemesRecordData({
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThemesRecordDocumentEquality implements Equality<ThemesRecord> {
  const ThemesRecordDocumentEquality();

  @override
  bool equals(ThemesRecord? e1, ThemesRecord? e2) {
    return e1?.name == e2?.name && e1?.description == e2?.description;
  }

  @override
  int hash(ThemesRecord? e) =>
      const ListEquality().hash([e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ThemesRecord;
}
