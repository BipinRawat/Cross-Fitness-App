import 'package:flutter/material.dart';
import 'constexe.dart';

enum ExerciseType { mon, tue, wed,thu,fri,sat }

String getExerciseName(ExerciseType type) {
  switch (type) {
    case ExerciseType.mon:
      return 'Mon';
      break;
    case ExerciseType.tue:
      return 'Tue';
      break;
    case ExerciseType.wed:
      return 'Wed';
      break;
    case ExerciseType.thu:
      return 'Thu';
      break;
    case ExerciseType.fri:
      return 'Fri';
      break;
    case ExerciseType.sat:
      return 'Sat';
      break;
    default:
      return 'All';
      break;
  }
}

class ExerciseSet {
  final String name;
  // final String title;
  final String raps;
  final List<Exercise> exercises;
  final String imageUrl;
  final ExerciseType exerciseType;
  final Color color;
  final GestureTapCallback onTap;


  const ExerciseSet({
     @required this.name,
    // @required this.title,
    @required this.exercises,
    @required this.imageUrl,
    @required this.exerciseType,
    @required this.color,
    @required this.onTap,
    @required this.raps,


  }
  );

  String get totalDuration {
    final duration = exercises.fold(
      Duration.zero,
          (previous, element) => previous + element.duration,
    );

    return duration.inMinutes.toString();
  }
}

