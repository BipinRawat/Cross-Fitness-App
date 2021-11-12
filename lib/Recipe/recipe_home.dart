import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lets_walk/Recipe/recipe_view.dart';
import 'package:lets_walk/Widget/topBar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/recipe_model.dart';

class RecipeHome extends StatefulWidget {
  @override
  _RecipeHomeState createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  List<RecipeModel> recipies = new List();
  String ingridients;
  bool _loading = false;
  String query = "";
  TextEditingController textEditingController = new TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xff213A50), const Color(0xff071930)],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft)),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              TopBar(),
              Positioned(
                top: 80.0,
                left: 30.0,
                right: 0.0,
                child: Text(
                  "WHAT WILL YOU COOK TODAY",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                "Just Enter Ingredients you have and we will show the best recipe for you"
                    .toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'OverpassRegular'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Form(
                      key: _form,
                      child: TextFormField(
                        validator: (text) {
                          if (text.isEmpty) {
                            return "Please Enter An Ingredients";
                          }
                          return null;
                        },
                        controller: textEditingController,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Overpass'),
                        decoration: InputDecoration(
                          hintText: "Enter Ingridients (ex. Apple, Mango)",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'Overpass'),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () async {
                        _saveForm();
                        if (textEditingController.text.isNotEmpty) {
                          setState(() {
                            _loading = true;
                          });
                          recipies = new List();
                          String url =
                              "https://api.edamam.com/search?q=${textEditingController.text}&app_id=0f21d949&app_key=8bcdd93683d1186ba0555cb95e64ab26";
                          var response = await http.get(url);
                          print(" $response this is response");
                          Map<String, dynamic> jsonData =
                              jsonDecode(response.body);
                          print("this is json Data $jsonData");
                          jsonData["hits"].forEach((element) {
                            print(element.toString());
                            RecipeModel recipeModel = new RecipeModel();
                            recipeModel =
                                RecipeModel.fromMap(element['recipe']);
                            recipies.add(recipeModel);
                            print(recipeModel.url);
                          });
                          setState(() {
                            _loading = false;
                          });

                          print("doing it");
                        } else {
                          print("not doing it");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xffA2834D),
                                  const Color(0xffBC9A5F)
                                ],
                                begin: FractionalOffset.topRight,
                                end: FractionalOffset.bottomLeft)),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.search, size: 20, color: Colors.white),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: .0,
                  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //     mainAxisSpacing: 10.0,
                  //     maxCrossAxisExtent: 200.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: List.generate(recipies.length, (index) {
                    return GridTile(
                        child: RecipieTile(
                      title: recipies[index].label,
                      imgUrl: recipies[index].image,
                      desc: recipies[index].source,
                      url: recipies[index].url,
                    ));
                  })),
            ),
            //   ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    ]));
  }
}

class RecipieTile extends StatefulWidget {
  final String title, desc, imgUrl, url;

  RecipieTile({this.title, this.desc, this.imgUrl, this.url});

  @override
  _RecipieTileState createState() => _RecipieTileState();
}

class _RecipieTileState extends State<RecipieTile> {
  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              _launchURL(widget.url);
            } else {
              print(widget.url + " this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeView(
                            postUrl: widget.url,
                          )));
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: 300,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Overpass'),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                              fontFamily: 'OverpassRegular'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GradientCard extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;
  final String topColorCode;
  final String bottomColorCode;

  GradientCard(
      {this.topColor,
      this.bottomColor,
      this.topColorCode,
      this.bottomColorCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [topColor, bottomColor],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                ),
                Container(
                  width: 180,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          topColorCode,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          bottomColorCode,
                          style: TextStyle(fontSize: 16, color: bottomColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
