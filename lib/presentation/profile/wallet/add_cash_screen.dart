import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCashPage extends StatelessWidget {
  const AddCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFF97306);
    const Color backgroundLight = Color(0xFFF8F7F5);
    const Color backgroundDark = Color(0xFF1A1A1A);
    const Color contentLight = Color(0xFF23180F);
    const Color contentDark = Colors.white;

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: contentLight,
                  ),
                  Expanded(
                    child: Text(
                      "Add Cash to Wallet",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // spacing to balance back button
                ],
              ),
            ),

            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Amount input and quick-add buttons
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Amount input
                        const Text(
                          "Enter Amount",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            TextField(
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "0.00",
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 16,
                              top: 0,
                              bottom: 0,
                              child: Center(
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Quick-add buttons
                        const Text(
                          "Or use a quick-add option:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _quickAddButton(context, "\$10", false, primaryColor),
                            _quickAddButton(context, "\$20", true, primaryColor),
                            _quickAddButton(context, "\$50", false, primaryColor),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Payment method section
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://lh3.googleusercontent.com/aida-public/AB6AXuDDqBCztQLVbvAfzT__OXNWMnmFCJ9Es7O8cHyDVmzI2srOws3ijSBgpcvJFk3MtxQo_uRCjlYiYTq05RcVDTsy9TGp-6HNep4rwB4GBzV7-8AsAQLy-vz5CPmuaK-p0WBvldW7XHsvjKuN8cdUbm5iIo4_a5cbtbMy2SMwrvMZUXiSru9OW7CCD05U31TAVuXuOa6yw1c_4S13bscQoVAOC-7-JgJ4lGfBZ7K0fn_VD1Qwu61i1tPRhOQr2TGMXXDr2IoLSQNbng",
                                    width: 40,
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "**** **** **** 4242",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Mastercard",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push('/payment_methods_screen');
                                },
                                child: const Text(
                                  "Change",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Add cash button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Add \$20.00 to Wallet",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAddButton(
      BuildContext context, String label, bool isActive, Color primaryColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isActive ? primaryColor : Colors.grey.shade300,
            foregroundColor: isActive ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
