import 'package:flutter/material.dart';
import 'package:haat_car/presentation/widgets/filter_by_make_bottom_modal_sheet.dart';

import 'filter_by_extra_services_bottom_modal_sheet.dart';

void showFilterBottomSheet(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  Color primaryColor = const Color(0xFFF97316);
  Color backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
  Color cardColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6);
  Color textColor = isDark ? Colors.white : const Color(0xFF111827);
  Color subtextColor = isDark
      ? const Color(0xFF9CA3AF)
      : const Color(0xFF6B7280);
  Color borderColor = isDark
      ? const Color(0xFF374151)
      : const Color(0xFFE5E7EB);

  Widget filterSection(
    String title,
    List<String> options, {
    int selectedIndex = 0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: subtextColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: options.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 48,
          ),
          itemBuilder: (context, index) {
            bool isSelected = index == selectedIndex;
            return Container(
              decoration: BoxDecoration(
                color: isSelected ? primaryColor.withOpacity(0.2) : cardColor,
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? Border.all(color: primaryColor, width: 2)
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                options[index],
                style: TextStyle(
                  color: isSelected ? primaryColor : textColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget navigationButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
          Icon(Icons.chevron_right, color: subtextColor),
        ],
      ),
    );
  }

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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9, // optional max height
        child: Column(
          children: [
            // Fixed header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: textColor),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Clear All",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Scrollable middle
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    filterSection("Body Type", ["All", "Economy"]),
                    const SizedBox(height: 16),
                    filterSection("Transmission", ["All", "Automatic"]),
                    const SizedBox(height: 16),
                    filterSection("Year", ["All", "2026"]),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => showChooseMakeBottomSheet(context),
                      child: navigationButton("Make"),
                    ),
                    navigationButton("Model"),
                    GestureDetector(
                      onTap: () => showExtraServicesBottomSheet(context), 
                      child: navigationButton("Extra Services")),
                    const SizedBox(height: 16),
                    filterSection("Insurance", ["All", "Full"]),
                    const SizedBox(height: 16),
                    filterSection("Daily Price", ["All", "Less than 89"]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Fixed footer button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Show results",
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
