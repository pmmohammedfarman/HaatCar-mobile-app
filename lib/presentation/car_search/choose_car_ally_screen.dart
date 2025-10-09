import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseCarAllyScreen extends StatelessWidget {
  const ChooseCarAllyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // bg-gray-50
      body: Column(
        children: <Widget>[
          // Header with background
          SizedBox(
            height: 245,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 48,
                    left: 16,
                    right: 16,
                    bottom: 80,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF27121), // primary
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.arrow_back_ios, color: Colors.white),
                      Text(
                        'Car Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                ),

                // Car Card floating
                Positioned(
                  bottom: 0,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(32),
                          child: Image.asset(
                            "assets/images/search/car_one.png", 
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Suzuki Dzire 2025',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'or similar car',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Title + Sort By
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Choose from Allies Below',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.swap_vert,
                            size: 18,
                            color: Colors.grey,
                          ),
                          label: const Text(
                            'Sort By',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ally Offer Card
                  AllyCarWidget(),
                  AllyCarWidget(),
 AllyCarWidget(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllyCarWidget extends StatelessWidget {
  const AllyCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 6),

      child: Card(
        elevation: 2,

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF27121), width: 2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Avatar + Info
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFFF27121),
                                    child: Text(
                                      'A',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Class Ally',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.5 • Excellent',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Price
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    '﷼ 2,580',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF27121),
                                    ),
                                  ),
                                  Text(
                                    '/ month',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFFF27121),
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Riyadh, King Khalid International Airport',

                                  style: TextStyle(
                                    color: Color(0xFFF27121),
                                    fontFamily: 'Changa',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.near_me,
                                size: 18,
                                color: Color(0xFFF27121),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '30.54 km away',
                                style: TextStyle(
                                  color: Color(0xFFF27121),
                                  fontFamily: 'Changa',
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Open Now',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Location + Distance

              // Feature list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.speed,
                      label: 'Allowed Kilometer Per Day',
                      value: '300 km/day',
                    ),
                    _InfoRow(
                      icon: Icons.attach_money,
                      label: 'Extra Kilometer Cost',
                      value: '﷼ 0.4 / km',
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 24,
                                color: Color(0xFFF27121),
                              ),

                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF27121),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.verified,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Full insurance Per Day')),
                          Text(
                            '﷼ 25',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 24,
                                color: Color(0xFFF27121),
                              ),

                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF27121),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.verified,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text('Standard Insurance Deductible'),
                          ),
                          Text(
                            '﷼ 3000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _InfoRow(
                      icon: Icons.check_box,
                      label: 'Tamm Fee',
                      value: 'Available',
                      valueColor: Colors.green,
                    ),
                    _InfoRow(
                      icon: Icons.public,
                      label: 'GCC boarder fee',
                      value: 'Available',
                      valueColor: Colors.green,
                    ),
                    _InfoRow(
                      icon: Icons.pin_drop,
                      label: 'Car return in another branch',
                      value: 'Available',
                      valueColor: Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Divider(),
              // Button
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16.0,
                  top: 8.0,
                  bottom: 16.0,
                ),
                child:
                
                 ElevatedButton(
                  onPressed: () {
                    context.push('/car_item_details_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF27121),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sub-components

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFF27121)),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRowImage extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String value;

  const _InfoRowImage({
    required this.imageUrl,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(imageUrl, height: 18, width: 18, fit: BoxFit.cover),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
