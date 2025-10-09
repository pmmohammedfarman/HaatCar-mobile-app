import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haat_car/presentation/widgets/select_language_bottom_modal_sheet.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    // Colors to match the HTML theme
    const primaryColor = Color(0xFFF97316);
    final cardColor = isDark ? const Color(0xFF374151) : Colors.white;
    final bgColor = isDark ? const Color(0xFF1F2937) : const Color(0xFFF3F4F6);
    final textColor = isDark ? const Color(0xFFF9FAFB) : const Color(0xFF111827);
    final subtextColor = isDark ? const Color(0xFFD1D5DB) : const Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const SizedBox(height: 16),

            // Profile Card (Orange)
            GestureDetector(
              onTap: () => context.push('/user_info_screen'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person_outline, color: Colors.white, size: 40),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Mohammed Pane Mangalore",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Basic Member",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Settings list
            GestureDetector(
              onTap: () => showSelectLanguageMaterialBottomSheet(context),
              child: _MoreItem(
                icon: Icons.settings,
                title: 'Settings',
                subtitle: 'Language',
                cardColor: cardColor,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
            ),
            _MoreItem(
              icon: Icons.directions_car,
              title: 'Carwah',
              subtitle: 'About carwah',
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),
            GestureDetector(
              onTap: () => context.push('/wallet_Screen'),
              child: _MoreItem(
                icon: Icons.account_balance_wallet,
                title: 'Wallet',
                subtitle: 'Jhs 0',
                cardColor: cardColor,
                textColor: textColor,
                subtextColor: subtextColor,
              ),
            ),
            _MoreItem(
              icon: Icons.headset_mic,
              title: 'Help & support',
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),
            _MoreItem(
              icon: Icons.article,
              title: 'Terms and Conditions',
              trailingIcon: Icons.open_in_new,
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),
            _MoreItem(
              icon: Icons.shield,
              title: 'Privacy Policy',
              trailingIcon: Icons.open_in_new,
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),
            _MoreItem(
              icon: Icons.thumb_up,
              title: 'Rate',
              subtitle: 'How to rate Carwah app',
              trailingIcon: Icons.open_in_new,
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),
            _MoreItem(
              icon: Icons.drive_eta,
              title: 'Become an Ally',
              subtitle: 'join now',
              trailingIcon: Icons.open_in_new,
              cardColor: cardColor,
              textColor: textColor,
              subtextColor: subtextColor,
            ),

            const SizedBox(height: 24),

            // Version
            Center(
              child: Text(
                "Version 3.4.1",
                style: TextStyle(
                  color: subtextColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final IconData? trailingIcon;
  final Color cardColor;
  final Color textColor;
  final Color subtextColor;

  const _MoreItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingIcon,
    required this.cardColor,
    required this.textColor,
    required this.subtextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: subtextColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: subtextColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: subtextColor,
                        fontSize: 13,
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
          Icon(
            trailingIcon ?? Icons.chevron_right,
            color: subtextColor,
          ),
        ],
      ),
    );
  }
}
