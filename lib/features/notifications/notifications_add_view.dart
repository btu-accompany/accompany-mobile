// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddNotification extends StatefulWidget {
//   const AddNotification({Key key}) : super(key: key);

//   @override
//   State<AddNotification> createState() => _AddNotification();
// }

// class _AddNotification extends State<AddNotification> {

//   String _chosenValue;

// @override
//  Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.white,
//     body: Center(
//       child: Container(
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               focusColor: Colors.black,
//               value: _chosenValue,
//               elevation: 5,
//               style: TextStyle(color: Colors.white),
//               iconEnabledColor: Colors.black,
//               items: <String>[
//                 'Android',
//                 'IOS',
//                 'Flutter',
//                 'Node',
//                 'Java',
//                 'Python',
//                 'PHP',
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(
//                     value,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               }).toList(),
//               hint: Text(
//                 "Please choose a langauage",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//               // onChanged: (String value) {
//               //   setState(() {
//               //     _chosenValue = value;
//               //   });
//               // },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }

