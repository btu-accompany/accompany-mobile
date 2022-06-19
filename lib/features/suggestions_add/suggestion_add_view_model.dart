import 'package:accompany/features/suggestions/suggestions_view.dart';
import 'package:accompany/features/tabs/tabs_view.dart';
import 'package:accompany/models/suggestions_model.dart';
import 'package:accompany/services/shared_service.dart';
import 'package:accompany/services/suggestions_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'suggestion_add_view.dart';

abstract class SuggestionViewModel extends State<AddSuggestion> {
  String selectedTopic = "Topic";

  late final SuggestionService _suggestionService;

  @override
  void initState() {
    _suggestionService = SuggestionService();
    super.initState();
  }

  TextEditingController suggestionTextController = TextEditingController();

  List<String> topics = [
    "Topic",
    "General",
    "Office",
    "Foods",
    "Service Routes",
    "Management",
    "Meeting Dates"
  ];

  sendButtonClicked() {
    SuggestionsModel model = SuggestionsModel(
      name: SharedPrefHelper.prefInstance.getString("name"),
      surname: SharedPrefHelper.prefInstance.getString("surname"),
      userDepartment: SharedPrefHelper.prefInstance.getString("departman"),
      phoneNumber: SharedPrefHelper.prefInstance.getString("phoneNumber"),
      content: suggestionTextController.value.text.toString(),
      topic: selectedTopic.toString(),
    );
    print(model.content);
    print(model.topic);
    postSuggestion(model);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AccompanyTabView(),
        ),
        (route) => false);
  }

  postSuggestion(SuggestionsModel model) async {
    bool? result = await _suggestionService.postSuggestions(model);
    if (result != null && result) {
      Fluttertoast.showToast(
          msg: "Suggestion Posted!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
