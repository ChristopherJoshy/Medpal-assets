import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRecord extends FirestoreRecord {
  TaskRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "XP" field.
  int? _xp;
  int get xp => _xp ?? 0;
  bool hasXp() => _xp != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "usrname" field.
  String? _usrname;
  String get usrname => _usrname ?? '';
  bool hasUsrname() => _usrname != null;

  // "usrpic" field.
  String? _usrpic;
  String get usrpic => _usrpic ?? '';
  bool hasUsrpic() => _usrpic != null;

  void _initializeFields() {
    _completed = snapshotData['completed'] as bool?;
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _xp = castToType<int>(snapshotData['XP']);
    _level = castToType<int>(snapshotData['level']);
    _usrname = snapshotData['usrname'] as String?;
    _usrpic = snapshotData['usrpic'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task');

  static Stream<TaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskRecord.fromSnapshot(s));

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskRecord.fromSnapshot(s));

  static TaskRecord fromSnapshot(DocumentSnapshot snapshot) => TaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskRecordData({
  bool? completed,
  String? title,
  String? details,
  DocumentReference? user,
  int? xp,
  int? level,
  String? usrname,
  String? usrpic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'completed': completed,
      'title': title,
      'details': details,
      'user': user,
      'XP': xp,
      'level': level,
      'usrname': usrname,
      'usrpic': usrpic,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskRecordDocumentEquality implements Equality<TaskRecord> {
  const TaskRecordDocumentEquality();

  @override
  bool equals(TaskRecord? e1, TaskRecord? e2) {
    return e1?.completed == e2?.completed &&
        e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        e1?.user == e2?.user &&
        e1?.xp == e2?.xp &&
        e1?.level == e2?.level &&
        e1?.usrname == e2?.usrname &&
        e1?.usrpic == e2?.usrpic;
  }

  @override
  int hash(TaskRecord? e) => const ListEquality().hash([
        e?.completed,
        e?.title,
        e?.details,
        e?.user,
        e?.xp,
        e?.level,
        e?.usrname,
        e?.usrpic
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskRecord;
}
