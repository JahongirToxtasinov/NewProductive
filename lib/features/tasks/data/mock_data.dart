import 'dart:math';
import 'dart:ui';

import 'models/priority.dart';

final _random = Random();
var data = <String, dynamic>{
  "tasks": [
    {
      "id": 1,
      "title": "Gym time",
      "icon": "assets/icons/tasks/gym.svg",
      "priority": Priority.low,
      "note": null,
      "start_date": DateTime(2023, 11, 12, 15, 0),
      "due_date": DateTime(2023, 11, 12, 16, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
    {
      "id": 2,
      "title": "Meet the cdevs team",
      "icon": "assets/icons/tasks/meetcamera.svg",
      "priority": Priority.high,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 17, 0),
      "due_date": DateTime(2023, 11, 12, 17, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
    {
      "id": 3,
      "title": "Study for the constitutional judiciary test",
      "icon": "assets/icons/tasks/study.svg",
      "priority": Priority.medium,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 18, 0),
      "due_date": DateTime(2023, 11, 12, 20, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
    {
      "id": 4,
      "title": "Cleaning my room",
      "icon": "assets/icons/tasks/task_mark.svg",
      "priority": Priority.low,
      "note": "I will sort the books, redecorate the room",
      "start_date": DateTime(2023, 11, 12, 8, 0),
      "due_date": DateTime(2023, 11, 12, 8, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
    {
      "id": 5,
      "title": "Gym time",
      "icon": "assets/icons/tasks/gym.svg",
      "priority": Priority.low,
      "note": null,
      "start_date": DateTime(2023, 11, 12, 15, 0),
      "due_date": DateTime(2023, 11, 12, 16, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
    {
      "id": 6,
      "title": "Study for the constitutional judiciary test",
      "icon": "assets/icons/tasks/study.svg",
      "priority": Priority.medium,
      "note": "We will discuss the new Tasks of the calendar pages",
      "start_date": DateTime(2023, 11, 12, 18, 0),
      "due_date": DateTime(2023, 11, 12, 20, 30),
      "is_checked": false,
      "icon_color": Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1),
    },
  ],
};
