import 'package:country_code_picker/country_localizations.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'EasyMoney',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.green,
      ),
      supportedLocales: countries,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      initialRoute: Routes.splashRoute,
      getPages: AppPages.routes,
      unknownRoute: AppPages.notFountRoute,
      defaultTransition: Transition.fade,
    );
  }
}
