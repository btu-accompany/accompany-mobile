import 'package:accompany/features/suggestions_compliments/suggestion_add_view.dart';
import 'package:flutter/material.dart';

class SuggestionsView extends StatefulWidget {
  SuggestionsView({Key? key}) : super(key: key);

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:  8.0, top: 6.0),
                child: Text("Suggestions and Compliments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Container(
                
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSuggestion(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Card(
        elevation: 2,
        color: Color.fromARGB(255, 211, 211, 211),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 190, 190, 190),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Sabah işe gelme saatleri çok erken. 1 saat ileri alınmalı.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                  Container(
                alignment: Alignment.center,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 190, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Human Resource",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 48, 48, 54),),
                  ),
                ),
              ),
              SizedBox(width: 15,)
               ],
             )
            ],
          ),
        ),
      );
      }),
      ],
      ),
    );
  }
}

