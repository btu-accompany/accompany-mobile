import 'package:accompany/features/suggestions/suggestions_view.dart';
import 'package:accompany/models/suggestions_model.dart';
import 'package:accompany/services/suggestions_service.dart';
import 'package:flutter/material.dart';

abstract class SuggestionsViewModel extends State<SuggestionsView> {
  List<SuggestionsModel>? _suggestionList;
  bool _isLoading = false;

  List<SuggestionsModel>? get suggestionList {
    return _suggestionList;
  }

  bool get isLoading {
    return _isLoading;
  }

  late final SuggestionService _suggestionService;

  void _toggleIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchSuggestions() async {
    _toggleIsLoading();
    _suggestionList = await _suggestionService.fetchSuggestions();
    _toggleIsLoading();
  }

  @override
  void initState() {
    _suggestionService = SuggestionService();
    fetchSuggestions();
    super.initState();
  }
}
