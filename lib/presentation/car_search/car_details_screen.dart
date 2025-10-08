import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CarItemDetailsScreen extends StatelessWidget {
  const CarItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental',
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: ThemeMode.system,
      home: const CarDetailsPage(),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    const primaryColor = Color(0xFFF59E0B);
    const neutral100 = Color(0xFFF3F4F6);
    const neutral700 = Color(0xFF374151);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Image and Actions
              Stack(
                children: [
                  Image.asset(
                    "assets/images/car.png", 
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: _circleButton(Icons.arrow_back),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: _circleButton(Icons.share),
                  ),
                ],
              ),

              // Main Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tesla Model 3',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'or similar • Electric Car',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '\$75',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('/ day'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Rating
                    Row(
                      children: [
                        const Text(
                          'Hertz',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.star, color: primaryColor, size: 16),
                        const SizedBox(width: 4),
                        Text('4.8 (52)', style: TextStyle(color: primaryColor)),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Specs Grid
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: const [
                        _SpecCard(icon: Icons.electric_car, title: 'Electric'),
                        _SpecCard(icon: Icons.group, title: '5 Seats'),
                        _SpecCard(
                          icon: Icons.speed,
                          title: '250 mi',
                          subtitle: 'range',
                        ),
                        _SpecCard(
                          icon: Icons.bolt,
                          title: 'Auto',
                          subtitle: 'transmission',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Conditions
                    _sectionHeader(
                      'Ally Conditions',
                      trailing: Icons.arrow_forward_ios,
                    ),

                    const SizedBox(height: 24),

                    // Rental Packages
                    const Text(
                      'Rental Packages Offered',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      childAspectRatio: 1.45,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        _PackageCard(
                          title: 'Custom',
                          price: '\$80/day',
                          note: 'Installment available',
                        ),
                        _PackageCard(
                          title: '1 Day',
                          price: '\$75/day',
                          note: 'Installment vailable',
                          isPrimary: true,
                        ),
                        _PackageCard(
                          title: '1 Week',
                          price: '\$70/day',
                          note: 'Installment available',
                        ),
                        _PackageCard(
                          title: '1 Month',
                          price: '\$65/day',
                          note: 'Installment not available',
                        ),
                        _PackageCard(
                          title: '3 Months',
                          price: '\$60/day',
                          note: 'Installment not available',
                        ),
                        _PackageCard(
                          title: '6 Months',
                          price: '\$55/day',
                          note: 'Installment available',
                        ),
                        _PackageCard(
                          title: '9 Months',
                          price: '\$50/day',
                          note: 'Installment available',
                        ),
                        _PackageCard(
                          title: '1 Year',
                          price: '\$45/day',
                          note: 'Installment available',
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Working Hours
                    _sectionHeader(
                      'Working Hours',
                      trailingText: 'Open now',
                      trailingColor: Colors.green,
                    ),
                    const SizedBox(height: 8),
                    _infoCard(
                      title: 'Today Wednesday',
                      subtitle: '09:00 - 19:00',
                      trailing: Icons.arrow_forward_ios,
                    ),

                    const SizedBox(height: 24),

                    // Branch Location
                    const Text(
                      'Branch Location',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _locationCard(),
                    const SizedBox(height: 24),
                    CarReturnInAnotherBranchWidget(),
                    const SizedBox(height: 24),
                    ExtraServicesWidget(), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Book Now',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _sectionHeader(
    String title, {
    IconData? trailing,
    String? trailingText,
    Color? trailingColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        if (trailing != null)
          Icon(trailing)
        else if (trailingText != null)
          Text(
            trailingText,
            style: TextStyle(color: trailingColor ?? Colors.grey),
          ),
      ],
    );
  }

  Widget _infoCard({
    required String title,
    required String subtitle,
    IconData? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              Text(subtitle, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          if (trailing != null) Icon(trailing, size: 16),
        ],
      ),
    );
  }

  Widget _locationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Color(0xFFF59E0B)),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JFK Airport',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Terminal 4, New York',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'View Map',
            style: TextStyle(
              color: Color(0xFFF59E0B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _SpecCard({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF374151)
            : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFF59E0B), size: 32),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          if (subtitle != null)
            Text(
              subtitle!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
        ],
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final String note;
  final bool isPrimary;

  const _PackageCard({
    required this.title,
    required this.price,
    required this.note,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isPrimary
        ? const Color(0xFFF59E0B)
        : Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF374151)
        : const Color(0xFFF3F4F6);

    final Color textColor = isPrimary ? Colors.white : Colors.black;
    final Color subTextColor = isPrimary ? Colors.white70 : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    color: isPrimary ? Colors.white : const Color(0xFFF59E0B),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
          Visibility(
            visible: (note == 'Installment available'),
            child: Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                width: 85,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      note,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Changa',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CarReturnInAnotherBranchWidget extends StatelessWidget {
  const CarReturnInAnotherBranchWidget({super.key});

 

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Custom colors
    const primaryColor = Color(0xFFF97316);
    const bgLight = Color(0xFFF8FAFC);
    const bgDark = Color(0xFF1E293B);
    const cardLight = Color(0xFFFFFFFF);
    const cardDark = Color(0xFF334155);
    const textLight = Color(0xFF334155);
    const textDark = Color(0xFFE2E8F0);
    const textSecondary = Color(0xFF94A3B8);
    const borderLight = Color(0xFFE2E8F0);
    const borderDark = Color(0xFF475569);

    return 
       Container(
         width: double.infinity,
         constraints: const BoxConstraints(maxWidth: 400),
         padding: const EdgeInsets.all(24),
         decoration: BoxDecoration(
           color: isDark ? cardDark : cardLight,
           borderRadius: BorderRadius.circular(24),
           boxShadow: [
             BoxShadow(
               color: Colors.black.withOpacity(0.1),
               blurRadius: 12,
               offset: const Offset(0, 6),
             ),
           ],
         ),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             // Title & Toggle
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 // Text Block
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Car return in another branch',
                       style: GoogleFonts.changa(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: isDark ? textDark : textLight,
                       ),
                     ),
                     const SizedBox(height: 4),
                     RichText(
                       text: TextSpan(
                         style: GoogleFonts.changa(
                           fontSize: 14,
                           color: textSecondary,
                         ),
                         children: const [
                           TextSpan(text: 'Service fee '),
                           TextSpan(
                             text: 'SAR 450',
                             style: TextStyle(
                               color: primaryColor,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
             
                 // Toggle (dummy UI only)
                 Switch(
                   value: true,
                   onChanged: (_) {},
                   activeColor: primaryColor,
                 )
               ],
             ),
             
             const SizedBox(height: 20),
             
             // Divider
             Divider(
               color: isDark ? borderDark : borderLight,
               thickness: 1,
             ),
             
             const SizedBox(height: 16),
             
             // Return City/Branch
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Return city/branch',
                   style: GoogleFonts.changa(
                     fontSize: 13,
                     color: textSecondary,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 const SizedBox(height: 8),
                 InkWell(
                   onTap: () {
                     // Handle branch selection
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Rabigh, Al Samad',
                         style: GoogleFonts.changa(
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                           color: isDark ? textDark : textLight,
                         ),
                       ),
                       Icon(Icons.chevron_right, color: textSecondary),
                     ],
                   ),
                 ),
               ],
             ),
           ],
         ),
       )
    ;
  }
}


class ExtraServicesWidget extends StatefulWidget {
  const ExtraServicesWidget({super.key});

  @override
  State<ExtraServicesWidget> createState() => _ExtraServicesWidgetState();
}

class _ExtraServicesWidgetState extends State<ExtraServicesWidget> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Tailwind-based color scheme
    const Color primaryColor = Color(0xFFF97316);
    const Color backgroundLight = Color(0xFFF3F4F6);
    const Color backgroundDark = Color(0xFF111827);
    const Color cardLight = Color(0xFFFFFFFF);
    const Color cardDark = Color(0xFF1F2937);
    const Color textLightPrimary = Color(0xFF111827);
    const Color textDarkPrimary = Color(0xFFF9FAFB);
    const Color textLightSecondary = Color(0xFF6B7280);
    const Color textDarkSecondary = Color(0xFF9CA3AF);
    const Color toggleInactiveLight = Color(0xFFE5E7EB);
    const Color toggleInactiveDark = Color(0xFF4B5563);
    return Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? cardDark : cardLight,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unlimited Kilometers',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? textDarkPrimary : textLightPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: isDark ? textDarkSecondary : textLightSecondary,
                          ),
                          children: const [
                            TextSpan(
                              text: 'SAR 40',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            TextSpan(text: ' / day'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Custom Toggle Switch
                _CustomSwitch(
                  value: isSwitched,
                  onChanged: (val) {
                    setState(() {
                      isSwitched = val;
                    });
                  },
                  activeColor: primaryColor,
                  inactiveColor: isDark ? toggleInactiveDark : toggleInactiveLight,
                ),
              ],
            ),
          );
  }
}

class _CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const _CustomSwitch({
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 52,
        height: 32,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: value ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(34),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
