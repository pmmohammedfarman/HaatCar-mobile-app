import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Airport {
  final String name;
  final String location;

  Airport({required this.name, required this.location});
}

final List<Airport> airportsList = [
  Airport(name: 'King Khalid International Airport', location: 'Riyadh'),
  Airport(
    name: 'King Khalid International Airport-Terminal 5',
    location: 'Riyadh',
  ),
  Airport(
    name: 'King Abdulaziz International Airport-Terminal 1',
    location: 'Jeddah',
  ),
  Airport(
    name: 'King Abdulaziz International Airport Northern Terminal',
    location: 'Jeddah',
  ),
  Airport(name: 'King Fahd International Airport', location: 'Dammam'),
  Airport(
    name: 'Prince Mohammed Bin Abdulaziz International Airport',
    location: 'Al Madinah Al Munawwarah',
  ),
  Airport(name: 'Abha International Airport', location: 'Abha'),
  Airport(
    name: 'Prince Nayef Bin Abdulaziz International Airport',
    location: 'Buraydah',
  ),
  Airport(name: 'Taif International Airport', location: 'At Taif'),
  Airport(name: 'Hail International Airport', location: 'Hail'),
  Airport(
    name: 'Prince Abdul Majeed bin Abdulaziz International Airport',
    location: 'Al Ula',
  ),
  Airport(name: 'NEOM Bay Domestic airport', location: 'Neom'),
  Airport(name: 'Prince Sultan bin Abdulaziz Airport', location: 'Tabuk'),
  Airport(name: 'Al-Baha Domestic Airport', location: 'Al Baha'),
  Airport(
    name: 'Prince Abdul Mohsin Bin Abdulaziz international airport',
    location: 'Yanbu',
  ),
  Airport(
    name: 'King Abdullah bin Abdulaziz International Airport',
    location: 'Jazan',
  ),
  Airport(
    name: 'Wadi al-Dawasir Domestic Airport',
    location: 'Wadi ad-Dawasir',
  ),
  Airport(name: 'Sharurah Domestic Airport', location: 'Sharurah'),
  Airport(name: 'AlQaisumah Airport', location: 'Hafar AlBatin'),
];

void showChooseAirportSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return ChooseAirportBottomModalSheet();
    },
  );
}

/// Location Sheet Widget
class ChooseAirportBottomModalSheet extends StatelessWidget {
  ChooseAirportBottomModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: isDark ? Colors.grey[100] : Colors.grey[900],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Choose location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.grey[100] : Colors.grey[900],
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            /// Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xFFF97316), width: 2),
                  ),
                  hintText: 'Search for city or airport',
                  suffixIcon: const Icon(
                    Icons.my_location,
                    color: Color(0xFFF97316),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Location List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: airportsList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                  height: 4,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.orange.shade900.withOpacity(0.3)
                            : Colors.orange.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Transform.rotate(
                        angle: -0.7854,
                        child: Icon(
                          Icons.flight,
                          color: const Color(0xFFF97316),
                        ),
                      ),
                    ),
                    title: Text(
                      airportsList[index].name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      airportsList[index].location,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      context.push("/car_search_results");
                    },
                  );
                },
              ),
            ),

            /// Footer Icons
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? const Color(0xFF374151)
                        : const Color(0xFFE5E7EB),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.dehaze,
                    color: isDark ? Colors.grey[400] : Colors.grey.shade500,
                  ),
                  Icon(
                    Icons.radio_button_unchecked,
                    color: isDark ? Colors.grey[400] : Colors.grey.shade500,
                  ),
                  Icon(
                    Icons.chevron_left,
                    color: isDark ? Colors.grey[400] : Colors.grey.shade500,
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
