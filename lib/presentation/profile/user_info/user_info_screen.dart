import 'dart:ui';

import 'package:flutter/material.dart';



class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Color background = isDark ? const Color(0xFF1a202c) : const Color(0xFFF7FAFC);
    Color foreground = isDark ? const Color(0xFFF7FAFC) : const Color(0xFF1a202c);
    Color subtle = isDark ? const Color(0xFFA0AEC0) : const Color(0xFF718096);
    Color border = isDark ? const Color(0xFF4a5568) : const Color(0xFFE2E8F0);

    InputDecoration inputDecoration(String hint) {
      return InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: background,
        hintStyle: TextStyle(color: subtle),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFF97316), width: 2),
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // 🧭 Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: background.withOpacity(0.8),
                // backdropFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: foreground),
                  ),
                  Expanded(
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: foreground,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // 🧍 Scrollable body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Avatar section
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 128,
                            height: 128,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/user_profile/edit_profile/user_profile_pic.png", 
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF97316),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Omar Al-Farsi',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: foreground,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Member since 2021',
                            style: TextStyle(color: subtle),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 📝 Basic Data
                    _buildSectionTitle('Basic Data', foreground),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        children: [
                          _buildTextField('Name', 'Omar Al-Farsi', inputDecoration),
                          _buildTextField('Email', 'omar.alfarsi@email.com', inputDecoration),
                          _buildTextField('Phone', '+968 9999 9999', inputDecoration),
                          Text(
          "Gender", 
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        
        SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              value: gender,
                              decoration: inputDecoration('Gender'),
                              items: const [
                                DropdownMenuItem(value: 'Male', child: Text('Male')),
                                DropdownMenuItem(value: 'Female', child: Text('Female')),
                              ],
                              onChanged: (v) => setState(() => gender = v!),
                            ),
                          ),
                          _buildTextField('Status', 'Active', inputDecoration),
                          _buildTextField('Company Name', 'Al Farsi Enterprises', inputDecoration),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🪪 Identity Section
                    _buildSectionTitle('Identity', foreground),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        children: [
                          _buildTextField('Gulf National ID', '123456789', inputDecoration),
                          _buildTextField('Passport Expiry Date', '2028-12-31', inputDecoration),
                          _buildTextField('Date of Birth', '1990-05-15', inputDecoration),
                          _buildTextField('Driver\'s License Number', '987654321', inputDecoration),
                          _buildTextField('Nationality', 'Omani', inputDecoration),
                          _buildTextField('Driver\'s License Expiry Date', '2025-10-20', inputDecoration),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🖼 Images section
                    _buildSectionTitle('Images', foreground),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          _buildImageCard(
                            'Driver\'s License',
                           "assets/images/user_profile/edit_profile/user_drivers_license_image.png"
                          ),
                          const SizedBox(height: 12),
                          _buildImageCard(
                            'Driver\'s License with Selfie',
                            "assets/images/user_profile/edit_profile/user_drivers_license_image_with_Selfie.png"
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 📌 Footer Save Button
      bottomNavigationBar: Container(
        color: background.withOpacity(0.9),
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF97316),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: const Text(
            'Save Changes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String value,
    InputDecoration Function(String) decoration,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Changa", 
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: TextField(
            decoration: decoration(label),
            controller: TextEditingController(text: value),
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard(String label, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
