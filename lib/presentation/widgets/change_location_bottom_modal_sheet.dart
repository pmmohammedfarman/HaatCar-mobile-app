import 'package:flutter/material.dart';

void showChooseLocationSheet(BuildContext context) {
   showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
         return const ChooseLocationSheet();
      },
   );
}

/// Location Sheet Widget
class ChooseLocationSheet extends StatelessWidget {
   const ChooseLocationSheet({super.key});

   @override
   Widget build(BuildContext context) {
      final theme = Theme.of(context);
      final isDark = theme.brightness == Brightness.dark;

      final locations = [
         ('Riyadh', Icons.location_city),
         ('King Khalid International Airport', Icons.flight),
         ('King Khalid International Airport-Terminal 5', Icons.flight),
         ('Jeddah', Icons.location_city),
         ('King Abdulaziz International Airport-Terminal 1', Icons.flight),
         ('King Abdulaziz International Airport Northern Terminal', Icons.flight),
         ('Dammam', Icons.location_city),
         ('King Fahd International Airport', Icons.flight),
         ('Al Madinah Al Munawwarah', Icons.location_city),
         ('Prince Mohammed Bin Abdulaziz International Airport', Icons.flight),
         ('Abha', Icons.location_city),
         ('Abha International Airport', Icons.flight),
      ];

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
                              icon: Icon(Icons.close,
                                    color: isDark ? Colors.grey[100] : Colors.grey[900]),
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
                              borderSide: BorderSide(color: Color(0xFFF97316), width: 2)
                          ),
                           hintText: 'Search for city or airport',
                           suffixIcon: const Icon(Icons.my_location,
                                 color: Color(0xFFF97316)),
                        ),
                     ),
                  ),

                  const SizedBox(height: 16),

                  /// Location List
                  Expanded(
                     child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: locations.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                           final (title, icon) = locations[index];
                           final isFlight = icon == Icons.flight;
                           return ListTile(
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
                                    angle: isFlight ? -0.7854 : 0, // -45 degrees for flight
                                    child: Icon(
                                       icon,
                                       color: const Color(0xFFF97316),
                                    ),
                                 ),
                              ),
                              title: Text(
                                 title,
                                 style: TextStyle(
                                    color: isDark ? Colors.grey[100] : Colors.grey[900],
                                 ),
                              ),
                              onTap: () {
                                 Navigator.pop(context, title);
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
                           Icon(Icons.dehaze,
                                 color:
                                       isDark ? Colors.grey[400] : Colors.grey.shade500),
                           Icon(Icons.radio_button_unchecked,
                                 color:
                                       isDark ? Colors.grey[400] : Colors.grey.shade500),
                           Icon(Icons.chevron_left,
                                 color:
                                       isDark ? Colors.grey[400] : Colors.grey.shade500),
                        ],
                     ),
                  ),
               ],
            ),
         ),
      );
   }
}