import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_walk/Recipe/recipe_home.dart';
import 'package:lets_walk/exercise/exerxise_home.dart';

import 'stepHomepage.dart';


class WelcomView extends StatefulWidget {
  @override
  _WelcomViewState createState() => _WelcomViewState();
}

class _WelcomViewState extends State<WelcomView> {
  final List levels = [
    // "COUNT YOUR STEP",
    "FOLLOW EXERCISES",
    "SEARCH AN RECIPE"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    //  color: Color(0xFF40D876),
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About You",
                    style: GoogleFonts.lato(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We want to know more about you, follow the next steps\n to complete the information.",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      height: 226,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: levels.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              if (levels[index] == "COUNT YOUR STEP") {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return StepHomePage();
                                    },
                                    )
                                );
                              } else if (levels[index] == "FOLLOW EXERCISES") {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return ExerCiseHome();
                                    },));
                              } else {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return RecipeHome();
                                    },
                                    ));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 226,
                                width: 195,
                                decoration: BoxDecoration(
                                  color: Color(0xFF232441),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tap to",
                                        style: GoogleFonts.lato(
                                          fontSize: 25,
                                        color: Colors.cyanAccent,
                                          //  color: Color(0xFF40D876),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        levels[index],
                                        style: GoogleFonts.lato(
                                          fontSize: 30,
                                          color: Colors.cyanAccent,
                                          //  color: Color(0xFF40D876),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Cross Fitness is here to help",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                      ],
                    ),
                  )
                ],
              ),
            )
    );
  }
}
