import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:haat_car/application/locale_provider.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../widgets/button/common_button.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String imagePath = ref.watch(localeProvider).value == Locale("en")
        ? "assets/images/haatcar_logo_en.png"
        : "assets/images/haatcar_logo_ar.png";
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFE5F6FF)],
              stops: [0.59, 1.0],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    imagePath,
                    width: 200 * 3000 / 1680,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter OTP",

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Changa",
                        ),
                      ),
                      SizedBox(height: 25),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width - 85,
                        fieldWidth:
                            (MediaQuery.of(context).size.width - 85) / 7,
                        //style: TextStyle(fontSize: 20),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onChanged: (value) {
                          // ref.read(otpValueProvider.notifier).state = value;
                        },
                        onCompleted: (pin) {
                          // ref.read(otpValueProvider.notifier).state = pin;
                          print("Completed: " + pin);
                        },
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.all(12.0), // px-4 py-3
                        child: Column(
                          children: [
                            CommonButtonWidget(
                              nextPath: '/register_user_screen',
                              textItem: "Verify",
                            ),

                            const SizedBox(height: 20.0), // h-5 ≈ 20px
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
