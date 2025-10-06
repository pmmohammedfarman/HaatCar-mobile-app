import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haat_car/home_screen.dart';
import 'package:haat_car/routes.dart';
import 'application/locale_provider.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10.dart';
import 'presentation/onboarding_screens/onboarding_welcome_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('en'),
      // ref.watch(localeProvider).value ?? Locale('en'),
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      title: '${AppLocalizations.of(context)?.appTitle}',
      routerConfig: router,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF97316)),
        useMaterial3: true,
        fontFamily: 'Changa',
      ),
    );
  }
}
