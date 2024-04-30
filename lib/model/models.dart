import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Alarm {
  int id;
  int notiId;
  String? title;
  String? time;
  @Property(type: PropertyType.date)
  DateTime? date;
  Color? color;
  bool? isActive, isRepeat;

  Alarm({
    this.id = 0,
    required this.title,
    required this.time,
    required this.notiId,
    this.date,
    this.color,
    this.isActive,
    this.isRepeat
  });
}

// @Entity()
// @Sync()
// class Note{
// @Id()
// int id;

// String title;
// String description;

// String date;

// String color;

// Note(this.id,this.title,this.description,this.date,this.color,);
// }

@Entity()
class Note {
  int id;

  String text;
  String? comment;

  /// Note: Stored in milliseconds without time zone info.
  DateTime date;

  Note(this.text, {this.id = 0, this.comment, DateTime? date})
      : date = date ?? DateTime.now();

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}

@Entity()
@Sync()
class Todo {
  @Id()
  int id;

  String title;
  String description;

  String date;

  String color;

  Todo(
    this.id,
    this.title,
    this.description,
    this.date,
    this.color,
  );
}
