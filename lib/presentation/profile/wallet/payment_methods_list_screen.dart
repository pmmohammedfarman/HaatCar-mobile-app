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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBT5TtA_BlNisfiAuddV8AxngTsk2ojQESSsN0hLQXl0Ll4QiYkVW2_22cxTH2kQBtGwabBAhY-n_G5B8C_0lRRG71sgpww-054sgYyDmRA8YlK7or0UV0mtj2hnAFdHY1TuSqLq_biO1E2vph-dUYQxnzzuk7pVSNS4DVjj4LmnisJiTkaUFHaQRGCw5im-TtMLM5V3K_yr40PWHelrMNosWhSCbEflK9uyyab-GuQbCMK0mlf0sVK0yovm4vyD6KHZrrb1Z-cyA',
              value: _visaSelected,
              onChanged: (val) => setState(() => _visaSelected = val),
              isDark: isDark,
            ),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'Mastercard ending in 8901',
              subtitle: 'Expires 08/2025',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDkRRgnePoiiI70AN9fx1a0-GsmVd69HHWTG1eBqdCU708bc5dNig-t-vLJLqhcV-Jl9-pxRrecPl7AVZYTigAYFQzYsZdvqhbHUcLOF_hTu_YEEeMsslm96gTxUqENJ3xO6MfBWfA8myQurVUKMdJAJwXE5ImemdzKs4sJzxj0IJzdX-PWygeW0-TSJf1mdPwM1Z_s_O1lUiLs6GUu1qpIPhBlaiptpN0K8cJ08SFI_dFN7CRA7czint2wKIaMEMPxf5XeNgouFQ',
              value: _mastercardSelected,
              onChanged: (val) => setState(() => _mastercardSelected = val),
              isDark: isDark,
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Digital wallets', isDark),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'PayPal',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAwZsaJIfQVjga0oGrPGnrV8HG603aYvLvZOCdZnGrheqyP1WCei61KlUpGXdWYP-zxr8H-oauU2E3717DDphi1xj5roxVVaS6IEt3olBNv4D4XY0d9AdtD-spqg80iOOZrSO9qTDf5tu-j_AiLeTwRqeHjhOFDqaVGieCfVB9qtHELtI31i92pp4VQZFFMngvY6N7T2EuP_X27yu7wDwmcoFEsxwdLHyLcctl1unttn4d3exWJUCZhA5GJVizNXdnLVBGasFIaGQ',
              value: _paypalSelected,
              onChanged: (val) => setState(() => _paypalSelected = val),
              isDark: isDark,
            ),
            const SizedBox(height: 8),
            _buildPaymentCard(
              title: 'Apple Pay',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAogTC8muXzAiCgpqWYdIXYtbkoUftmakdDaIflmxhasZ7x9xos0x4lfFgPSklowOgcECkHJ-3fR63t4rtgksxhtTtDf4EGZ-pEMz8O0zWm6Pyv829xgGFmhhn42HOXtyHEBMSN8-GAzFzSVTKmY_8mnWCUkWr3gVXMLU3ma6MAmRLePE_dRfPZ9nIlI2mvYWKc0fKHOf5usskBjPy4brV-6YKwtXxVPCl-BIZ01zS_sLYskynEkpPBVGa8FRSFwiDtSVWVG-Eu2Q',
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
            Image.network(
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
