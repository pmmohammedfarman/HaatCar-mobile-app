import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // For bottom navigation

  Color _getColor({
    required bool isDark,
    required String colorKey,
  }) {
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
          
        },
        trailing:  Icon(
            icon,
            color: primaryColor,
            size: 32,
          ),
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
            style: TextStyle(
              fontSize: 12,
              color: subtextColor,
            ),
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

    return Container(
      width: 128,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
       
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: primaryColor,
            size: 48,
          ),
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
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuBe7j7LVFzWDJfNIfAK_f_836-cu9wyFKpQ3DnaYnbSkvKR7tGmPimsTA9vWH4ipIaj5d4Q34bkVPXyhJ2FJMv0VI5ajU_Pi-nj1orchFE2nRj4XzJAJyIJSaGum1I4-d7ya4HQcfg4sjtIUssrl11Bc1VfNKU_jr6Xvfxg9gk85mZq3Fk_npmGzEesxBH5dayX9jBpmkqArhr-b6yRi0cOnX9VPYxnZc5r6pL58om5QztYdlyJ_VNeOWtudH_GMg21BrfGvNr7hKQ",

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
                  Container(
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
                          type: 'Van',
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: primaryColor,
        unselectedItemColor: subtextColor,
        backgroundColor: cardColor,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Rentals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}