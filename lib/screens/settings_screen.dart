import 'package:flutter/material.dart';
import 'package:employee_management/l10n/app_localizations.dart';
import 'package:employee_management/providers/locale_provider.dart';
import 'package:employee_management/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) => themeProvider.toggleTheme(value),
          ),
          const Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            subtitle: Text(
              localeProvider.locale.languageCode == 'ar'
                  ? AppLocalizations.of(context)!.arabic
                  : AppLocalizations.of(context)!.english,
            ),
            trailing: const Icon(Icons.language),
            onTap: () {
              final navigatorContext = context;
              localeProvider.toggleLocale();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Language changed. Restarting app...'),
                ),
              );
              Future.delayed(const Duration(seconds: 1), () {
                if (navigatorContext.mounted) {
                  Navigator.of(navigatorContext).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
