import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_binding.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool isDark = box.read('isDark') ?? false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(seconds: 1),
      title: 'Lista de palavras em inglês',
      theme: isDark ? Themes().darkTheme:Themes().lightTheme,
      locale: TranslationService.locale,
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      initialBinding: AppBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );

  }
}