import 'package:flutter/material.dart';
import 'package:lets_walk/Diet/Diet_model/weekly_meal.dart';
import 'package:lets_walk/Diet/diet_screens/diet_home_page.dart';
import 'package:lets_walk/Diet/diet_screens/weekly_meal_screen.dart';
import 'package:lets_walk/exercise/exercise_model/dataConst.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({@required this.exerciseSet});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          switch (exerciseSet.name) {
            case 'Monday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1])));
              break;
            case 'Tuesday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1],)));
              break;
            case 'Wednesday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1])));
              break;
            case 'Thursday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1])));
              break;
            case 'Friday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1])));
              break;
            case 'Saturday Diet':
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietHomePage(weekMeal: weeklyMeals[1])));
              break;
            default:
          }
        },
        child: Column(
          children: [
// Text(exerciseSet.title),
            // Container(
            //   child: Expanded(child: Text(exerCiseSetTitle.title)),
            // ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 120,
              decoration: BoxDecoration(
                color: exerciseSet.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Expanded(child: Text(exerCiseSetTitle.title)),
                  Expanded(flex: 3, child: buildText()),
                  Expanded(child: Image.asset(exerciseSet.imageUrl))
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildText() {
    // final exercises = exerciseSet.exercises.length;
    // final minutes = exerciseSet.totalDuration;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            exerciseSet.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(height: 10),
          // Text("ADDDDDDD")
          Text(exerciseSet.raps),
          // Text('$exercises Exercises $minutes Mins'),
        ],
      ),
    );
  }
}
