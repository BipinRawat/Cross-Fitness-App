import 'package:flutter/material.dart';
import 'package:lets_walk/Diet/diet_screens/diet_home_page.dart';
import 'package:lets_walk/exercise/exercise_model/dataConst.dart';
import 'exerxise.dart';

final exerciseSets = [
  ExerciseSet(
    name: 'CHEST',
     // exercises: exercises1,
    imageUrl: 'assets/exe/mon1.png',
    exerciseType: ExerciseType.mon,
    color: Colors.blue.shade100.withOpacity(0.6),
    raps: "Follow the Chest Exercises",
    onTap: () {print("core");
    }

  ),
  ExerciseSet(
    name: 'Flat Bench Barbell Press',
      raps: "4 sets of 8 – 12 reps",
    // exercises: exercises3,
    imageUrl: 'assets/exe/mon1.png',
    exerciseType: ExerciseType.mon,
    color: Colors.green.shade100.withOpacity(0.6),
      onTap: () {print("Abs");
    }
  ),
  ExerciseSet(
    name: 'Incline Dumbbel Press',
      raps: "4 sets of 8 – 12 reps",
    exercises: exercises1,
    imageUrl: 'assets/exe/mon2.png',
    exerciseType: ExerciseType.mon,
    color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Upper Body");
      }
  ),
  ExerciseSet(
    name: 'Incline Dumbbel Flyes',
      raps: "3 sets of 10 reps",
    // exercises: exercises2,
    imageUrl: 'assets/exe/mon3.png',
    exerciseType: ExerciseType.mon,
    color: Colors.purple.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Cable Crossovers',
      raps: "3 sets of 15 reps",
    // exercises: exercises3,
    imageUrl: 'assets/exe/mon4.png',
    exerciseType: ExerciseType.mon,
    color: Colors.red.shade100.withOpacity(0.6),
      onTap: () {print("Cardio");
      }
  ),
  ExerciseSet(
    name: 'Push-Ups',
    // exercises: exercises4,
      raps: "4 sets of 20 reps",
    imageUrl: 'assets/exe/mon5.png',
    exerciseType: ExerciseType.mon,
    color: Colors.pink.shade100.withOpacity(0.6),
      onTap: () {print("Stretching");
      }
  ),
  ExerciseSet(
      name: 'Monday Diet',
      // exercises: exercises4,
      raps: "Breakfast-Lunch-Dinner",
      imageUrl: 'assets/exe/dietbg.png',
      exerciseType: ExerciseType.mon,
      color: Colors.pinkAccent,
      ),
 /////////////////////////////////Tuesday//////////////////////////////////
  ExerciseSet(
    name: 'Shoulders',
      raps: "5",
    // exercises: exercises2,
    imageUrl: 'assets/exe/tue.png',
    exerciseType: ExerciseType.tue,
    color: Colors.yellowAccent.shade100.withOpacity(0.6),
      onTap: () {print("Core");
      }
  ),
  ExerciseSet(
    name: 'Seated dumbbell shoulder press',
      raps: "4 sets of 12 reps",
    // exercises: exercises3,
    imageUrl: 'assets/exe/tue1.png',
    exerciseType: ExerciseType.tue,
    color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Cardio");
      }
  ),
  ExerciseSet(
    name: 'Standing barbell military press',
    // exercises: exercises1,
      raps: "4 sets of 10 -12 reps",
    imageUrl: 'assets/exe/tue2.png',
    exerciseType: ExerciseType.tue,
    color: Colors.purple.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Dumbbell lateral raises',
      raps: "4 sets of 12 reps",
    // exercises: exercises1,
    imageUrl: 'assets/exe/tue3.png',
    exerciseType: ExerciseType.tue,
    color: Colors.blue.shade100.withOpacity(0.6),
      onTap: () {print("Abs");
      }
  ),
  ExerciseSet(
    name: 'Rear deltoid flyes',
    // exercises: exercises2,
      raps: "3 sets of 15 reps",
    imageUrl: 'assets/exe/tue4.png',
    exerciseType: ExerciseType.tue,
    color: Colors.teal.shade100.withOpacity(0.6),
      onTap: () {print("Shoulder");
      }
  ),
  ExerciseSet(
    name: 'EZ bar upright rows',
    // exercises: exercises2,
      raps: "4 sets of 15 reps",
    imageUrl: 'assets/exe/tue5.png',
    exerciseType: ExerciseType.tue,
    color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Acrobatic");
      }
  ),
  ExerciseSet(
    name: 'Dumbbell front raises',
    // exercises: exercises2,
      raps: "4 sets of 12 reps",
    imageUrl: 'assets/exe/tue6.png',
    exerciseType: ExerciseType.tue,
    color: Colors.blue.shade100.withOpacity(0.6),
      onTap: () {print("Hands");
      }
  ),
  ExerciseSet(
    name: 'Tuesday Diet',
    // exercises: exercises4,
    raps: "Breakfast-Lunch-Dinner",
    imageUrl: 'assets/exe/dietbg.png',
    exerciseType: ExerciseType.tue,
    color: Colors.pinkAccent,
  ),

  /////////////////////////////////Wednesday//////////////////////////////////

  ExerciseSet(
    name: 'Legs',
      raps: "Follow the legs Exercises",
    // exercises: exercises4,
    imageUrl: 'assets/exe/wed.png',
    exerciseType: ExerciseType.wed,
    color: Colors.teal.shade100.withOpacity(0.6),
      onTap: () {print("Abs");
      }
  ),
  ExerciseSet(
    name: 'Barbell squats',
      raps: "4 sets of 8 – 10 reps",
    // exercises: exercises1,
    imageUrl: 'assets/exe/wed1.png',
    exerciseType: ExerciseType.wed,
    color: Colors.purple.shade100.withOpacity(0.6),
      onTap: () {print("Core");
      }
  ),
  ExerciseSet(
    name: 'Hack squats',
      raps: "4 sets of 10 reps",
    // exercises: exercises3,
    imageUrl: 'assets/exe/wed2.png',
    exerciseType: ExerciseType.wed,
    color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Leg press machine',
      raps: "3 sets of 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/wed3.png',
      exerciseType: ExerciseType.wed,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Leg extension machine',
      raps: "3 sets of 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/wed4.png',
      exerciseType: ExerciseType.wed,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Hamstring curls',
      raps: "3 sets of 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/wed5.png',
      exerciseType: ExerciseType.wed,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Calf raises',
      raps: "3 sets of 20 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/wed6.png',
      exerciseType: ExerciseType.wed,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Wednesday Diet',
    // exercises: exercises4,
    raps: "Breakfast-Lunch-Dinner",
    imageUrl: 'assets/exe/dietbg.png',
    exerciseType: ExerciseType.wed,
    color: Colors.pinkAccent,
  ),

  /////////////////////////////////Thursday//////////////////////////////////

  ExerciseSet(
      name: 'Back',
      raps: "Follow the Abs and back exercise",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Chin-ups',
      raps: "4 sets of 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu1.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Wide grip lat pull-downs',
      raps: "4 sets of 12 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu2.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Close grip lat pull-downs',
      raps: "4 sets of 12 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu3.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Barbell bent over rows',
      raps: "4 sets of 8 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu4.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Dumbbell rows',
      raps: "4 sets of 8 – 10 reps per arm",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu5.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Hyperextensions',
      raps: "4 sets to failure",
      // exercises: exercises3,
      imageUrl: 'assets/exe/thu6.png',
      exerciseType: ExerciseType.thu,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Thursday Diet',
    // exercises: exercises4,
    raps: "Breakfast-Lunch-Dinner",
    imageUrl: 'assets/exe/dietbg.png',
    exerciseType: ExerciseType.thu,
    color: Colors.pinkAccent,
  ),

  /////////////////////////////////Friday//////////////////////////////////

  ExerciseSet(
      name: 'Arms (biceps, triceps)',
      raps: "Follow all the exercises",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Double arm dumbbell curls',
      raps: "4 sets 10 – 12 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri1.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'EZ bar curls',
      raps: "4 sets 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri2.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Preacher curl machine',
      raps: "4 sets of 12 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri3.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Triceps rope pushdowns',
      raps: "4 sets of 15 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri4.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Overhead triceps rope extensions',
      raps: "4 sets of 15 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri5.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Skull crushers',
      raps: "4 sets of 10 reps",
      // exercises: exercises3,
      imageUrl: 'assets/exe/fri6.png',
      exerciseType: ExerciseType.fri,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Friday Diet',
    // exercises: exercises4,
    raps: "Breakfast-Lunch-Dinner",
    imageUrl: 'assets/exe/dietbg.png',
    exerciseType: ExerciseType.fri,
    color: Colors.pinkAccent,
  ),

  /////////////////////////////////Saturday//////////////////////////////////

  ExerciseSet(
      name: 'Abs',
      raps: "Follow the abs Exercises",
      // exercises: exercises3,
      imageUrl: 'assets/exe/sat.png',
      exerciseType: ExerciseType.sat,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Dumbbell crunch',
      raps: "Reps 10 Rest 10sec",
      // exercises: exercises3,
      imageUrl: 'assets/exe/sat1.png',
      exerciseType: ExerciseType.sat,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Tuck and crunch',
      raps: "Reps 15 Rest 10sec",
      // exercises: exercises3,
      imageUrl: 'assets/exe/sat2.png',
      exerciseType: ExerciseType.sat,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Modified V-sit',
      raps: "Reps 12 Rest 10sec",
      // exercises: exercises3,
      imageUrl: 'assets/exe/sat3.png',
      exerciseType: ExerciseType.sat,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
      name: 'Crunch',
      raps: "Reps 20 Rest 90sec",
      // exercises: exercises3,
      imageUrl: 'assets/exe/sat4.png',
      exerciseType: ExerciseType.sat,
      color: Colors.orange.shade100.withOpacity(0.6),
      onTap: () {print("Yoga");
      }
  ),
  ExerciseSet(
    name: 'Saturday Diet',
    // exercises: exercises4,
    raps: "Breakfast-Lunch-Dinner",
    imageUrl: 'assets/exe/dietbg.png',
    exerciseType: ExerciseType.sat,
    color: Colors.pinkAccent,
  ),
];