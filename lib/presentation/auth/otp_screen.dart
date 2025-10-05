import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    "assets/images/logo.png",
                    width: 200,
                    height: 112.28,
                    fit: BoxFit.contain,
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
                            SizedBox(
                              width: double.infinity,
                              height: 48.0, // h-12
                              child: ElevatedButton(
                                onPressed: () {
                                  context.push('/register_user_screen');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xFFF2740D,
                                  ), 
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      8.0,
                                    ), // rounded-lg
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ), // px-5
                                  minimumSize: const Size(
                                    84.0,
                                    48.0,
                                  ), // min-w-84 h-12
                                  maximumSize: const Size(
                                    480.0,
                                    48.0,
                                  ), // max-w-480
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
