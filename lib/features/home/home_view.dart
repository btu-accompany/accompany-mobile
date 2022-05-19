import 'package:accompany/features/home/home_view_model.dart';
import 'package:flutter/material.dart';

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
                  return NewsCard(context, newsList?[index].image ?? "",
                      newsList?[index].description ?? "");
                })
        // ListView(
        //   children: [
        //     NewsCard(
        //       context,
        //       "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
        //       "Here's How Much Major Energy Companies Are Losing By Exiting Russia",
        //     ),
        //     NewsCard(
        //       context,
        //       "https://i.ytimg.com/vi/uGRXf8coPTA/hqdefault.jpg",
        //       "Adam bizi havaya uçurucak, hiç güvenli olmayan bir çalışma şekli",
        //     ),
        //     NewsCard(
        //       context,
        //       "http://1.bp.blogspot.com/-3FSbMIX1ezo/TvREiFQBOQI/AAAAAAAAAy8/ZVWPVy8db-g/s1600/unsafe+act1.png",
        //       "Düşüp kolunu bacagını kırarsa sorumluluk bizde değil",
        //     ),
        //     NewsCard(
        //       context,
        //       "https://thumbs.dreamstime.com/b/wet-floor-square-tile-shadow-rainy-day-slip-clean-water-191075242.jpg",
        //       "Ramak Kala olayı metni",
        //     ),
        //   ],
        // ),
        );
  }

  Container NewsCard(BuildContext context, String newsImage, String newsText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                newsImage,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Text(newsText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
