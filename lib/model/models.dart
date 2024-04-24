
import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Alarm{
@Id()
int id;

String title;
String description;
String time;
String date;
String repeat;
String color;

Alarm(this.id,this.title,this.description,this.time,this.date,this.repeat,this.color,);
}

@Entity()
@Sync()
class Note{
@Id()
int id;

String title;
String description;

String date;

String color;

Note(this.id,this.title,this.description,this.date,this.color,);
}

@Entity()
@Sync()
class Todo{
@Id()
int id;

String title;
String description;

String date;

String color;

Todo(this.id,this.title,this.description,this.date,this.color,);
}