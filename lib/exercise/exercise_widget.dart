import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_walk/Widget/colors.dart';
import 'package:lets_walk/exercise/exercise_data/exerxise_set_data.dart';
import 'package:lets_walk/exercise/exercise_model/dataConst.dart';
import 'package:lets_walk/exercise/exercise_set_widget.dart';

class ExercisesWidget extends StatefulWidget {
  @override
  _ExercisesWidgetState createState() => _ExercisesWidgetState();
}

class _ExercisesWidgetState extends State<ExercisesWidget> {
  ExerciseType selectedType = ExerciseType.mon;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 8),
              Text(
                'Exercises & Diets',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              buildSelectDay(),
              // InkWell(
              //   onTap: (){
              //     print("Tap");
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => DietHomePage()),
              //     );
              //   },
              //   // onTap: () => DietHomePage(),
              //   child: Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //       color: secondColor,
              //       borderRadius: BorderRadius.circular(16),
              //     ),
              //     child: Center(child: Text("DIETS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: secondColor,
                borderRadius: BorderRadius.circular(16),
              ),
                height: 50,
               alignment: Alignment.center,
                  child: selectedType == ExerciseType.mon
                      ? Text('CHEST',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                      : selectedType == ExerciseType.tue
                          ? Text('SHOULDERS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                          : selectedType == ExerciseType.wed
                              ? Text('LEGS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                              : selectedType == ExerciseType.thu
                                  ? Text('BACK AND ABS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                                  : selectedType == ExerciseType.fri
                                      ? Text('ARMS(BICEPS & TRICEPS)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22))
                                      : selectedType == ExerciseType.sat
                                          ? Text('ABS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                                          : Text('')),
              SizedBox(height: 8),
              buildWorkouts(),
            ],
          ),
        ),
      );

  Widget buildWorkouts() => GestureDetector(
        onHorizontalDragEnd: swipeFunction,
        child: Column(
          children: exerciseSets
              .where((element) => element.exerciseType == selectedType)
              .map(
                (exerciseSet) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ExerciseSetWidget(
                      exerciseSet: exerciseSet,
                    )),
              )
              .toList(),
        ),
      );

  Widget buildSelectDay() => Row(
        children: ExerciseType.values.map(
          (type) {
            final name = getExerciseName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;

            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: fontWeight, fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
