// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'package:reminder/model/alarm_model.dart';
// import 'package:reminder/model/notes_model.dart';
// import 'package:reminder/model/todo_model.dart';

// import '../objectbox.g.dart'; // created by `flutter pub run build_runner build`

// class ObjectBox {
//   /// The Store of this app.
//   late final Store store;

//   late final Box<Alarm> alarmBox;
//   late final Box<Notes> notesBox;
//   late final Box<Todo> todoBox;
//   ObjectBox._create(this.store) {
//     alarmBox = store.box<Alarm>();
//     notesBox = store.box<Notes>();
//     todoBox = store.box<Todo>();
//     // Add any additional setup code, e.g. build queries.
//   }

//   /// Create an instance of ObjectBox to use throughout the app.
//   static Future<ObjectBox> create() async {
//     final store = await openStore();
//     return ObjectBox._create(store);
//   }

//   Future <void> setNewAlarm(String name, DateTime time) async{
//     alarmBox.put(Alarm(0, alarmTime: time, alarmTitle: name));
//     print('new alarm set');
//   }

//   Stream<List<Alarm>> getAlarms() {
//     final builder = alarmBox.query()
//       ..order(AlarmModel_.id, flags: Order.descending);
//     return builder.watch(triggerImmediately: true).map((query) => query.find());
//   }
// }
