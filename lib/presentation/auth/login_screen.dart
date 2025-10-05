import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedVerification = 'WhatsApp'; // Default to WhatsApp
  final TextEditingController _phoneController = TextEditingController();

  Color _getColor({required bool isDark, required String colorKey}) {
    final lightColors = {
      'background': const Color(0xFFFFFFFF),
      'text': const Color(0xFF1F2937),
      'secondary': const Color(0xFFF3F4F6),
      'border': const Color(0xFFE5E7EB),
      'gray500': const Color(0xFF6B7280),
      'gray400': const Color(0xFF9CA3AF),
      'orange600': const Color(0xFFF97316), // Primary orange
      'orange400': const Color(0xFFFBBF24), // Lighter orange for dark mode text
    };
    final darkColors = {
      'background': const Color(0xFF1F2937),
      'text': const Color(0xFFF9FAFB),
      'secondary': const Color(0xFF374151),
      'border': const Color(0xFF4B5563),
      'gray500': const Color(0xFF9CA3AF),
      'gray400': const Color(0xFF6B7280),
      'orange600': const Color(0xFFF97316),
      'orange400': const Color(0xFFFCD34D), // Adjusted for dark mode
    };
    final colors = isDark ? darkColors : lightColors;
    return colors[colorKey] ?? Colors.transparent;
  }

  Widget _buildCountryCodeSelector(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = _getColor(isDark: isDark, colorKey: 'secondary');
    final borderColor = _getColor(isDark: isDark, colorKey: 'border');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final grayColor = _getColor(isDark: isDark, colorKey: 'gray500');

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Flag image - Using a placeholder; in production, use Image.network or asset
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.green, // Placeholder for Saudi flag (green base)
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Icon(Icons.flag, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            '+966',
            style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
          ),
          const SizedBox(width: 4),
          Icon(Icons.arrow_drop_down, color: grayColor, size: 20),
        ],
      ),
    );
  }

  Widget _buildPhoneInput(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor = _getColor(isDark: isDark, colorKey: 'secondary');
    final borderColor = _getColor(isDark: isDark, colorKey: 'border');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final primaryColor = const Color(0xFFF97316);
    final placeholderColor = _getColor(isDark: isDark, colorKey: 'gray400');

    return Expanded(
      child: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          hintText: 'Enter Phone No',
          hintStyle: TextStyle(color: placeholderColor),
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: const BorderSide(color: Color(0xFFF97316), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor),
          ),
          filled: true,
          fillColor: secondaryColor,
        ),
      ),
    );
  }

  Widget _buildVerificationButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final borderColor = _getColor(isDark: isDark, colorKey: 'border');
    final grayColor = _getColor(isDark: isDark, colorKey: 'gray500');
    final primaryColor = const Color(0xFFF97316);
    Color bgColor;
    Color iconColor;
    Color subtitleColor;

    if (isSelected) {
      bgColor = const Color(0xFFFFF7ED); // orange-100
      iconColor = primaryColor;
      subtitleColor = const Color(0xFFF97316); // orange-600
    } else {
      bgColor = _getColor(isDark: isDark, colorKey: 'secondary');
      iconColor = grayColor;
      subtitleColor = textColor;
    }

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: isSelected ? primaryColor : borderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 20, color: iconColor),
                  const SizedBox(width: 8),
                  Text(
                    'Verify via',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = _getColor(isDark: isDark, colorKey: 'background');
    final textColor = _getColor(isDark: isDark, colorKey: 'text');
    final primaryColor = const Color(0xFFF97316);
    final white = Colors.white;
    final gray500 = _getColor(isDark: isDark, colorKey: 'gray500');

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: textColor),
                  onPressed: () {
                    // Handle back
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.support_agent, color: textColor),
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
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your phone number',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We will send you a confirmation code',
                    style: TextStyle(fontSize: 16, color: gray500),
                  ),
                  const SizedBox(height: 32),
                  // Phone input row
                  Row(
                    children: [
                      _buildCountryCodeSelector(context),
                      const SizedBox(width: 8),
                      _buildPhoneInput(context),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Verification options
                  Row(
                    children: [
                      _buildVerificationButton(
                        title: 'WhatsApp',
                        subtitle: 'WhatsApp',
                        icon: Icons.call,
                        isSelected: _selectedVerification == 'WhatsApp',
                        onTap: () =>
                            setState(() => _selectedVerification = 'WhatsApp'),
                        context: context,
                      ),
                      const SizedBox(width: 16),
                      _buildVerificationButton(
                        title: 'SMS',
                        subtitle: 'SMS',
                        icon: Icons.sms,
                        isSelected: _selectedVerification == 'SMS',
                        onTap: () =>
                            setState(() => _selectedVerification = 'SMS'),
                        context: context,
                      ),
                    ],
                  ),
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
                      context.push('/otp_screen');
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
                    child: const Text('Next'),
                  ),
                ),
                const SizedBox(height: 20.0), // h-5 ≈ 20px
              ],
            ),
          ),
          // Progress bar
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Container(
              width: 128,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? textColor : const Color(0xFF000000),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
