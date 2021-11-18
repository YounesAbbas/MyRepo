
import 'utils/app_colors.dart';
import 'screens/form_page.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(BuzzKillApp());

class BuzzKillApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    localizationsDelegates: [
      // 1
      S.delegate,
      // 2
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    theme: ThemeData(
      primarySwatch: AppColors.black,
      accentColor: AppColors.red,
      buttonColor: AppColors.red,
    ),
    home: FormPage(),

  );
}
