import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonButtonWidget extends StatelessWidget {
  final String nextPath;
  final String textItem;
  const CommonButtonWidget({
    super.key,
    required this.nextPath,
    required this.textItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: () => context.push(nextPath),

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF2740D), // #f2740d
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // rounded-lg
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // px-5
          minimumSize: const Size(84.0, 48.0), // min-w-84 h-12
          maximumSize: const Size(480.0, 48.0), // max-w-480
          textStyle: const TextStyle(
            fontSize: 16.0, // text-base
            fontWeight: FontWeight.bold,
            letterSpacing: 0.24, // tracking-[0.015em]
            height: 1.25, // leading-normal
          ),
        ),
        child: Text('${textItem}'),
      ),
    );
  }
}
