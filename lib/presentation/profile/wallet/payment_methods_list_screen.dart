import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final Color primaryColor = const Color(0xFFF97316);

  bool _visaSelected = true;
  bool _mastercardSelected = false;
  bool _paypalSelected = false;
  bool _applePaySelected = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1C140D) : const Color(0xFFFCFAF8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: isDark ? Colors.white : const Color(0xFF1C140D),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Payment Methods',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF1C140D),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionTitle('Credit and debit cards', isDark),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'Visa ending in 4567',
              subtitle: 'Expires 03/2026',
             imageUrl:
                  "assets/images/master_card_icon.png", 
                   value: _visaSelected,
              onChanged: (val) => setState(() => _visaSelected = val),
              isDark: isDark,
            ),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'Mastercard ending in 8901',
              subtitle: 'Expires 08/2025',
             imageUrl:
                  "assets/images/master_card_icon.png",   value: _mastercardSelected,
              onChanged: (val) => setState(() => _mastercardSelected = val),
              isDark: isDark,
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Digital wallets', isDark),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'PayPal',
              imageUrl:
                  "assets/images/master_card_icon.png", 
                   value: _paypalSelected,
              onChanged: (val) => setState(() => _paypalSelected = val),
              isDark: isDark,
            ),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'Apple Pay',
              imageUrl:
                  "assets/images/master_card_icon.png", 
              value: _applePaySelected,
              onChanged: (val) => setState(() => _applePaySelected = val),
              isDark: isDark,
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.push('/add_payment_methods_screen');
              },
              child: const Text(
                'Add Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            currentIndex: 2,
            selectedItemColor: primaryColor,
            unselectedItemColor: isDark ? Colors.grey[400] : const Color(0xFF9E6E47),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental), label: 'Rentals'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : const Color(0xFF1C140D),
      ),
    );
  }

  Widget _buildPaymentCard({
    required String title,
    String? subtitle,
    required String imageUrl,
    required bool value,
    required bool isDark,
    required Function(bool) onChanged,
  }) {
    return GestureDetector(
      onTap: () => context.push('/add_cash_screen'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF2A1F16).withOpacity(0.4)
              : const Color(0xFFF4ECE6).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 48,
              height: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1C140D),
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark
                            ? const Color(0xFFE9DACE)
                            : const Color(0xFF9E6E47),
                      ),
                    ),
                ],
              ),
            ),
            IconButton(onPressed: () =>context.push('/edit_payment_methods_screen')
            , icon: 
            Icon(Icons.edit ,
            color: primaryColor,
            size: 18,
             )
            )
           
          ],
        ),
      ),
    );
  }
}
