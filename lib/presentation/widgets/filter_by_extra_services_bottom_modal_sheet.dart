import 'package:flutter/material.dart';

void showExtraServicesBottomSheet(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  Color primaryColor = const Color(0xFFF97316);
  Color backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1a202c)
              : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Title and Close
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Extra Services",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // List items
            Expanded(
              child: ListView(
                children: [
                  _serviceItem("Delivery Service"),
                  _serviceItem("Unlimited Kilometers"),
                  _serviceItem("Car return in another branch"),
                  _serviceItem("Child Car seat"),
                  _serviceItem("Tamm Fee"),
                  _serviceItem("GCC boarder fee"),
                  _serviceItem(
                    "Extra driver",
                    trailing: const Icon(Icons.check, color: Colors.orange),
                    isHighlighted: true,
                  ),
                  _serviceItem("Child Car seat"),
                ],
              ),
            ),

            // Apply button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                onPressed: () {},
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _serviceItem(
  String title, {
  Widget? trailing,
  bool isHighlighted = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0), width: 1)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isHighlighted ? Colors.orange : null,
          ),
        ),
        if (trailing != null) trailing,
      ],
    ),
  );
}
