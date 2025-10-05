import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  String? _selectedGender = 'Male';
  bool _termsChecked = true;

  Color _getColor({required bool isDark, required String colorKey}) {
    final lightColors = {
      'background': const Color(0xFFF9FAFB),
      'text': const Color(0xFF111827),
      'muted': const Color(0xFF6B7280),
      'border': const Color(0xFFD1D5DB),
      'gray100': const Color(0xFFF3F4F6),
    };
    final darkColors = {
      'background': const Color(0xFF1F2937),
      'text': const Color(0xFFF9FAFB),
      'muted': const Color(0xFF9CA3AF),
      'border': const Color(0xFF4B5563),
      'gray600': const Color(0xFF4B5563),
    };
    final colors = isDark ? darkColors : lightColors;
    return colors[colorKey] ?? Colors.transparent;
  }

  Widget _buildInputContainer({
    required BuildContext context,
    required String label,
    required Widget child,
    bool isPrimaryBorder = false,
    TextInputType? keyboardType,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = _getColor(isDark: isDark, colorKey: 'background');
    final mutedColor = _getColor(isDark: isDark, colorKey: 'muted');
    final primaryColor = const Color(0xFF4F46E5);
    final borderColor = isPrimaryBorder
        ? primaryColor
        : _getColor(isDark: isDark, colorKey: 'border');

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: borderColor, width: 1),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    TextInputType? keyboardType,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = _getColor(isDark: isDark, colorKey: 'text');

    return TextField(
      keyboardType: keyboardType,
      style: TextStyle(color: textColor),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
      ),
    );
  }

  Widget _buildGenderSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final grayBg = _getColor(
      isDark: isDark,
      colorKey: isDark ? 'gray600' : 'gray100',
    );
    final primaryColor = const Color(0xFF4F46E5);
    final orangeColor = const Color(0xFFF97316); // Tailwind orange-500
    final white = Colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GENDER*',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _getColor(isDark: isDark, colorKey: 'muted'),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _selectedGender = 'Male'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: _selectedGender == 'Male'
                      ? orangeColor
                      : null,
                  foregroundColor: _selectedGender == 'Male'
                      ? white
                      : textColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  side: _selectedGender == 'Male'
                      ? BorderSide.none
                      : BorderSide(
                          color: _getColor(isDark: isDark, colorKey: 'border'),
                        ),
                ),
                child: Text(
                  'Male',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: _selectedGender == 'Male' ? white : textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _selectedGender = 'Female'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: _selectedGender == 'Female'
                      ? orangeColor
                      : grayBg,
                  foregroundColor: _selectedGender == 'Female'
                      ? white
                      : textColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  side: _selectedGender == 'Female'
                      ? BorderSide.none
                      : BorderSide(
                          color: _getColor(isDark: isDark, colorKey: 'border'),
                        ),
                ),
                child: Text(
                  'Female',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: _selectedGender == 'Female' ? white : textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mutedColor = _getColor(isDark: isDark, colorKey: 'muted');
    final primaryColor = const Color(0xFF4F46E5);
    final orangeColor = const Color(0xFFF97316);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _termsChecked,
          onChanged: (value) => setState(() => _termsChecked = value ?? false),
          activeColor: orangeColor,
          checkColor: Colors.white,

          // side: MaterialStateBorderSide.resolveWith(
          //   (states) => BorderSide(
          //     color: _getColor(isDark: isDark, colorKey: 'border'),
          //     width: 2,
          //   ),
          // ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: mutedColor),
              children: [
                const TextSpan(text: 'I understand and agree to '),
                TextSpan(
                  text: 'terms & conditions',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle terms tap
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'privacy policy',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle privacy tap
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = _getColor(isDark: isDark, colorKey: 'background');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final primaryColor = const Color(0xFF4F46E5);
    final orangeColor = const Color(0xFFF97316);
    final white = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: textColor),
                  onPressed: () {
                    // Handle back
                  },
                ),
                Expanded(
                  child: Text(
                    'Enter your personal details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.headset, color: textColor),
                  onPressed: () {
                    // Handle support
                  },
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // First Name
                  _buildInputContainer(
                    context: context,
                    label: 'First Name*',
                    isPrimaryBorder: true,
                    child: _buildTextField(context: context),
                  ),
                  const SizedBox(height: 24),
                  // Middle and Last Name
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputContainer(
                          context: context,
                          label: 'Middle Name',
                          child: _buildTextField(context: context),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildInputContainer(
                          context: context,
                          label: 'Last Name*',
                          child: _buildTextField(context: context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Email
                  _buildInputContainer(
                    context: context,
                    label: 'Email*',
                    keyboardType: TextInputType.emailAddress,
                    child: _buildTextField(
                      context: context,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Company Name
                  _buildInputContainer(
                    context: context,
                    label: 'Company Name',
                    child: _buildTextField(context: context),
                  ),
                  const SizedBox(height: 24),
                  // Gender
                  _buildGenderSection(context),
                  const SizedBox(height: 24),
                  // Terms
                  _buildTermsSection(context),
                ],
              ),
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.all(12.0), // px-4 py-3
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48.0, // h-12
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/my_home_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2740D), // #f2740d
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // rounded-lg
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ), // px-5
                      minimumSize: const Size(84.0, 48.0), // min-w-84 h-12
                      maximumSize: const Size(480.0, 48.0), // max-w-480
                      textStyle: const TextStyle(
                        fontSize: 16.0, // text-base
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.24, // tracking-[0.015em]
                        height: 1.25, // leading-normal
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 20.0), // h-5 ≈ 20px
              ],
            ),
          ),
        ],
      ),
    );
  }
}
