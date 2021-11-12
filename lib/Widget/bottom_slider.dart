// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:lets_walk/Widget/colors.dart';
//
//
// class BottomSlider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       items: [
//         bottomBar("assets/images/distance.png", "$_km Km"),
//         bottomBar("assets/images/burned.png", "$_calories kCal"),
//         bottomBar("assets/images/step.png", "$_stepCountValue Steps")
//       ],
//       options: CarouselOptions(
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         scrollDirection: Axis.horizontal
//       ),
//     );
//   }
//
//   bottomBar(String image, String text) {
//     return Card(
//       color: firstColor,
//       child:
//       Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left:15.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.black,
//               radius: 55,
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 50,
//                 backgroundImage: AssetImage(image),
//               ),
//             ),
//           ),
//           VerticalDivider(
//             width: 60,
//             thickness: 4,
//             color: Colors.black,
//           ),
//           Text(
//             text,
//             textAlign: TextAlign.right,
//             style: new TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }