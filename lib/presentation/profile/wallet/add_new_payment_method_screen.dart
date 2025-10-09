import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPaymentMethodPage extends StatelessWidget {
  const AddPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define colors similar to Tailwind config
    const Color primaryColor = Color(0xFFF97306);
    const Color backgroundLight = Color(0xFFF8F7F5);
    const Color contentLight = Color(0xFF23180F);
    const Color subtleLight = Color(0xFF9E6E47);
    const Color surfaceLight = Color(0xFFF4ECE6);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: contentLight,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Add Payment Method",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // To balance the back button space
                ],
              ),
            ),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      label: 'Card Number',
                      hint: 'Card Number',
                      surfaceLight: surfaceLight,
                      subtleLight: subtleLight,
                      contentLight: contentLight,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      label: 'Card Holder Name',
                      hint: 'Card Holder Name',
                      surfaceLight: surfaceLight,
                      subtleLight: subtleLight,
                      contentLight: contentLight,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            label: 'CVV',
                            hint: 'CVV',
                            surfaceLight: surfaceLight,
                            subtleLight: subtleLight,
                            contentLight: contentLight,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            label: 'Expiry Date',
                            hint: 'Expiry Date',
                            surfaceLight: surfaceLight,
                            subtleLight: subtleLight,
                            contentLight: contentLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              color: backgroundLight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: ElevatedButton(
                      onPressed: () {
                         context.push('/add_cash_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Add Card",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: surfaceLight),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.home, "Home", subtleLight, false),
                        _buildNavItem(Icons.directions_car, "Rentals", subtleLight, false),
                        _buildNavItem(Icons.account_balance_wallet, "Wallet", primaryColor, true),
                        _buildNavItem(Icons.person, "Profile", subtleLight, false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField
  Widget _buildTextField({
    required String label,
    required String hint,
    required Color surfaceLight,
    required Color subtleLight,
    required Color contentLight,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: subtleLight),
        filled: true,
        fillColor: surfaceLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.orange.shade600, width: 2),
        ),
      ),
      style: TextStyle(color: contentLight),
    );
  }

  // Reusable bottom nav item
  Widget _buildNavItem(IconData icon, String label, Color color, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
