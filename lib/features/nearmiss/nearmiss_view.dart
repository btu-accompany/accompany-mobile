import 'package:flutter/material.dart';

class NearMissView extends StatefulWidget {
  NearMissView({Key? key}) : super(key: key);

  @override
  State<NearMissView> createState() => _NearMissViewState();
}

class _NearMissViewState extends State<NearMissView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 50,
                )),
          ),
          NearMissCard(
            context,
            "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
            "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg",
            "Lorem ipsum dolor sit amet, consectetur adipiscing eli",
          ),
          NearMissCard(
            context,
            "https://i.ytimg.com/vi/uGRXf8coPTA/hqdefault.jpg",
            "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg",
            "Adam bizi havaya uçurucak, hiç güvenli olmayan bir çalışma şekli",
          ),
          NearMissCard(
            context,
            "http://1.bp.blogspot.com/-3FSbMIX1ezo/TvREiFQBOQI/AAAAAAAAAy8/ZVWPVy8db-g/s1600/unsafe+act1.png",
            "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg",
            "Düşüp kolunu bacagını kırarsa sorumluluk bizde değil",
          ),
          NearMissCard(
            context,
            "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
            "https://i.pinimg.com/474x/8f/1b/09/8f1b09269d8df868039a5f9db169a772.jpg",
            "Ramak Kala olayı metni",
          ),
        ],
      ),
    );
  }

  Container NearMissCard(BuildContext context, String nearMissImageUrl,
      String ppImageUrl, String nearMissText) {
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
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 50.0,
                    //! NetworkImage içindeki fotograf test amaclidir sonradan değişecek
                    backgroundImage: NetworkImage(ppImageUrl),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
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
