import 'package:flutter/material.dart';

class AddSuggestion extends StatefulWidget {
  AddSuggestion({Key? key}) : super(key: key);

  @override
  State<AddSuggestion> createState() => _AddSuggestionState();
}

class _AddSuggestionState extends State<AddSuggestion> {
  final List<String> _animals = ["Dog", "Cat", "Crocodile", "Dragon"];

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Suggestion/Compliment")),
      body: ListView(
        children: [
          DropdownMenu(context, "Choose Your Topic", _animals, _selectedColor),
          DropdownMenu(context, "Choose Department", _animals, _selectedColor),
          DetailTextArea(context),
          SendButton(context),
        ],
      ),
    );
  }
}

@override
Widget DropdownMenu(BuildContext context, String Description,
    List<String> _animals, String? _selectedColor) {
  return Center(
    child: Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      width: 350,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 190, 190, 190),
          borderRadius: BorderRadius.circular(2)),
      child: DropdownButton<String>(
        onChanged: (value) {
          setState(() {
            _selectedColor = value;
          });
        },
        value: _selectedColor,
        underline: Container(),
        hint: Center(
            child: Text(
          '$Description',
          style: TextStyle(color: Colors.black),
        )),
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black,
        ),
        isExpanded: true,
        items: _animals
            .map((e) => DropdownMenuItem(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => _animals
            .map((e) => Center(
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
      ),
    ),
  );
}

void setState(Null Function() param0) {}

Widget DetailTextArea(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: TextField(
      minLines: 10,
      maxLines: 12,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 190, 190, 190),
        filled: true,
        hintText: 'Type your compliment/suggestion here.',
      ),
    ),
  );
}

@override
Widget SendButton(BuildContext context) {
  final ButtonStyle style = OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.green,
      padding: EdgeInsets.fromLTRB(25, 15, 25, 15));

  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: OutlinedButton(
        style: style,
        onPressed: () {},
        child: const Text(
          'Send',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
