import 'package:flutter/material.dart';
import 'package:haat_car/presentation/car_search/car_search_results.dart';

 final carList = [
      {
        'title': 'Suzuki Dzire',
        'subtitle': '2023 or similar car',
        'image':
           "assets/images/search/car_one.png", 
        'price': '73',
      },
      {
        'title': 'Kia Pegas',
        'subtitle': '2022 or similar car',
                'image':
           "assets/images/search/car_two.png", 
        'price': '75',
      },
      {
        'title': 'Nissan Sunny Classic',
        'subtitle': '2022 or similar car',
        'image':
           "assets/images/search/car_three.png", 
        'price': '75',
      },
    ];

class CarSearchByMapScreen extends StatelessWidget {
  const CarSearchByMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/mockup_map_icon.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Positioned(
  left: 0,
  right: 0,
  bottom: MediaQuery.of(context).size.height * 0.325,
  child: SizedBox(
    height: (MediaQuery.of(context).size.width / 4) + 110, 
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: carList.length, // replace with your actual car list
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final car = carList[index];
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CarCardTwo(
            title: car['title'] ?? "",
            subtitle: car["'subtitle'"]?? "",
            imageUrl: car["image"]?? "",
            pricePerDay: car["'price'"]?? "",
          ),
        );
      },
    ),
  ),
)

        ],
      ),
    );
  }
}

class CarCardTwo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String pricePerDay;

  const CarCardTwo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.pricePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Theme.of(context).cardColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16.0),
                  child: Image.asset(
                    imageUrl,
                    height: (MediaQuery.of(context).size.width / 4),
                    width: MediaQuery.of(context).size.width / 3,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).textTheme.bodySmall?.color!.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.settings, size: 18),
                          SizedBox(width: 4),
                          Text('AT'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.directions_car, size: 18),
                          SizedBox(width: 4),
                          Text('Economy'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[100]
                  : Colors.grey[800],
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Available at 7 branches',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2740D),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'SAR $pricePerDay',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          ' / day',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
