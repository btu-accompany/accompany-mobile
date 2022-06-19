import 'package:accompany/features/suggestions_add/suggestion_add_view_model.dart';
import 'package:flutter/material.dart';

class AddSuggestion extends StatefulWidget {
  AddSuggestion({Key? key}) : super(key: key);

  @override
  State<AddSuggestion> createState() => _AddSuggestionState();
}

class _AddSuggestionState extends SuggestionViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Suggestion/Compliment")),
      body: ListView(
        children: [
          CustomDropDownMenu(topics),
          DetailTextArea(context, suggestionTextController),
          SendButton(context),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  Center SendButton(BuildContext context) {
    final ButtonStyle style = OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15));

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: OutlinedButton(
          style: style,
          onPressed: () {
            sendButtonClicked();
          },
          child: const Text(
            'Send',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding CustomDropDownMenu(List<String> listOfChoices) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
        value: selectedTopic,
        items: listOfChoices
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (item) => {
          setState(
            () {
              selectedTopic = item!;
            },
          ),
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget DetailTextArea(BuildContext context, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: TextField(
      controller: controller,
      minLines: 10,
      maxLines: 12,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(255, 190, 190, 190),
        filled: true,
        hintText: 'Type your compliment/suggestion here.',
      ),
    ),
  );
}
