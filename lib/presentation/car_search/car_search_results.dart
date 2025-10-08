import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/filter_bottom_modal_sheet.dart';
import 'car_search_by_map_screen.dart';

class CarSearchResults extends StatelessWidget {
  const CarSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final cars = [
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

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width, // Keep width full
            55, // Reduced from 100—adjust as needed (e.g., 50-70 for compact)
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ), // Reduced vertical padding from 16 to 8
            color: Theme.of(context).cardColor,
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures Column takes minimal height
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search by make or model',
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[200]
                        : Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, // Keep horizontal for usability
                      vertical: 8, // Reduced from 12 for compactness
                    ),
                    isDense:
                        true, // Optional: Makes TextField more compact overall
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "05 Oct, 08 Oct, Riyadh",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF3F4F6)
          : const Color(0xFF1F2937),
      body: SafeArea(
        child: Stack(
          children: [
            // Header
            // Car List
            Positioned.fill(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CarCard(
                      title: car['title']!,
                      subtitle: car['subtitle']!,
                      imageUrl: car['image']!,
                      pricePerDay: car['price']!,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF2740D),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          showFilterBottomSheet(context);
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Filter',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          context.push('/car_search_via_map_screen');
                        },
                        icon: const Icon(Icons.map, color: Colors.white),
                        label: const Text(
                          'Map',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String pricePerDay;

  const CarCard({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodySmall?.color!.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 12),
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
    );
  }
}
