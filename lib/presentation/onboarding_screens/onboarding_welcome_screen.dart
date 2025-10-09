import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:haat_car/presentation/onboarding_screens/onboarding_features_screen.dart';

class OnboardingWelcomeScreen extends ConsumerWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top section: Image container and title
          SizedBox(height: 35.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ), // Approximate px-4
              child: Column(
                children: [
                  // Image container (min-h-80 ≈ 320px, but flexible for screen)
                  Container(
                    width: double.infinity,
                    height: 320.0, // min-h-80 in Tailwind is 20rem (320px)
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/onboarding/welcome_image.png'
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // pt-5 ≈ 20px
                  const Text(
                    'Your journey starts here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF181411), // #181411
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Changa",
                      letterSpacing:
                          -0.7, // Approximate tracking-light (-0.025em at 28px)
                      height: 1.0, // leading-tight
                    ),
                  ),
                  const SizedBox(height: 12.0), // pb-3 ≈ 12px
                ],
              ),
            ),
          ),
          // Bottom section: Button and spacer
          Padding(
            padding: const EdgeInsets.all(12.0), // py-3 px-4
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48.0, // h-12
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/onboarding_features_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2740D), // #f2740d
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // rounded-lg
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ), // px-5
                      minimumSize: const Size(84.0, 48.0), // min-w-84 h-12
                      maximumSize: const Size(480.0, 48.0), // max-w-480
                      textStyle: const TextStyle(
                        fontSize: 16.0, // text-base
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.24, // tracking-[0.015em]
                        height: 1.25, // leading-normal
                      ),
                    ),
                    child: const Text('Next'),
                  ),
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
