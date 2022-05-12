import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NewsCard(
            context,
            "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
            "Here's How Much Major Energy Companies Are Losing By Exiting Russia",
          ),
          NewsCard(
            context,
            "https://i.ytimg.com/vi/uGRXf8coPTA/hqdefault.jpg",
            "Adam bizi havaya uçurucak, hiç güvenli olmayan bir çalışma şekli",
          ),
          NewsCard(
            context,
            "http://1.bp.blogspot.com/-3FSbMIX1ezo/TvREiFQBOQI/AAAAAAAAAy8/ZVWPVy8db-g/s1600/unsafe+act1.png",
            "Düşüp kolunu bacagını kırarsa sorumluluk bizde değil",
          ),
          NewsCard(
            context,
            "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
            "Ramak Kala olayı metni",
          ),
        ],
      ),
    );
  }

  Container NewsCard(
      BuildContext context, String nearMissImageUrl, String nearMissText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
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
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(nearMissText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
