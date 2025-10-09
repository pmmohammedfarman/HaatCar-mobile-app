import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../application/locale_provider.dart';

void showSelectLanguageMaterialBottomSheet(BuildContext context) {
  showMaterialModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const SelectLanguageMaterialBottomSheet(),
  );
}

class SelectLanguageMaterialBottomSheet extends ConsumerWidget {
  const SelectLanguageMaterialBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Wrap(
          children: [
            Column(
              children: [
                ListTile(
                  title: RadioMenuButton(
                    value: Locale("en"),
                    groupValue: ref.watch(localeProvider).value,
                    onChanged: (value) {
                      ref.read(localeProvider.notifier).updateLocale("en");
                      context.pop();
                    },
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: const Text("English")),
                  ),
                ),
                ListTile(
                  title: RadioMenuButton(
                    value: Locale("ar"),
                    groupValue: ref.watch(localeProvider).value,
                    onChanged: (value) {
                      ref.read(localeProvider.notifier).updateLocale("ar");
                      context.pop();
                     
                    },
                    child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: const Text("العربية")),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}