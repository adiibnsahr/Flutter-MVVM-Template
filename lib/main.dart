/// Entry point aplikasi Flutter.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'config/app_theme.dart';
import 'config/routes.dart';
import 'l10n/app_localizations.dart';
import 'utils/app_logger.dart';
import 'view_models/counter_view_model.dart';
import 'view_models/localization_view_model.dart';
import 'view_models/theme_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLogger.init();
  runApp(const MyApp());
}

/// Kelas utama aplikasi.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => LocalizationViewModel()),
      ],
      child: Consumer2<ThemeViewModel, LocalizationViewModel>(
        builder:
            (context, theme, localization, _) => MaterialApp(
              title: 'Modern MVVM Template',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: theme.themeMode,
              locale: localization.locale,
              supportedLocales: const [Locale('en'), Locale('id')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: Routes.splash,
              onGenerateRoute: Routes.generateRoute,
            ),
      ),
    );
  }
}
