import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider =
    StateNotifierProvider<LocaleNotifier, AsyncValue<Locale>>((ref) {
  return LocaleNotifier(ref);
});

class LocaleNotifier extends StateNotifier<AsyncValue<Locale>> {
  final Ref ref;
  LocaleNotifier(this.ref) : super(const AsyncValue.loading()) {
    if (mounted) {
      fetchData();
    }
  }

  void fetchData() async {
    try {
      final _prefs = await SharedPreferences.getInstance();
      final locale = await _prefs.getString("locale") ?? "ar";
      if (locale == "ar") {
        state = AsyncValue.data(Locale("ar"));
      } else {
        state = AsyncValue.data(Locale("en"));
      }

      ;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void updateLocale(String locale) {
    if (locale == "ar") {
      state = AsyncValue.data(Locale("ar"));
      setSharedPreferences("ar");
    } else {
      state = AsyncValue.data(Locale("en"));
      setSharedPreferences("en");
    }
  }

  void setSharedPreferences(String code) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString("locale", code);
  }
}