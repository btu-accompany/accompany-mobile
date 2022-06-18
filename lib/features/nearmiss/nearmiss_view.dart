import 'package:accompany/features/nearmiss_add/nearmiss_add_view.dart';
import 'package:flutter/material.dart';

// import 'nearmiss_add_view.dart';
import 'nearmiss_view_model.dart';

class NearMissView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NearMissView({Key? key}) : super(key: key);

  @override
  State<NearMissView> createState() => _NearMissViewState();
}

class _NearMissViewState extends NearMissViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NearMissAddView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 50,
              ),
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : nearMissList?.length == 0
                  ? const Center(
                      child: Text("Eleman Yok"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: nearMissList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        print(nearMissList![index].img.toString());
                        String imgUri = "http://10.0.2.2:3000/" +
                            nearMissList![index]
                                .img
                                .toString()
                                .replaceAll('\\', '/');
                        return NearMissCard(
                          context,
                          imgUri,
                          nearMissList![index].senderName ??
                              "", //! Daha giriş ve kayit olmadıgından böyle
                          nearMissList![index].description!,
                        );
                      })
        ],
      ),
    );
  }

  Container NearMissCard(BuildContext context, String nearMissImageUrl,
      String senderName, String nearMissText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.grey[400],
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                //! burası gerçek resmin url'si olacak
                nearMissImageUrl,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey,
                  width: 50,
                  child: Text(senderName,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey,
                  width: 50,
                  child: Text(nearMissText,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
