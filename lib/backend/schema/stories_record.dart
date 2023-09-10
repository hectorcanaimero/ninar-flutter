import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "character" field.
  String? _character;
  String get character => _character ?? '';
  bool hasCharacter() => _character != null;

  // "theme" field.
  String? _theme;
  String get theme => _theme ?? '';
  bool hasTheme() => _theme != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _character = snapshotData['character'] as String?;
    _theme = snapshotData['theme'] as String?;
    _age = snapshotData['age'] as String?;
    _language = snapshotData['language'] as String?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _image = snapshotData['image'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  DocumentReference? user,
  String? character,
  String? theme,
  String? age,
  String? language,
  String? title,
  String? content,
  String? image,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'character': character,
      'theme': theme,
      'age': age,
      'language': language,
      'title': title,
      'content': content,
      'image': image,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.character == e2?.character &&
        e1?.theme == e2?.theme &&
        e1?.age == e2?.age &&
        e1?.language == e2?.language &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.image == e2?.image &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(StoriesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.character,
        e?.theme,
        e?.age,
        e?.language,
        e?.title,
        e?.content,
        e?.image,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
