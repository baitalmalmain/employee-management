import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/screens/home_screen.dart';
import 'package:employee_management/providers/locale_provider.dart';
import 'package:employee_management/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/employee.dart';
import 'models/salary.dart';
import 'models/time_off.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeAdapter());
  Hive.registerAdapter(SalaryAdapter());
  Hive.registerAdapter(TimeOffAdapter());
  await Hive.openBox<Employee>("employees");
  await Hive.openBox<Salary>("salaries");
  await Hive.openBox<TimeOff>("timeOffs");
  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleProvider, ThemeProvider>(
      builder: (context, localeProvider, themeProvider, child) {
        return MaterialApp(
          title: 'Employee Management',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          locale: localeProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', ''), Locale('ar', '')],
          home: const HomeScreen(),
        );
      },
    );
  }
}
