import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haat_car/presentation/widgets/choose_airport_bottom_modal_sheet.dart';
import '../car_search/car_search_screen.dart';
import '../profile/user_profile_screem.dart';
import '../rentals/rentals_screen.dart';
import '../widgets/change_location_bottom_modal_sheet.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final Color primaryColor = const Color(0xFFF97316);
  final Color subtextColor = const Color(0xFF4C739A);
  final Color cardColor = Colors.white;

  // 👇 Define your screens here
  final List<Widget> _screens = [
    const HomeScreen(),
    const CarwahApp(), // Search/Find Car Screen
    const RentalsScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // 👈 Displays selected screen dynamically

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: primaryColor,
        unselectedItemColor: subtextColor,
        backgroundColor: cardColor,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.key), label: 'Rentals'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // For bottom navigation

  Color _getColor({required bool isDark, required String colorKey}) {
    final lightColors = {
      'background': const Color(0xFFF3F4F6),
      'card': const Color(0xFFFFFFFF),
      'text': const Color(0xFF111827),
      'subtext': const Color(0xFF6B7280),
      'primary': const Color(0xFFF97316),
    };
    final darkColors = {
      'background': const Color(0xFF1F2937),
      'card': const Color(0xFF374151),
      'text': const Color(0xFFF9FAFB),
      'subtext': const Color(0xFFD1D5DB),
      'primary': const Color(0xFFF97316),
    };
    final colors = isDark ? darkColors : lightColors;
    return colors[colorKey] ?? Colors.transparent;
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required BuildContext context,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = _getColor(isDark: isDark, colorKey: 'card');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final subtextColor = _getColor(isDark: isDark, colorKey: 'subtext');
    final primaryColor = _getColor(isDark: isDark, colorKey: 'primary');

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          if (title == 'Airports') {
            showChooseAirportSheet(context);
          } else if (title == 'Pick-up') {
            context.push("/car_search_results");
          } else if (title == 'Instant') {
            context.push("/car_search_results");
          }
        },
        trailing: Icon(icon, color: primaryColor, size: 32),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: textColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: subtextColor),
        ),
      ),
    );
  }

  Widget _buildVehicleTypeCard({
    required IconData icon,
    required String type,
    required BuildContext context,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = _getColor(isDark: isDark, colorKey: 'card');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final primaryColor = _getColor(isDark: isDark, colorKey: 'primary');

    return GestureDetector(
      onTap: () => context.push("/car_search_results"),
      child: Container(
        width: 128,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: primaryColor, size: 48),
            const SizedBox(height: 8),
            Text(
              type,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = _getColor(isDark: isDark, colorKey: 'background');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final subtextColor = _getColor(isDark: isDark, colorKey: 'subtext');
    final primaryColor = _getColor(isDark: isDark, colorKey: 'primary');
    final cardColor = _getColor(isDark: isDark, colorKey: 'card');
    final theme2 = Theme.of(context);
    final isDark2 = theme2.brightness == Brightness.dark;

    final backgroundColor2 = isDark
        ? const Color(0xFF1F2937)
        : const Color(0xFFF3F4F6);
    final cardColor2 = isDark ? const Color(0xFF374151) : Colors.white;
    final textColor2 = isDark
        ? const Color(0xFFF9FAFB)
        : const Color(0xFF111827);
    final subTextColor2 = isDark
        ? const Color(0xFF9CA3AF)
        : const Color(0xFF6B7280);
    const primaryColor2 = Color(0xFFF59E0B); // Orange
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const SizedBox(height: 24),
                  Text(
                    'Hello, Guest',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Promotional Banner
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFFD54F), // amber-400
                          Color(0xFF00BCD4), // cyan-500
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text(
                            'Rental Future',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Every present has a future and the future of rental is Carwah',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          // Image placeholder - Replace with actual Image.network or asset
                          Container(
                            width: double.infinity,
                            height: 225,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/home/main_placeholder.png",
                                ),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                repeat: ImageRepeat.noRepeat,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Feature Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,

                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                    children: [
                      _buildFeatureCard(
                        title: 'Pick-up',
                        subtitle: 'from branch',
                        icon: Icons.storefront,
                        context: context,
                      ),
                      _buildFeatureCard(
                        title: 'Express',
                        subtitle: 'Delivery',
                        icon: Icons.local_shipping,
                        context: context,
                      ),
                      _buildFeatureCard(
                        title: 'Instant',
                        subtitle: 'Confirmation',
                        icon: Icons.schedule,
                        context: context,
                      ),
                      _buildFeatureCard(
                        title: 'Airports',
                        subtitle: '24 hour',
                        icon: Icons.flight,
                        context: context,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Offers Section
                  GestureDetector
                  (
                    onTap: () =>  context.push("/car_search_results"),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Offers & Rental Packages',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Designed to meet your needs',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: subtextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: primaryColor,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Search by Vehicle Type
                  Text(
                    'Search By Vehicle Type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildVehicleTypeCard(
                          icon: Icons.directions_car,
                          type: 'Economy',
                          context: context,
                        ),
                        const SizedBox(width: 12),
                        _buildVehicleTypeCard(
                          icon: Icons.directions_car,
                          type: 'Sedan',
                          context: context,
                        ),
                        const SizedBox(width: 12),
                        _buildVehicleTypeCard(
                          icon: Icons.electric_car,
                          type: 'SUV',
                          context: context,
                        ),
                        const SizedBox(width: 12),
                        _buildVehicleTypeCard(
                          icon: Icons.local_shipping, // Placeholder for Van
                          type: 'Commercial',
                          context: context,
                        ),
                        const SizedBox(width: 12),
                        _buildVehicleTypeCard(
                          icon:
                              Icons.electric_car_rounded, // Placeholder for Van
                          type: 'Luxury',
                          context: context,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    'Search By Service',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1,
                    children: [
                      _cardWrapper(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.map, color: primaryColor2),
                            SizedBox(height: 8),
                            Text(
                              "Unlimited Kilometers",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        cardColor2,
                      ),
                      _cardWrapper(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on, color: primaryColor2),
                            SizedBox(height: 8),
                            Text(
                              "Car return in another branch",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        cardColor2,
                      ),

                      _buildAddOnCard(
                        context,
                        icon: Icons.directions_car,
                        badgeIcon: Icons.verified,
                        title: 'Full Insurance',
                        iconColor: primaryColor,
                        badgeColor: primaryColor,
                        hasBadge: true,
                        badgePosition: Alignment.topRight,
                        badgeSize: 24,
                      ),

                      _cardWrapper(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.child_care, color: primaryColor2),
                            SizedBox(height: 8),
                            Text(
                              'Child Car seat',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        cardColor2,
                      ),

                      _cardWrapper(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.public, color: primaryColor2),
                            SizedBox(height: 8),
                            Text(
                              'GCC border fee',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        cardColor2,
                      ),
                      _buildAddOnCard(
                        context,
                        icon: Icons.directions_car,
                        badgeIcon: Icons.add_circle,
                        title: 'Extra driver',
                        iconColor: isDark
                            ? const Color(0xFFD1D5DB)
                            : const Color(0xFF374151),
                        badgeColor: primaryColor,
                        hasBadge: true,
                        badgePosition: Alignment.topRight,
                        badgeSize: 20,
                        badgeBackground: isDark
                            ? const Color(0xFF1F2937)
                            : Colors.white,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Coupon Section
                  Text(
                    "Do you have a coupon?",
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: cardColor2,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Add coupon here',
                              hintStyle: TextStyle(color: subTextColor2),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor2,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "APPLY",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search By Map",
                        style: theme2.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme2.colorScheme.onBackground,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showChooseLocationSheet(context),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "Riyadh",
                                style: TextStyle(color: subTextColor2),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Stack(
                    children: [
                      Container(
                        height: 225,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              // color: Colors.black.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/home/map_image.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {}, // Placeholder
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'View on Map',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWrapper(Widget child, Color cardColor) {
    return GestureDetector(
      onTap: () => context.push("/car_search_results"),
      child: Container(
        
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        padding: const EdgeInsets.all(12),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildAddOnCard(
    BuildContext context, {
    required IconData icon,
    IconData? badgeIcon,
    required String title,
    required Color iconColor,
    Color? badgeColor,
    bool hasBadge = false,
    Alignment badgePosition = Alignment.topRight,
    double badgeSize = 24,
    Color? badgeBackground,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final textColor = isDark
        ? const Color(0xFFF3F4F6)
        : const Color(0xFF1F2937);

    return GestureDetector(
      onTap: () => context.push("/car_search_results"),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            borderRadius: BorderRadius.circular(
              12,
            ), // 1rem ~ 16px, but adjusted for card
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: badgePosition,
                  children: [
                    Icon(icon, size: 48, color: iconColor),
                    if (hasBadge)
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: badgeBackground ?? cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          badgeIcon,
                          size: badgeSize,
                          color: badgeColor ?? iconColor,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12, // text-sm
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class CarRentalHome extends StatelessWidget {
  const CarRentalHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme2 = Theme.of(context);
    final isDark = theme2.brightness == Brightness.dark;

    final backgroundColor2 = isDark
        ? const Color(0xFF1F2937)
        : const Color(0xFFF3F4F6);
    final cardColor2 = isDark ? const Color(0xFF374151) : Colors.white;
    final textColor2 = isDark
        ? const Color(0xFFF9FAFB)
        : const Color(0xFF111827);
    final subTextColor2 = isDark
        ? const Color(0xFF9CA3AF)
        : const Color(0xFF6B7280);
    const primaryColor2 = Color(0xFFF59E0B); // Orange

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offers & Rental Packages",
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: textColor2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Designed to meet your needs",
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 13,
                        color: subTextColor2,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primaryColor2.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.calendar_today,
                    size: 32,
                    color: primaryColor2,
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 24),
      
            // Vehicle Type Section
            Text(
              "Search By Vehicle Type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor2,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              children: [
                vehicleTypeCard(
                  "SUV",
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuC_Ga6dcu0b...",
                ),
                vehicleTypeCard(
                  "Luxury",
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuB9l3fmItB4w...",
                ),
                vehicleTypeCard(
                  "Commercial",
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuBcZV6h4e1lD...",
                ),
              ].map((widget) => _cardWrapper(widget, cardColor2)).toList(),
            ),
      
            const SizedBox(height: 24),
      
         
            
          ],
        ),
      ),
      // Bottom Navigation
      
    );
  }

  Widget vehicleTypeCard(String title, String imgUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imgUrl, height: 48, fit: BoxFit.contain),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _cardWrapper(Widget child, Color cardColor) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(12),
      child: Center(child: child),
    );
  }
}
*/
