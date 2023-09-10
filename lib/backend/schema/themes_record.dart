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

  // "locale" field.
  String? _locale;
  String get locale => _locale ?? '';
  bool hasLocale() => _locale != null;

  // "list" field.
  List<String>? _list;
  List<String> get list => _list ?? const [];
  bool hasList() => _list != null;

  void _initializeFields() {
    _locale = snapshotData['locale'] as String?;
    _list = getDataList(snapshotData['list']);
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
  String? locale,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'locale': locale,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThemesRecordDocumentEquality implements Equality<ThemesRecord> {
  const ThemesRecordDocumentEquality();

  @override
  bool equals(ThemesRecord? e1, ThemesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.locale == e2?.locale && listEquality.equals(e1?.list, e2?.list);
  }

  @override
  int hash(ThemesRecord? e) => const ListEquality().hash([e?.locale, e?.list]);

  @override
  bool isValidKey(Object? o) => o is ThemesRecord;
}
