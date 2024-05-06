import 'package:delosi_test/app/routes/routes.dart';
import 'package:delosi_test/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = goRouter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IDEGO - Administración de Entregas',
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(0, 67, 101, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(0, 67, 101, 1),
          titleTextStyle: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: const Color.fromRGBO(0, 67, 101, 1).withOpacity(0.5),
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(0, 67, 101, 1),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.5),
              width: 2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Ubuntu-Regular',
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Ubuntu-Regular',
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Ubuntu-Regular',
          ),
        ),
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: TextStyle(
            fontFamily: 'Ubuntu-Regular',
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color.fromRGBO(0, 67, 101, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
