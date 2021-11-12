import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_walk/Widget/topBar.dart';
import 'package:lets_walk/exercise/exercise_widget.dart';

class ExerCiseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(),
                  CustomScrollView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    slivers: [ExercisesWidget()],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      "CROSS  ",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Colors.white,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      "FITNESS",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Colors.cyanAccent,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
