import 'package:flutter/material.dart';
import 'package:stockoverflow/widgets/show_drawer.dart';
import 'package:stockoverflow/widgets/card_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist,Colors.blue[100]!),
    ShopItem("Tambah Item", Icons.add_shopping_cart,Colors.blue[200]!),
    ShopItem("Logout", Icons.logout,Colors.blue[300]!),
  ];

  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                'WELKAM TO STOCKOVERFLOW BROOOWW',
                ),
                backgroundColor: const Color(0x00000000)
            ),
            drawer: const LeftDrawer(),
            body: SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(10.0), 
                child: Column(
                    children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                        'Stockoverflow', 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((ShopItem item) {
                        return ShopCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ),
            );
    }
}