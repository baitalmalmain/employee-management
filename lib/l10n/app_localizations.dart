import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Employee Management'**
  String get appTitle;

  /// Label for the settings screen and menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label for the dark mode toggle switch
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Label for the language selection option
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Name of the English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Name of the Arabic language option
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// Label for the add employee action
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get addEmployee;

  /// Label for the employee name field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Label for the employee ID field
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// Label for the employee email field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for the employee position field
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// Label for the employee phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Label for the employee address field
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Label for the employee salary field
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get salary;

  /// Label for the save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Label for the cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title for the employee list screen
  ///
  /// In en, this message translates to:
  /// **'Employee List'**
  String get employeeList;

  /// Label for notifications setting
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Label for data management setting
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// Label for about setting
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Name of the application
  ///
  /// In en, this message translates to:
  /// **'Employee Management App'**
  String get appName;

  /// Sort option for employee name
  ///
  /// In en, this message translates to:
  /// **'Sort by Name'**
  String get sortByName;

  /// Sort option for employee ID
  ///
  /// In en, this message translates to:
  /// **'Sort by ID'**
  String get sortById;

  /// Sort option for employee salary
  ///
  /// In en, this message translates to:
  /// **'Sort by Salary'**
  String get sortBySalary;

  /// Sort option for employee position
  ///
  /// In en, this message translates to:
  /// **'Sort by Position'**
  String get sortByPosition;

  /// Title for the salary tracking screen
  ///
  /// In en, this message translates to:
  /// **'Salary Tracking'**
  String get salaryTracking;

  /// Title for the time off tracking screen
  ///
  /// In en, this message translates to:
  /// **'Time Off Tracking'**
  String get timeOffTracking;

  /// Label for selecting an employee
  ///
  /// In en, this message translates to:
  /// **'Select Employee'**
  String get selectEmployee;

  /// Label for salary amount field
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// Label for date field
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Label for adding a record
  ///
  /// In en, this message translates to:
  /// **'Add Record'**
  String get addRecord;

  /// Label for start date field
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// Label for end date field
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// Label for reason field
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
