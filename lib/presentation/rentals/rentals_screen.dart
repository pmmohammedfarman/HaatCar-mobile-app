import 'package:flutter/material.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFF97316);
    const Color backgroundLight = Color(0xFFF3F4F6);
    const Color backgroundDark = Color(0xFF1F2937);
    const Color textLight = Color(0xFF111827);
    const Color textDark = Color(0xFFF9FAFB);
    const Color cardLight = Colors.white;
    const Color cardDark = Color(0xFF374151);
    const Color secondaryTextLight = Color(0xFF6B7280);
    const Color secondaryTextDark = Color(0xFF9CA3AF);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Rentals",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textLight,
                ),
              ),
            ),

            // Tab buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          foregroundColor: textLight,
                        ),
                        child: const Text("Upcoming"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        child: const Text("Current"),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          foregroundColor: textLight,
                        ),
                        child: const Text("History"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Empty state content
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rental_screen_car_icon.png", 
                        width: 192,
                        height: 192,
                        color: Colors.grey.withOpacity(0.5),
                        colorBlendMode: BlendMode.modulate,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No rentals found",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: textLight,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "You have not submitted car rental requests yet. To find a car go to the search section.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: secondaryTextLight,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "Find a car",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600 , 
                                color:  Colors.white
                                ),
                          ),
                        ),
                      )
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

  Widget _navItem(IconData icon, String label, bool isActive, Color primaryColor,
      Color inactiveColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? primaryColor : inactiveColor),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? primaryColor : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
