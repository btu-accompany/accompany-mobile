import 'package:accompany/features/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';

class HomeView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: newsList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      width: MediaQuery.of(context).size.width*0.8,
                      child: FlutterSlimyCard(
                        bottomCardHeight:
                          MediaQuery.of(context).size.height * 0.35,
                        color: Colors.blue,
                        topCardWidget: topCardWidget((newsList?[index].name ?? ""),
                            newsList?[index].image ?? ""),
                        bottomCardWidget:
                            bottomCardWidget(newsList?[index].description ?? ""),
                      ),
                    ),
                  );
                }));
  }

  Widget topCardWidget(String newsTitle, String newsImage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(          
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(         
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit:  BoxFit.fill ,
                image: NetworkImage(

                  newsImage,
                  // height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            newsTitle,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget bottomCardWidget(String newsDescription) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, //.horizontal
      child: Text(
        newsDescription,
        softWrap: true,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
