import 'package:flutter/material.dart';
import 'package:bee/models/restaurnat.dart';
import 'package:bee/services/api_services.dart';
import 'package:bee/widgets/Restaurant_Card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<restaurant> restaurants = [];

  // Future<void> loadresturants() async {
  //   restaurants = await ApiService.getRestaurant();
  //
  //   setState(() {});
  // }
  Future<void> loadresturants() async {
    restaurants = [
      restaurant(
        name: "Pizza Palace",
        address: "Main Street 12",
        phone: 123456789,
        ImageUrl: "https://picsum.photos/200",
        rate: 5,
        meals: [],
      ),
      restaurant(
        name: "Burger Town",
        address: "Downtown",
        phone: 987654321,
        ImageUrl: "https://picsum.photos/201",
        rate: 4,
        meals: [],
      ),
      restaurant(
        name: "Sushi Box",
        address: "River Road",
        phone: 555222111,
        ImageUrl: "https://picsum.photos/202",
        rate: 5,
        meals: [],
      ),
    ];

    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    loadresturants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurants",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange.shade700,
        elevation: 0,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Color(0xFFFFF3E0),
            ],
          ),
        ),

        child:Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25, //quarter of the screen
              child: meals.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              )
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: meals.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final m = meals[index];
                  return MealCard(m: m);
                },
              ),
            ),

            //spacer
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 1.5,
                color: Colors.orange,
              ),
            ),








            Expanded(
              child: restaurants.isEmpty
                ? const Center(
              child: CircularProgressIndicator(color: Colors.orange),
                        )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ResturantCard(
                    r: restaurants[index],
                  ),
                );
              },
                        ),
            ),
        ]),
      ),
    );
  }
}
