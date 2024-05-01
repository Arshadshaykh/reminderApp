import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../model/models.dart';
import '../objectbox.g.dart'; // created by `flutter pub run build_runner build`

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  /// A Box of notes.
  late final Box<Note> _noteBox;
  late final Box<Alarm> _alarmBox;
  late final Box<Todo> _todoBox;

  ObjectBox._create(this._store) {
    _noteBox = Box<Note>(_store);
    _alarmBox = Box<Alarm>(_store);
    _todoBox = Box<Todo>(_store);

    // Add some demo data if the box is empty.
    // if (_noteBox.isEmpty()) {
    //   _putDemoData();
    // }
    // if (_alarmBox.isEmpty()) {
    //   _putAlarmDemoData();
    // }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Note: setting a unique directory is recommended if running on desktop
    // platforms. If none is specified, the default directory is created in the
    // users documents directory, which will not be unique between apps.
    // On mobile this is typically fine, as each app has its own directory
    // structure.

    // Note: set macosApplicationGroup for sandboxed macOS applications, see the
    // info boxes at https://docs.objectbox.io/getting-started for details.

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
        directory:
            p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  void _putDemoData() {
    final demoNotes = [
      Note('Add a comment by tapping on + button'),
      Note('Delete notes by tapping on one'),
      Note('Write a demo app for ObjectBox')
    ];
    _noteBox.putManyAsync(demoNotes);
  }

  void _putAlarmDemoData() {
    final demoAlarms = [
      Alarm(
          notiId: 0,
          title: 'Add a Title by tapping on + button',
          time: DateTime.now().toString()),
      Alarm(notiId: 0, title: 'Alarm 1', time: DateTime.now().toString()),
      Alarm(notiId: 0, title: 'Alarm 2', time: DateTime.now().toString()),
    ];
    _alarmBox.putManyAsync(demoAlarms);
  }

/*
  notes box:
 ================================================================================================================
*/
  Stream<List<Note>> getNotes() {
    final builder = _noteBox.query().order(Note_.date, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  /// Add a note.
  ///
  /// To avoid frame drops, run ObjectBox operations that take longer than a
  /// few milliseconds, e.g. putting many objects, asynchronously.
  /// For this example only a single object is put which would also be fine if
  /// done using [Box.put].
  Future<void> addNote(String text, String comment) =>
      _noteBox.putAsync(Note(text, comment: comment));

  Future<void> removeNote(int id) => _noteBox.removeAsync(id);

/*
 Alarm Box:
 ================================================================================================================
*/
  Stream<List<Alarm>> getAlarm() {
    final builder =
        _alarmBox.query().order(Alarm_.date, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Future<void> addAlarm(int id, String title, String time) => _alarmBox
      .putAsync(Alarm(notiId: id, title: title, time: time, isActive: true));

  Future<void> updateAlarm(
          int id, int notiId, String title, String time, bool isActive) =>
      _alarmBox.putAsync(
          Alarm(
              id: id,
              notiId: notiId,
              title: title,
              time: time,
              isActive: isActive),
          mode: PutMode.update);

  Future<void> removeAlarm(int id) => _alarmBox.removeAsync(id);
}
