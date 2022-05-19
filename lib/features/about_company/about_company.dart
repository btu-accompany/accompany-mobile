import 'package:flutter/material.dart';

class AbooutCompany extends StatelessWidget {
  const AbooutCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Company"),),
      body: ListView(
        children: [
          const Padding(
          padding: EdgeInsets.all(20), 
          child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/accompany_logo.png")
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: companyDetail(context),
          ),
        ],
      ),
    );
  }

  Container companyDetail(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width,
      child: const Text(
        """
        Yarım asrı aşan tecrübesi, kurumsal yönetimi, kaliteden taviz vermeyen üretim anlayışı, dinamik ve güçlü yapısı ile Accompany, her geçen gün yatırımlarına hız vererek büyüyor. Ulusal, uluslararası ve bölgesel yatırım gücüyle; ülke ekonomisine ciddi katkı sağlamaya, sanayi üretiminde önemli bir rol oynamaya devam ediyor. 

        Sektörünün ilk AR-GE merkezini açarak yenilikçi ürün yaklaşımını sürdüren Accompany; profesyonel AR-GE ekibi ve yaklaşık 7 kişilik kadrosuyla, 2 departman altında, her türlü güvenlik ihtiyacına uygun ürünler üretiyor.

        Türkiye genelinde yaygın satış ağıyla her noktaya ulaşma ayrıcalığı sunan Accompany aynı zamanda; “Türkiye’nin En Çok Bilinen ve Tercih Edilen Mobil Uygulaması” olma özelliğine de sahip.
        """,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black ),
      ),
    );
  }
}
