import 'package:flutter/material.dart';

void showChooseMakeBottomSheet(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  Color backgroundColor = isDark ? Color(0xFF121212) : Colors.white;
  Color textColor = isDark ? Color(0xFFF3F4F6) : Color(0xFF1F2937);
  Color placeholderColor = isDark ? Color(0xFF6B7280) : Color(0xFF9CA3AF);
  Color primaryColor = Color(0xFFFF5722);
  Color inputBgColor = isDark ? Color(0xFF1F2937) : Color(0xFFF3F4F6);

  List<String> makes = [
    "BAIC",
    "Lynk and Co",
    "LUCID",
    "JMC",
    "ZOTYE",
    "Jetour",
    "Hongqi",
    "TESLA",
    "Daihatsu",
    "Citroen",
    "SEAT",
    "Chery",
    "SsangYong",
    "HAVAL",
    "Subaru",
    "BYD",
    "Alfa Romeo",
    "GEELY"
  ];

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
        height: MediaQuery.of(context).size.height * 0.90,
        child: Column(
          children: [
            
         
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: 28, color: textColor),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                Text(
                  "Choose Make",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Search Box
            Stack(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: inputBgColor,
                    hintText: "Search",
                    hintStyle: TextStyle(color: placeholderColor),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Icon(Icons.search, color: placeholderColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // Scrollable List
            Expanded(
              child: ListView.separated(
                itemCount: makes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {
                      // Handle selection
                      print("Selected: ${makes[index]}");
                    },
                    child: Text(
                      makes[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
