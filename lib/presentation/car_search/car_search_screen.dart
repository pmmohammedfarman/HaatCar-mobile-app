import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates and times

class CarwahApp extends StatelessWidget {
  const CarwahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carwah Car Rental',
      theme: ThemeData(
        fontFamily: 'PublicSans',
        brightness: Brightness.light,
        primaryColor: const Color(0xFFF97316),
        scaffoldBackgroundColor: const Color(0xFFF6F7F8),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFE7EDF3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFF97316), width: 2),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'PublicSans',
        scaffoldBackgroundColor: const Color(0xFF101922),
      ),
      home: const CarwahHome(),
    );
  }
}

class CarwahHome extends StatefulWidget {
  const CarwahHome({super.key});

  @override
  State<CarwahHome> createState() => _CarwahHomeState();
}

class _CarwahHomeState extends State<CarwahHome> {
  final _pickupLocationController = TextEditingController();
  final _pickupDateController = TextEditingController(text: "May 28, 2024");
  final _pickupTimeController = TextEditingController(text: "10:00 AM");
  final _dropoffDateController = TextEditingController(text: "May 31, 2024");
  final _dropoffTimeController = TextEditingController(text: "10:00 AM");

  String _vehicleType = 'Any';

  /// Function to pick a date
  Future<void> _pickDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),

      // 👇 Use builder to apply custom theme
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(
                0xFFF97316,
              ), // 🔸 Orange color for header, selected date, etc.
              onPrimary: Colors.white, // Text/icon color on orange
              onSurface: Colors.black, // Default text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(
                  0xFFF97316,
                ), // 🔸 Orange color for "CANCEL"/"OK" buttons
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('MMM dd, yyyy').format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  /// Function to pick a time
  Future<void> _pickTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

      // 👇 Apply custom theme here
      builder: (BuildContext context, Widget? child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? const ColorScheme.dark(
                    primary: Color(
                      0xFFF97316,
                    ), // 🔸 Orange dial & confirm button
                    onPrimary: Colors.white, // Text/icon on orange
                    surface: Color(0xFF18232E), // Background in dark mode
                    onSurface: Colors.white, // Default text color
                  )
                : const ColorScheme.light(
                    primary: Color(0xFFF97316), // 🔸 Orange accent
                    onPrimary: Colors.white, // Text/icon color on orange
                    onSurface: Colors.black, // Default text color
                  ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(
                  0xFFF97316,
                ), // 🔸 Orange for buttons (CANCEL/OK)
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(
        DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );
      setState(() {
        controller.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          /// Top background image with gradient
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.325,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDx-f5m1UWBhQFyQtE3oxECgieR8buQ4w7cZ5XGlOP5d4WX8OerQeB9qQxJfyacMRFpEJedSHTCiK2VbY8kkBNo6ScmT_56u0cpwpdUie7lFFUg2_HOWO7j3yx4--f8nU_RLplO3jR32EJnRU3-kVW8QW3XnQkqeyqno6rCbcxiDFFgrF5v96wbkIwvLP0kOZqDnGQGSDJG0-9ofr9b9jJiIdm81saB0GO16dNLkk9huKDXY_7XODCkzafdq2DaK7bmnQnGoAoUgMXd',
                  ),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(16, 25, 34, 0.8),
                    Color.fromRGBO(16, 25, 34, 0),
                  ],
                  stops: [0.0, 0.5],
                ),
              ),
            ),
          ),

          /// Foreground content
          Column(
            children: [
              const SizedBox(height: 40),

              /// Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: Text(
                        'Find a Car',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const Spacer(),
              
              /// Card content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF18232E)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                          label: 'Pick up location',
                          icon: Icons.location_on,
                          controller: _pickupLocationController,
                          hint: 'Search for a location',
                        ),
                        const SizedBox(height: 10),

                        /// Pick-up date/time
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                label: 'Pick up date',
                                icon: Icons.calendar_today,
                                controller: _pickupDateController,
                                onIconTap: () =>
                                    _pickDate(_pickupDateController),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildTextField(
                                label: 'Time',
                                icon: Icons.schedule,
                                controller: _pickupTimeController,
                                onIconTap: () =>
                                    _pickTime(_pickupTimeController),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        /// Drop-off date/time
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                label: 'Drop off date',
                                icon: Icons.calendar_today,
                                controller: _dropoffDateController,
                                onIconTap: () =>
                                    _pickDate(_dropoffDateController),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildTextField(
                                label: 'Time',
                                icon: Icons.schedule,
                                controller: _dropoffTimeController,
                                onIconTap: () =>
                                    _pickTime(_dropoffTimeController),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        /// Vehicle type dropdown
                        Text(
                          'Vehicle type',
                          style: TextStyle(
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFFA1B1C3)
                                : const Color(0xFF4C739A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        DropdownButtonFormField<String>(
                          value: _vehicleType,
                          borderRadius: BorderRadius.circular(16),
                          dropdownColor: Colors.white,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.directions_car,
                              color: Color(0xFFF97316),
                            ),
                            suffixIcon: const Icon(Icons.expand_more),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            isDense: true,
                          ),
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(value: 'Any', child: Text('Any')),
                            DropdownMenuItem(
                              value: 'Economy',
                              child: Text('Economy'),
                            ),
                            DropdownMenuItem(value: 'SUV', child: Text('SUV')),
                            DropdownMenuItem(
                              value: 'Luxury',
                              child: Text('Luxury'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _vehicleType = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Find Cars button
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF97316),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Find Cars',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? hint,
    VoidCallback? onIconTap,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFFA1B1C3)
                : const Color(0xFF4C739A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          readOnly: onIconTap != null, // prevent manual editing if picker used
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: GestureDetector(
              onTap: onIconTap,
              child: Icon(icon, color: const Color(0xFFF97316)),
            ),
          ),
        ),
      ],
    );
  }
}
