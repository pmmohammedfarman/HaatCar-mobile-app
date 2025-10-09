import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/button/common_button.dart';

class OnboardingReadyToGoScreen extends ConsumerWidget {
  const OnboardingReadyToGoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top section: Image and texts
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ), // Approximate px-4 for image
              child: Column(
                children: [
                  // Image container (min-h-80 ≈ 320px, but flexible for screen)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ), // Approximate py-3
                    child: Container(
                      width: double.infinity,
                      height: 320.0, // min-h-80 in Tailwind is 20rem (320px)
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // @[480px]:rounded-lg
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/onboarding/ready_to_go_image.png',
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          repeat: ImageRepeat.noRepeat,
                        ),
                      ),
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      20.0,
                      16.0,
                      12.0,
                    ), // px-4 pt-5 pb-3
                    child: const Text(
                      'Start your journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF181411), // #181411
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing:
                            -0.7, // Approximate tracking-light (-0.025em at 28px)
                        height: 1.0, // leading-tight
                      ),
                    ),
                  ),
                  // Paragraph
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      4.0,
                      16.0,
                      12.0,
                    ), // px-4 pt-1 pb-3
                    child: const Text(
                      'Find the perfect car for your next adventure and hit the road with ease.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF181411), // #181411
                        fontSize: 16.0, // text-base
                        fontWeight: FontWeight.normal,
                        height: 1.25, // leading-normal
                      ),
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
                CommonButtonWidget(
                  nextPath: '/login_screen',
                  textItem: "Get Started",
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
