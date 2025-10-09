import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../application/locale_provider.dart';

class ChooseLanguagePage extends ConsumerWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFE5F6FF)],
              stops: [0.59, 1.0],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/haatcar_logo_en.png',
                      width: 300,
                      height: 168.42,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome To",
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF006D5B),
                            ),
                          ),
                          TextSpan(
                            text: " HAAT",
                            style: TextStyle(
                              fontFamily:
                                  'Changa', // Ensure you have the Changa font in your pubspec.yaml
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              height: 46 / 25, // Line height based on font size
                              color: Color(
                                0xFFF2740D,
                              ), // Green color for "Haat"
                            ),
                          ),
                          TextSpan(
                            text: "CAR",
                            style: TextStyle(
                              fontFamily:
                                  'Changa', // Ensure you have the Changa font in your pubspec.yaml
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              height: 46 / 25, // Line height based on font size
                              color: Color(0xFF006D5B), // Blue color for "Sign"
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    languageContainer("عربي", context, ref),
                    languageContainer("English", context, ref),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextButton languageContainer(
  String language,
  BuildContext context,
  WidgetRef ref,
) => TextButton(
  onPressed: () async {
    final _prefs = await SharedPreferences.getInstance();
    final code_en = 'en';
    final code_ar = 'ar';
    final choose_language_date_time = DateTime.now().toString();
    if (language == "English") {
      ref.read(localeProvider.notifier).updateLocale(code_en);
      context.push('/onboarding_welcome_screen');
    } else if (language == "عربي") {
      ref.read(localeProvider.notifier).updateLocale(code_ar);
      context.push('/onboarding_welcome_screen');
    }
  },
  child: SizedBox(
    height: 40,
    width: MediaQuery.of(context).size.width / 3,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFF2740D), // Background color
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: Center(
        child: Text(
          language,
          style: TextStyle(
            fontFamily: 'Changa', // Font family
            fontStyle: FontStyle.normal, // Font style
            fontWeight: FontWeight.w600, // Font weight
            fontSize: 14, // Font size
            height: 24 / 12, // Line height (24px / 12px font size)
            color: Colors.white,
          ),
        ),
      ),
    ),
  ),
);
