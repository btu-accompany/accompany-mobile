import 'package:flutter/material.dart';

import '../suggestions_add/suggestion_add_view.dart';
import 'suggestions_view_model.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({Key? key}) : super(key: key);

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends SuggestionsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 6.0),
                child: Text("Suggestions and Compliments",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
          isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: suggestionList?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2,
                      color: const Color.fromARGB(255, 211, 211, 211),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            _contentContainer(suggestionList?[index].content),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // _departmanContainer(
                                //     (suggestionList?[index].name ?? "") +
                                //         " " +
                                //         (suggestionList?[index].surname ?? "") +
                                //         "->" +
                                //         (suggestionList?[index]
                                //                 .userDepartment ??
                                //             "")),
                                _departmanContainer(
                                    suggestionList?[index].topic),
                                _departmanContainer(
                                    suggestionList?[index].department),
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

  Container _departmanContainer(String? departman) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          departman ?? "",
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container _contentContainer(String? content) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        content ?? "",
        textAlign: TextAlign.left,
      ),
    );
  }
}
