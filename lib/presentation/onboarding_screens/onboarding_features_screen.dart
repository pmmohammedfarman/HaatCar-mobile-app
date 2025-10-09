import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/button/common_button.dart';
import 'ready_to_go_screen.dart';

class OnboardingFeaturesScreen extends ConsumerWidget {
  const OnboardingFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top section: Header, progress, title, and cards
          Expanded(
            child: SingleChildScrollView(
              // Allow scrolling if content overflows
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ), // p-4 approximation
              child: Column(
                children: [
                  // Header with close button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0), // pb-2
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 48.0, // w-12
                          height: 48.0,
                          child: IconButton(
                            onPressed: () {
                              // Handle close (e.g., Navigator.pop)
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 24.0,
                              color: Color(0xFF181411), // #181411
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero, // p-0
                              minimumSize: Size.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Progress indicators
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0), // py-5
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8.0, // h-2 w-2
                          height: 8.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE6E0DB), // #e6e0db
                          ),
                        ),
                        const SizedBox(width: 12.0), // gap-3
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF181411), // #181411 (filled)
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE6E0DB),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      20.0,
                      16.0,
                      12.0,
                    ), // px-4 (left/right=16px), pt-5 (top=20px), pb-3 (bottom=12px)
                    child: const Text(
                      'Find the perfect car for your trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF181411), // #181411
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.7, // Approximate tracking-light
                        height: 1.0, // leading-tight
                      ),
                    ),
                  ),
                  // Grid of cards
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: _FeatureCard(
                                icon: Icons.directions_car,
                                title: 'Wide selection of cars',
                                description:
                                    'Choose from a variety of vehicles to suit your needs.',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: _FeatureCard(
                                icon: Icons.location_on,
                                title: 'Convenient pickup locations',
                                description:
                                    'Pick up your car at locations near you or at the airport.',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: _FeatureCard(
                                icon: Icons.calendar_today,
                                title: 'Flexible booking options',
                                description:
                                    'Book for a day, a week, or longer, with easy modifications.',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(flex: 1, child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom section: Button and spacer
          Padding(
            padding: const EdgeInsets.all(12.0), // px-4 py-3
            child: Column(
              children: [
                CommonButtonWidget(nextPath: "/onboarding_ready_to_go_screen", 
                textItem: "Next",
                ),
                const SizedBox(height: 20.0), // h-5 ≈ 20px
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // p-4
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E0DB)), // border-[#e6e0db]
        borderRadius: BorderRadius.circular(8.0), // rounded-lg
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            size: 24.0,
            color: const Color(0xFF181411), // #181411
          ),
          const SizedBox(
            height: 12.0,
          ), // gap-3, but adjusted for icon + text gap
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF181411), // #181411
                  fontSize: 16.0, // text-base
                  fontWeight: FontWeight.bold,
                  height: 1.0, // leading-tight
                ),
              ),
              const SizedBox(height: 4.0), // gap-1
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF8A7360), // #8a7360
                  fontSize: 14.0, // text-sm
                  height: 1.25, // leading-normal
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
