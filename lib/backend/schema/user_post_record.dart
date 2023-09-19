import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPostRecord extends FirestoreRecord {
  UserPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  List<String>? _likes;
  List<String> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userPost');

  static Stream<UserPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPostRecord.fromSnapshot(s));

  static Future<UserPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPostRecord.fromSnapshot(s));

  static UserPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPostRecordData({
  String? message,
  String? userEmail,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'userEmail': userEmail,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPostRecordDocumentEquality implements Equality<UserPostRecord> {
  const UserPostRecordDocumentEquality();

  @override
  bool equals(UserPostRecord? e1, UserPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        e1?.userEmail == e2?.userEmail &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(UserPostRecord? e) => const ListEquality()
      .hash([e?.message, e?.userEmail, e?.createdTime, e?.likes]);

  @override
  bool isValidKey(Object? o) => o is UserPostRecord;
}
