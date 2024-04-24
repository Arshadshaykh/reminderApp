// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 8060929219629081792),
      name: 'Alarm',
      lastPropertyId: const obx_int.IdUid(7, 4447728869959404878),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7791174109551043957),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1312375829830876639),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2154382072574961279),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2532264417801061915),
            name: 'time',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 4766481406429766239),
            name: 'date',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2661413459694457643),
            name: 'repeat',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 4447728869959404878),
            name: 'color',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 8873842812152204191),
      name: 'Note',
      lastPropertyId: const obx_int.IdUid(5, 1719279541491291160),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3074657124040132434),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6335705169714339273),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4569310950331442244),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 779800061797180739),
            name: 'date',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1719279541491291160),
            name: 'color',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 7733068626788435465),
      name: 'Todo',
      lastPropertyId: const obx_int.IdUid(5, 257441109583103846),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 882983128830991163),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3936719633399996985),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6413448706745364907),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3135455801190713232),
            name: 'date',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 257441109583103846),
            name: 'color',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(3, 7733068626788435465),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Alarm: obx_int.EntityDefinition<Alarm>(
        model: _entities[0],
        toOneRelations: (Alarm object) => [],
        toManyRelations: (Alarm object) => {},
        getId: (Alarm object) => object.id,
        setId: (Alarm object, int id) {
          object.id = id;
        },
        objectToFB: (Alarm object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final timeOffset = fbb.writeString(object.time);
          final dateOffset = fbb.writeString(object.date);
          final repeatOffset = fbb.writeString(object.repeat);
          final colorOffset = fbb.writeString(object.color);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, timeOffset);
          fbb.addOffset(4, dateOffset);
          fbb.addOffset(5, repeatOffset);
          fbb.addOffset(6, colorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final timeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final repeatParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final object = Alarm(idParam, titleParam, descriptionParam, timeParam,
              dateParam, repeatParam, colorParam);

          return object;
        }),
    Note: obx_int.EntityDefinition<Note>(
        model: _entities[1],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) => {},
        getId: (Note object) => object.id,
        setId: (Note object, int id) {
          object.id = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final dateOffset = fbb.writeString(object.date);
          final colorOffset = fbb.writeString(object.color);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, dateOffset);
          fbb.addOffset(4, colorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = Note(
              idParam, titleParam, descriptionParam, dateParam, colorParam);

          return object;
        }),
    Todo: obx_int.EntityDefinition<Todo>(
        model: _entities[2],
        toOneRelations: (Todo object) => [],
        toManyRelations: (Todo object) => {},
        getId: (Todo object) => object.id,
        setId: (Todo object, int id) {
          object.id = id;
        },
        objectToFB: (Todo object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final dateOffset = fbb.writeString(object.date);
          final colorOffset = fbb.writeString(object.color);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, dateOffset);
          fbb.addOffset(4, colorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = Todo(
              idParam, titleParam, descriptionParam, dateParam, colorParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Alarm] entity fields to define ObjectBox queries.
class Alarm_ {
  /// see [Alarm.id]
  static final id = obx.QueryIntegerProperty<Alarm>(_entities[0].properties[0]);

  /// see [Alarm.title]
  static final title =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[1]);

  /// see [Alarm.description]
  static final description =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[2]);

  /// see [Alarm.time]
  static final time =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[3]);

  /// see [Alarm.date]
  static final date =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[4]);

  /// see [Alarm.repeat]
  static final repeat =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[5]);

  /// see [Alarm.color]
  static final color =
      obx.QueryStringProperty<Alarm>(_entities[0].properties[6]);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// see [Note.id]
  static final id = obx.QueryIntegerProperty<Note>(_entities[1].properties[0]);

  /// see [Note.title]
  static final title =
      obx.QueryStringProperty<Note>(_entities[1].properties[1]);

  /// see [Note.description]
  static final description =
      obx.QueryStringProperty<Note>(_entities[1].properties[2]);

  /// see [Note.date]
  static final date = obx.QueryStringProperty<Note>(_entities[1].properties[3]);

  /// see [Note.color]
  static final color =
      obx.QueryStringProperty<Note>(_entities[1].properties[4]);
}

/// [Todo] entity fields to define ObjectBox queries.
class Todo_ {
  /// see [Todo.id]
  static final id = obx.QueryIntegerProperty<Todo>(_entities[2].properties[0]);

  /// see [Todo.title]
  static final title =
      obx.QueryStringProperty<Todo>(_entities[2].properties[1]);

  /// see [Todo.description]
  static final description =
      obx.QueryStringProperty<Todo>(_entities[2].properties[2]);

  /// see [Todo.date]
  static final date = obx.QueryStringProperty<Todo>(_entities[2].properties[3]);

  /// see [Todo.color]
  static final color =
      obx.QueryStringProperty<Todo>(_entities[2].properties[4]);
}
