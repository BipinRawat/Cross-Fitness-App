import 'dart:async';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lets_walk/Widget/colors.dart';
import 'package:lets_walk/Widget/date_utils.dart';
import 'package:lets_walk/Widget/topBar.dart';
import 'package:lets_walk/blocks/home_block.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepHomePage extends StatefulWidget {
  @override
  _StepHomePageState createState() => _StepHomePageState();
}

class _StepHomePageState extends State<StepHomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  HomePageBloc _homePageBloc;
  AnimationController _iconAnimationController;
  bool active = true;
  String showsteps = "";
  String _km = "Walk";
  String _calories = "Burn";

  String _stepCountValue = 'Steps';
  StreamSubscription<int> _subscription;
  bool deleteData;
  double _numerox; //numero pasos
  double _convert;
  double _kmx;
  double burnedx;
  double _porciento;

  // double percent=0.1;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _homePageBloc = HomePageBloc();
    if (active) {
      setState(() {
        setUpPedometer();
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    _homePageBloc.dispose();
    _iconAnimationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      active = true;
      print("Resumed");
    } else if (state == AppLifecycleState.inactive) {
      active = false;
      print("Inactive");
    } else if (state == AppLifecycleState.detached) {
      print("Detached");
    } else if (state == AppLifecycleState.paused) {
      active = false;
      print("Paused");
    }
  }

  //inicia codigo pedometer
  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(int stepCountValue) async {
    // print(stepCountValue);
    setState(() {
      _stepCountValue = "$stepCountValue";
      // print(_stepCountValue);
    });

    var dist = stepCountValue; //we pass the integer to a variable called dist
    double y = (dist + .0); //we convert it to double a form of several

    setState(() {
      _numerox =
          y; //we pass it to a state to be captured and converted to double
    });

    var long3 = (_numerox);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_numerox);

    setState(() {
      _convert = d;
      print(_convert);
    });
  }

  void reset() {
    String km = "0";
    _km = "$km";
    String calories = "0";
    _calories = calories;
    deleteData = true;
    int stepCountValue = 0;
    stepCountValue = 0;
    _stepCountValue = "$stepCountValue";
    setState(() {

    });
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  //function to determine the distance run in kilometers using number of steps
  void getDistanceRun(double _numerox) {
    var distance = ((_numerox * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); //dos decimales
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    //print(distance.runtimeType);
    setState(() {
      _km = "$distance";
      //print(_km);
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  //function to determine the calories burned in kilometers using number of steps
  void getBurnedRun() {
    if (deleteData == true) {
      _calories = "0";
    } else {
      setState(() {
        var calories = _kmx; //dos decimales
        _calories = "$calories";
        //print(_calories);
      });
    }
  }

  //fin codigo pedometer

  @override
  Widget build(BuildContext context) {
    //print(_stepCountValue);
    getBurnedRun();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh_outlined),
          onPressed: () {
            reset();
          },
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              TopBar(),
              Positioned(
                top: 60.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {
                          _homePageBloc.subtractDate();
                        }),
                    StreamBuilder(
                      stream: _homePageBloc.dateStream,
                      initialData: _homePageBloc.selectedDate,
                      builder: (context, snapshot) {
                        return Expanded(
                          child: Column(
                            children: [
                              Text(
                                formatterDayOfWeek.format(snapshot.data),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    letterSpacing: 1.2),
                              ),
                              Text(
                                formatterDate.format(snapshot.data),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  letterSpacing: 1.3,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Transform.rotate(
                      angle: 135.0,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () {
                            _homePageBloc.addDate();
                          }),
                    ),
                  ],
                ),
              )
            ]),
            Divider(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              width: 250,
              //ancho
              height: 250,
              //largo tambien por numero height: 300
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment
                        .bottomCenter, //cambia la iluminacion del degradado
                    end: Alignment.topCenter,
                    colors: [Color(0xFFA9F5F2), Color(0xFF01DFD7)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(27.0),
                    bottomRight: Radius.circular(27.0),
                    topLeft: Radius.circular(27.0),
                    topRight: Radius.circular(27.0),
                  )),
              child: new CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 13.0,
                animation: true,
                center: Container(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.only(left: 40.0),
                        child: Icon(
                          FontAwesomeIcons.walking,
                          size: 40.0,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        //color: Colors.orange,
                        child: Text(
                          '$_stepCountValue',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        // height: 50.0,
                        // width: 50.0,
                      ),
                    ],
                  ),
                ),
                percent: 0.217,
                //percent: _convert,
                footer: new Text(
                  "Steps:  $_stepCountValue",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Colors.black),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: firstColor,
              ),
            ),
            Divider(
              height: 40,
            ),
            SingleChildScrollView(
              child: Container(
                  height: 180,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: [
                      bottomBar("assets/images/distance.png", "$_km Km","Distance"),
                      bottomBar("assets/images/burned.png", "$_calories kCal","Calories"),
                      bottomBar(
                          "assets/images/step.png", "$_stepCountValue Steps","Steps")
                    ],
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal),
                  )),
            )
          ]),
        ),
      ),
    );
  }

  bottomBar(String image, String text,String title) {
    return Card(
      color: firstColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 55,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                ),
                Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 40,
            thickness: 4,
            color: Colors.black,
          ),
          Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.right,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
