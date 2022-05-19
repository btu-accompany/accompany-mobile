import 'package:accompany/models/news_model.dart';
import 'package:accompany/services/news_service.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeViewModel extends State<HomeView>{
  List<NewsModel>? _newsList;
  bool _isLoading = false;

  bool get isLoading{
    return _isLoading;
  }

  List<NewsModel>? get newsList{
    return _newsList;
  }

  late final NewsService _newsService;

  void _toggleLoading(){
    _isLoading = !_isLoading;
    setState(() {
      
    });
  }


  fetchNews() async {
    _toggleLoading();
    _newsList = await _newsService.fetchNews();
    _toggleLoading();
  }
  
  @override
  void initState() {
    _newsService = NewsService();
    fetchNews();
    super.initState();
  }



}