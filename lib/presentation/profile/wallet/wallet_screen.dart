import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final Color primaryColor = const Color(0xFFF97316);

  void _showTopUpModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1F2937)
          : Colors.grey[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Up Wallet',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 8),
              _buildCardTile(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAxxgCL1nt1VPxF2bZZlnedfGOInwxB9A-tzpG8_i6KY7woi8kp0U7YJjLLCUa4nlaPy7DjUeusFt-s0x-ylL_L8Lm_or2h0TvKR7ay1qnIhi9Zp6zbjQFIAELhIdnVJIt8ijr5W_Fb94gvN414cLavDEcxmfl2U45YkdodGtseyK4NJH7Y4kSKjv0pLi2BLTSMyJLU__3fVDxzbv7YfjoNsftWJptYv45OC3uI7tlQ459m9DWBJbpyAeRZrFpSRlguthMSz6R5RQ',
                title: 'Visa ending in 4567',
              ),
              const SizedBox(height: 8),
              _buildCardTile(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAxxgCL1nt1VPxF2bZZlnedfGOInwxB9A-tzpG8_i6KY7woi8kp0U7YJjLLCUa4nlaPy7DjUeusFt-s0x-ylL_L8Lm_or2h0TvKR7ay1qnIhi9Zp6zbjQFIAELhIdnVJIt8ijr5W_Fb94gvN414cLavDEcxmfl2U45YkdodGtseyK4NJH7Y4kSKjv0pLi2BLTSMyJLU__3fVDxzbv7YfjoNsftWJptYv45OC3uI7tlQ459m9DWBJbpyAeRZrFpSRlguthMSz6R5RQ',
                title: 'Mastercard ending in 1234',
              ),
              const SizedBox(height: 16),
              ListTile(
                onTap: _showAddCardModal,
                leading: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add, color: primaryColor),
                ),
                title: Text(
                  'Add Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).hintColor),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddCardModal() {
    Navigator.pop(context); // Close top up modal first
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1F2937)
          : Colors.grey[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Add New Card',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                _buildTextField('Card Number', '**** **** **** ****'),
                _buildTextField('Card Holder Name', 'John Doe'),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('Expiry Date', 'MM/YY'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTextField('CVV', '***'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Add Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildCardTile({required String imageUrl, required String title}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[700]
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.grey[50],
      appBar: AppBar(
        title: const Text('Wallet'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1F2937)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  if (Theme.of(context).brightness == Brightness.light)
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Current Wallet Amount',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$50.00',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => context.push('/payment_methods_screen'),
                    child: const Text(
                      'Top Up Wallet',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

           
          
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: 'Rentals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
