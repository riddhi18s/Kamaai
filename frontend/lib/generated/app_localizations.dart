import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_as.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_brx.dart';
import 'app_localizations_doi.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_kok.dart';
import 'app_localizations_ks.dart';
import 'app_localizations_mai.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mni.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_sa.dart';
import 'app_localizations_sat.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('as'),
    Locale('bn'),
    Locale('brx'),
    Locale('doi'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('kok'),
    Locale('ks'),
    Locale('mai'),
    Locale('ml'),
    Locale('mni'),
    Locale('mr'),
    Locale('ne'),
    Locale('or'),
    Locale('pa'),
    Locale('sa'),
    Locale('sat'),
    Locale('ta'),
    Locale('te'),
    Locale('ur'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Kamaai'**
  String get appName;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get register;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get phoneNumber;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterPhoneNumber;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOtp;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get createPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @jobs.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get jobs;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @selectState.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get selectState;

  /// No description provided for @selectDistrict.
  ///
  /// In en, this message translates to:
  /// **'Select District'**
  String get selectDistrict;

  /// No description provided for @stateAndamanNicobar.
  ///
  /// In en, this message translates to:
  /// **'Andaman & Nicobar Islands'**
  String get stateAndamanNicobar;

  /// No description provided for @stateAndhraPradesh.
  ///
  /// In en, this message translates to:
  /// **'Andhra Pradesh'**
  String get stateAndhraPradesh;

  /// No description provided for @stateArunachalPradesh.
  ///
  /// In en, this message translates to:
  /// **'Arunachal Pradesh'**
  String get stateArunachalPradesh;

  /// No description provided for @stateAssam.
  ///
  /// In en, this message translates to:
  /// **'Assam'**
  String get stateAssam;

  /// No description provided for @stateBihar.
  ///
  /// In en, this message translates to:
  /// **'Bihar'**
  String get stateBihar;

  /// No description provided for @stateChandigarh.
  ///
  /// In en, this message translates to:
  /// **'Chandigarh'**
  String get stateChandigarh;

  /// No description provided for @stateChhattisgarh.
  ///
  /// In en, this message translates to:
  /// **'Chhattisgarh'**
  String get stateChhattisgarh;

  /// No description provided for @stateDadraDamanDiu.
  ///
  /// In en, this message translates to:
  /// **'Dadra & Nagar Haveli and Daman & Diu'**
  String get stateDadraDamanDiu;

  /// No description provided for @stateDelhi.
  ///
  /// In en, this message translates to:
  /// **'Delhi'**
  String get stateDelhi;

  /// No description provided for @stateGoa.
  ///
  /// In en, this message translates to:
  /// **'Goa'**
  String get stateGoa;

  /// No description provided for @stateGujarat.
  ///
  /// In en, this message translates to:
  /// **'Gujarat'**
  String get stateGujarat;

  /// No description provided for @stateHaryana.
  ///
  /// In en, this message translates to:
  /// **'Haryana'**
  String get stateHaryana;

  /// No description provided for @stateHimachalPradesh.
  ///
  /// In en, this message translates to:
  /// **'Himachal Pradesh'**
  String get stateHimachalPradesh;

  /// No description provided for @stateJharkhand.
  ///
  /// In en, this message translates to:
  /// **'Jharkhand'**
  String get stateJharkhand;

  /// No description provided for @stateJammuKashmir.
  ///
  /// In en, this message translates to:
  /// **'Jammu & Kashmir'**
  String get stateJammuKashmir;

  /// No description provided for @stateKarnataka.
  ///
  /// In en, this message translates to:
  /// **'Karnataka'**
  String get stateKarnataka;

  /// No description provided for @stateKerala.
  ///
  /// In en, this message translates to:
  /// **'Kerala'**
  String get stateKerala;

  /// No description provided for @stateLadakh.
  ///
  /// In en, this message translates to:
  /// **'Ladakh'**
  String get stateLadakh;

  /// No description provided for @stateLakshadweep.
  ///
  /// In en, this message translates to:
  /// **'Lakshadweep'**
  String get stateLakshadweep;

  /// No description provided for @stateMadhyaPradesh.
  ///
  /// In en, this message translates to:
  /// **'Madhya Pradesh'**
  String get stateMadhyaPradesh;

  /// No description provided for @stateMaharashtra.
  ///
  /// In en, this message translates to:
  /// **'Maharashtra'**
  String get stateMaharashtra;

  /// No description provided for @stateManipur.
  ///
  /// In en, this message translates to:
  /// **'Manipur'**
  String get stateManipur;

  /// No description provided for @stateMeghalaya.
  ///
  /// In en, this message translates to:
  /// **'Meghalaya'**
  String get stateMeghalaya;

  /// No description provided for @stateMizoram.
  ///
  /// In en, this message translates to:
  /// **'Mizoram'**
  String get stateMizoram;

  /// No description provided for @stateNagaland.
  ///
  /// In en, this message translates to:
  /// **'Nagaland'**
  String get stateNagaland;

  /// No description provided for @stateOdisha.
  ///
  /// In en, this message translates to:
  /// **'Odisha'**
  String get stateOdisha;

  /// No description provided for @statePunjab.
  ///
  /// In en, this message translates to:
  /// **'Punjab'**
  String get statePunjab;

  /// No description provided for @statePuducherry.
  ///
  /// In en, this message translates to:
  /// **'Puducherry'**
  String get statePuducherry;

  /// No description provided for @stateRajasthan.
  ///
  /// In en, this message translates to:
  /// **'Rajasthan'**
  String get stateRajasthan;

  /// No description provided for @stateSikkim.
  ///
  /// In en, this message translates to:
  /// **'Sikkim'**
  String get stateSikkim;

  /// No description provided for @stateTamilNadu.
  ///
  /// In en, this message translates to:
  /// **'Tamil Nadu'**
  String get stateTamilNadu;

  /// No description provided for @stateTelangana.
  ///
  /// In en, this message translates to:
  /// **'Telangana'**
  String get stateTelangana;

  /// No description provided for @stateTripura.
  ///
  /// In en, this message translates to:
  /// **'Tripura'**
  String get stateTripura;

  /// No description provided for @stateUttarPradesh.
  ///
  /// In en, this message translates to:
  /// **'Uttar Pradesh'**
  String get stateUttarPradesh;

  /// No description provided for @stateUttarakhand.
  ///
  /// In en, this message translates to:
  /// **'Uttarakhand'**
  String get stateUttarakhand;

  /// No description provided for @stateWestBengal.
  ///
  /// In en, this message translates to:
  /// **'West Bengal'**
  String get stateWestBengal;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @phoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number to continue.'**
  String get phoneSubtitle;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP sent to your mobile number.'**
  String get otpSubtitle;

  /// No description provided for @passwordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a secure password for your account.'**
  String get passwordSubtitle;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwordNotMatch;

  /// No description provided for @passwordRequirement.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters.'**
  String get passwordRequirement;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @otpInfo.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send a one-time password for verification.'**
  String get otpInfo;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'OTP sent to'**
  String get otpSentTo;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @changePhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Phone Number'**
  String get changePhoneNumber;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get enterName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get enterAddress;

  /// No description provided for @locationNotSelected.
  ///
  /// In en, this message translates to:
  /// **'Location not selected'**
  String get locationNotSelected;

  /// No description provided for @detectLocation.
  ///
  /// In en, this message translates to:
  /// **'Detect Location'**
  String get detectLocation;

  /// No description provided for @authSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find work • Hire workers • Grow together'**
  String get authSelectionSubtitle;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'New here? Register and start earning.'**
  String get createAccountSubtitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Continue here.'**
  String get loginSubtitle;

  /// No description provided for @voiceAssistant.
  ///
  /// In en, this message translates to:
  /// **'Voice Assistant'**
  String get voiceAssistant;

  /// No description provided for @voiceAssistantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap the microphone and say Login, Register or Change Language.'**
  String get voiceAssistantSubtitle;

  /// No description provided for @voiceCommandNotRecognized.
  ///
  /// In en, this message translates to:
  /// **'Sorry, I couldn\'t understand that command.'**
  String get voiceCommandNotRecognized;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @invalidName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name'**
  String get invalidName;

  /// No description provided for @dateOfBirthOptional.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirthOptional;

  /// No description provided for @selectDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Select Date of Birth'**
  String get selectDateOfBirth;

  /// No description provided for @optionalField.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optionalField;

  /// No description provided for @enterPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneTitle;

  /// No description provided for @enterPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll send a verification code to continue.'**
  String get enterPhoneSubtitle;

  /// No description provided for @alreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Already registered?'**
  String get alreadyRegistered;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Your Profile'**
  String get profileTitle;

  /// No description provided for @profileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Almost done! Tell us about yourself.'**
  String get profileSubtitle;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetails;

  /// No description provided for @aboutYou.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get aboutYou;

  /// No description provided for @locationSection.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationSection;

  /// No description provided for @fullAddress.
  ///
  /// In en, this message translates to:
  /// **'Full Address'**
  String get fullAddress;

  /// No description provided for @profilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get profilePhoto;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// No description provided for @profilePhotoOptional.
  ///
  /// In en, this message translates to:
  /// **'Add Profile Photo (Optional)'**
  String get profilePhotoOptional;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @selectGender.
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @occupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get occupation;

  /// No description provided for @selectOccupation.
  ///
  /// In en, this message translates to:
  /// **'Select Occupation'**
  String get selectOccupation;

  /// No description provided for @profileContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get profileContinue;

  /// No description provided for @profileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved successfully'**
  String get profileSaved;

  /// No description provided for @kaamKhataTitle.
  ///
  /// In en, this message translates to:
  /// **'Kaam Khata'**
  String get kaamKhataTitle;

  /// No description provided for @kaamKhataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your earnings'**
  String get kaamKhataSubtitle;

  /// No description provided for @kaamDoDhundoTitle.
  ///
  /// In en, this message translates to:
  /// **'Kaam Do / Dhundo'**
  String get kaamDoDhundoTitle;

  /// No description provided for @kaamDoDhundoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find work or hire workers'**
  String get kaamDoDhundoSubtitle;

  /// No description provided for @haathKaKaamTitle.
  ///
  /// In en, this message translates to:
  /// **'Handicrafts'**
  String get haathKaKaamTitle;

  /// No description provided for @haathKaKaamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Buy and sell handmade products'**
  String get haathKaKaamSubtitle;

  /// No description provided for @mandiBhavTitle.
  ///
  /// In en, this message translates to:
  /// **'Mandi Bhav'**
  String get mandiBhavTitle;

  /// No description provided for @mandiBhavSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check today\'s market prices'**
  String get mandiBhavSubtitle;

  /// No description provided for @kaamDoDhundo.
  ///
  /// In en, this message translates to:
  /// **'Kaam Do / Dhundo'**
  String get kaamDoDhundo;

  /// No description provided for @totalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get totalEarnings;

  /// No description provided for @listen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listen;

  /// No description provided for @findWork.
  ///
  /// In en, this message translates to:
  /// **'Find Work'**
  String get findWork;

  /// No description provided for @findWorkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover nearby job opportunities'**
  String get findWorkSubtitle;

  /// No description provided for @hireWorkers.
  ///
  /// In en, this message translates to:
  /// **'Hire Workers'**
  String get hireWorkers;

  /// No description provided for @hireWorkersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find trusted workers'**
  String get hireWorkersSubtitle;

  /// No description provided for @handicrafts.
  ///
  /// In en, this message translates to:
  /// **'Handicrafts'**
  String get handicrafts;

  /// No description provided for @handicraftsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Buy and sell handmade products'**
  String get handicraftsSubtitle;

  /// No description provided for @mandi.
  ///
  /// In en, this message translates to:
  /// **'Mandi'**
  String get mandi;

  /// No description provided for @mandiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check market prices'**
  String get mandiSubtitle;

  /// No description provided for @myJobs.
  ///
  /// In en, this message translates to:
  /// **'My Jobs'**
  String get myJobs;

  /// No description provided for @myJobsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your work'**
  String get myJobsSubtitle;

  /// No description provided for @myEarnings.
  ///
  /// In en, this message translates to:
  /// **'My Earnings'**
  String get myEarnings;

  /// No description provided for @myEarningsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View your income'**
  String get myEarningsSubtitle;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Namaste'**
  String get greeting;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @dashboardSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search jobs, workers, products...'**
  String get dashboardSearchHint;

  /// No description provided for @latestUpdates.
  ///
  /// In en, this message translates to:
  /// **'Latest Updates'**
  String get latestUpdates;

  /// No description provided for @voiceAssistantHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the microphone to use voice assistance.'**
  String get voiceAssistantHint;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @kaamKhata.
  ///
  /// In en, this message translates to:
  /// **'Kaam Khata'**
  String get kaamKhata;

  /// No description provided for @haathKaKaam.
  ///
  /// In en, this message translates to:
  /// **'Handicrafts'**
  String get haathKaKaam;

  /// No description provided for @mandiBhav.
  ///
  /// In en, this message translates to:
  /// **'Mandi Bhav'**
  String get mandiBhav;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @kaamKhataNavGhar.
  ///
  /// In en, this message translates to:
  /// **'Ghar'**
  String get kaamKhataNavGhar;

  /// No description provided for @kaamKhataNavDarj.
  ///
  /// In en, this message translates to:
  /// **'Darj'**
  String get kaamKhataNavDarj;

  /// No description provided for @kaamKhataNavItihaas.
  ///
  /// In en, this message translates to:
  /// **'Itihaas'**
  String get kaamKhataNavItihaas;

  /// No description provided for @kaamKhataAddEntry.
  ///
  /// In en, this message translates to:
  /// **'Kamai Darj Karein'**
  String get kaamKhataAddEntry;

  /// No description provided for @kaamKhataTodayEarningLabel.
  ///
  /// In en, this message translates to:
  /// **'Aaj ki Kamai'**
  String get kaamKhataTodayEarningLabel;

  /// No description provided for @kaamKhataSuno.
  ///
  /// In en, this message translates to:
  /// **'Suno'**
  String get kaamKhataSuno;

  /// No description provided for @kaamKhataListening.
  ///
  /// In en, this message translates to:
  /// **'Sun raha hoon...'**
  String get kaamKhataListening;

  /// No description provided for @kaamKhataStatMonthTotal.
  ///
  /// In en, this message translates to:
  /// **'Is Mahine'**
  String get kaamKhataStatMonthTotal;

  /// No description provided for @kaamKhataStatDaysWorked.
  ///
  /// In en, this message translates to:
  /// **'Din Kaam Kiya'**
  String get kaamKhataStatDaysWorked;

  /// No description provided for @kaamKhataStatDailyAverage.
  ///
  /// In en, this message translates to:
  /// **'Roz ka Aousat'**
  String get kaamKhataStatDailyAverage;

  /// No description provided for @kaamKhataNewEntryTitle.
  ///
  /// In en, this message translates to:
  /// **'Naya Kaam Darj'**
  String get kaamKhataNewEntryTitle;

  /// No description provided for @kaamKhataTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Kamai ka Prakar'**
  String get kaamKhataTypeLabel;

  /// No description provided for @kaamKhataTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'Roz ki Kamai'**
  String get kaamKhataTypeDaily;

  /// No description provided for @kaamKhataTypeFixed.
  ///
  /// In en, this message translates to:
  /// **'Fixed Income'**
  String get kaamKhataTypeFixed;

  /// No description provided for @kaamKhataAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Kamai (₹)'**
  String get kaamKhataAmountLabel;

  /// No description provided for @kaamKhataSpeakAmount.
  ///
  /// In en, this message translates to:
  /// **'Rakam Bolke Batayein'**
  String get kaamKhataSpeakAmount;

  /// No description provided for @kaamKhataDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Din'**
  String get kaamKhataDateLabel;

  /// No description provided for @kaamKhataPeriodLabel.
  ///
  /// In en, this message translates to:
  /// **'Kaam ki Taareekh (Shuru to Khatam)'**
  String get kaamKhataPeriodLabel;

  /// No description provided for @kaamKhataPeriodStart.
  ///
  /// In en, this message translates to:
  /// **'Shuru'**
  String get kaamKhataPeriodStart;

  /// No description provided for @kaamKhataPeriodEnd.
  ///
  /// In en, this message translates to:
  /// **'Khatam'**
  String get kaamKhataPeriodEnd;

  /// No description provided for @kaamKhataLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Kahan ka Kaam? (Optional)'**
  String get kaamKhataLocationLabel;

  /// No description provided for @kaamKhataLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Sharma ji ke ghar, khet...'**
  String get kaamKhataLocationHint;

  /// No description provided for @kaamKhataSpeakLocation.
  ///
  /// In en, this message translates to:
  /// **'Jagah Bolke Batayein'**
  String get kaamKhataSpeakLocation;

  /// No description provided for @kaamKhataSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Darj Karein'**
  String get kaamKhataSaveButton;

  /// No description provided for @kaamKhataBackButton.
  ///
  /// In en, this message translates to:
  /// **'Wapas'**
  String get kaamKhataBackButton;

  /// No description provided for @kaamKhataErrorAmount.
  ///
  /// In en, this message translates to:
  /// **'Kripya Rakam Darj Karein'**
  String get kaamKhataErrorAmount;

  /// No description provided for @kaamKhataSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Kamai Darj Ho Gayi'**
  String get kaamKhataSavedSuccess;

  /// No description provided for @kaamKhataSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Kuch Galat Hua, Dobara Koshish Karein'**
  String get kaamKhataSaveFailed;

  /// No description provided for @kaamKhataHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Pehle ka Hisaab'**
  String get kaamKhataHistoryTitle;

  /// No description provided for @kaamKhataListenFullHistory.
  ///
  /// In en, this message translates to:
  /// **'Poora Itihaas Sunein'**
  String get kaamKhataListenFullHistory;

  /// No description provided for @kaamKhataHistoryTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Kul Kamai'**
  String get kaamKhataHistoryTotalLabel;

  /// No description provided for @kaamKhataDinLabel.
  ///
  /// In en, this message translates to:
  /// **'Din'**
  String get kaamKhataDinLabel;

  /// No description provided for @kaamKhataToLabel.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get kaamKhataToLabel;

  /// No description provided for @kaamKhataNoEntries.
  ///
  /// In en, this message translates to:
  /// **'No Entries Found'**
  String get kaamKhataNoEntries;

  /// No description provided for @kaamKhataCertificateTitle.
  ///
  /// In en, this message translates to:
  /// **'Income Certificate'**
  String get kaamKhataCertificateTitle;

  /// No description provided for @kaamKhataCertificateSelfDeclared.
  ///
  /// In en, this message translates to:
  /// **'Self Declaration'**
  String get kaamKhataCertificateSelfDeclared;

  /// No description provided for @kaamKhataCertificateName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get kaamKhataCertificateName;

  /// No description provided for @kaamKhataCertificateOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get kaamKhataCertificateOccupation;

  /// No description provided for @kaamKhataCertificateAvgIncome.
  ///
  /// In en, this message translates to:
  /// **'Average Monthly Income'**
  String get kaamKhataCertificateAvgIncome;

  /// No description provided for @kaamKhataCertificateGenerated.
  ///
  /// In en, this message translates to:
  /// **'Generated'**
  String get kaamKhataCertificateGenerated;

  /// No description provided for @kaamKhataCertificateValidity.
  ///
  /// In en, this message translates to:
  /// **'Validity'**
  String get kaamKhataCertificateValidity;

  /// No description provided for @kaamKhataCertificateValidityDays.
  ///
  /// In en, this message translates to:
  /// **'30 Days'**
  String get kaamKhataCertificateValidityDays;

  /// No description provided for @kaamKhataCertificatePreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get kaamKhataCertificatePreview;

  /// No description provided for @kaamKhataCertificateDownload.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get kaamKhataCertificateDownload;

  /// No description provided for @kaamKhataCertificateError.
  ///
  /// In en, this message translates to:
  /// **'Unable to Generate Income Certificate.'**
  String get kaamKhataCertificateError;

  /// No description provided for @kaamKhataCertificateDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is a self-declared income certificate generated from records maintained by the user in the Kamaai application. It is not a government-issued income certificate.'**
  String get kaamKhataCertificateDisclaimer;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// Shown when the user taps the notification bell before that feature is built
  ///
  /// In en, this message translates to:
  /// **'Notifications are coming soon'**
  String get notificationsComingSoon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Adilabad'**
  String get districtAdilabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Agra'**
  String get districtAgra;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ahmedabad'**
  String get districtAhmedabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ahmednagar'**
  String get districtAhmednagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aizawal West'**
  String get districtAizawalWest;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aizawl East'**
  String get districtAizawlEast;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ajmer'**
  String get districtAjmer;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Akola'**
  String get districtAkola;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Alappuzha'**
  String get districtAlappuzha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aligarh'**
  String get districtAligarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Alipurduar'**
  String get districtAlipurduar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Allahabad'**
  String get districtAllahabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Almora'**
  String get districtAlmora;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Alwar'**
  String get districtAlwar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Amaravati'**
  String get districtAmaravati;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ambala'**
  String get districtAmbala;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ambedkar Nagar'**
  String get districtAmbedkarNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Amreli'**
  String get districtAmreli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Amritsar'**
  String get districtAmritsar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Anand'**
  String get districtAnand;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Anantapur'**
  String get districtAnantapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Andaman & Nicobar Islands'**
  String get districtAndamanNicobarIs;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Angul'**
  String get districtAngul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Anjaw'**
  String get districtAnjaw;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Anupur'**
  String get districtAnupur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aranthangi'**
  String get districtAranthangi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Araria'**
  String get districtAraria;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Arwal'**
  String get districtArwal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ashok Nagar'**
  String get districtAshokNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Auraiya'**
  String get districtAuraiya;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aurangabad'**
  String get districtAurangabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Aurangabad Bi'**
  String get districtAurangabadBi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Azamgarh'**
  String get districtAzamgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bagalkot'**
  String get districtBagalkot;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bageshwar'**
  String get districtBageshwar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baghpat'**
  String get districtBaghpat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bahraich'**
  String get districtBahraich;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baksa'**
  String get districtBaksa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Balaghat'**
  String get districtBalaghat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Balangir'**
  String get districtBalangir;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baleshwar'**
  String get districtBaleshwar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ballia'**
  String get districtBallia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Balrampur'**
  String get districtBalrampur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Banaskantha'**
  String get districtBanaskantha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Banda'**
  String get districtBanda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bangalore Rural'**
  String get districtBangaloreRural;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bangalore Urban'**
  String get districtBangaloreUrban;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Banka'**
  String get districtBanka;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bankura'**
  String get districtBankura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Banswara'**
  String get districtBanswara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Barabanki'**
  String get districtBarabanki;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baramula'**
  String get districtBaramula;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baran'**
  String get districtBaran;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bareilly'**
  String get districtBareilly;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bargarh'**
  String get districtBargarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Barmer'**
  String get districtBarmer;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Barnala'**
  String get districtBarnala;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Barpeta'**
  String get districtBarpeta;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Barwani'**
  String get districtBarwani;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bastar'**
  String get districtBastar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Basti'**
  String get districtBasti;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bathinda'**
  String get districtBathinda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Baudh'**
  String get districtBaudh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Beed'**
  String get districtBeed;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Begusarai'**
  String get districtBegusarai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Belgaum'**
  String get districtBelgaum;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bellary'**
  String get districtBellary;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Betul'**
  String get districtBetul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhadrak'**
  String get districtBhadrak;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhagalpur'**
  String get districtBhagalpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhandara'**
  String get districtBhandara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bharatpur'**
  String get districtBharatpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bharuch'**
  String get districtBharuch;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhavnagar'**
  String get districtBhavnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhilwara'**
  String get districtBhilwara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhind'**
  String get districtBhind;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhiwani'**
  String get districtBhiwani;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhoi'**
  String get districtBhoi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhojpur'**
  String get districtBhojpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bhopal'**
  String get districtBhopal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bidar'**
  String get districtBidar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bijapur'**
  String get districtBijapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bijnor'**
  String get districtBijnor;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bikaner'**
  String get districtBikaner;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bilaspur'**
  String get districtBilaspurCg;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bilaspur'**
  String get districtBilaspurHp;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Birbhum'**
  String get districtBirbhum;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bishnupur'**
  String get districtBishnupur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bokaro'**
  String get districtBokaro;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bongaigaon'**
  String get districtBongaigaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Budaun'**
  String get districtBudaun;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bulandshahar'**
  String get districtBulandshahar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Buldana'**
  String get districtBuldana;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Bundi'**
  String get districtBundi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Burhanpur'**
  String get districtBurhanpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Buxar'**
  String get districtBuxar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Cachar'**
  String get districtCachar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Central'**
  String get districtCentral;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chamarajanagar'**
  String get districtChamarajanagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chamba'**
  String get districtChamba;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chamoli'**
  String get districtChamoli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Champawat'**
  String get districtChampawat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Champhai'**
  String get districtChamphai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chandauli'**
  String get districtChandauli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chandel'**
  String get districtChandel;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chandigarh'**
  String get districtChandigarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chandrapur'**
  String get districtChandrapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Changlang'**
  String get districtChanglang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chatra'**
  String get districtChatra;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chennai Corp'**
  String get districtChennaiCorp;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Cheyyar'**
  String get districtCheyyar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chhatarpur'**
  String get districtChhatarpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chhindwara'**
  String get districtChhindwara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chikkaballapur'**
  String get districtChikkaballapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chikmagalur'**
  String get districtChikmagalur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chirang'**
  String get districtChirang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chitradurga'**
  String get districtChitradurga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chitrakoot'**
  String get districtChitrakoot;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chittaurgarh'**
  String get districtChittaurgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Chittoor'**
  String get districtChittoor;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Churachandpur'**
  String get districtChurachandpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Churu'**
  String get districtChuru;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'City Zone'**
  String get districtCityZone;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Civili Line'**
  String get districtCiviliLine;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Coimbatore'**
  String get districtCoimbatore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Cooch Behar'**
  String get districtCoochBehar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Cuddalore'**
  String get districtCuddalore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Cuttack'**
  String get districtCuttack;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dadra Nagar Haveli'**
  String get districtDadraNagarHaveli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dahod'**
  String get districtDahod;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dakshin Dinajpur'**
  String get districtDakshinDinajpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dakshina Kannada'**
  String get districtDakshinaKannada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Daman'**
  String get districtDaman;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Damoh'**
  String get districtDamoh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dang'**
  String get districtDang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dantewada'**
  String get districtDantewada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Darbhanga'**
  String get districtDarbhanga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Darjeeling'**
  String get districtDarjeeling;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Darrang'**
  String get districtDarrang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Datia'**
  String get districtDatia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dausa'**
  String get districtDausa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Davanagere'**
  String get districtDavanagere;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Debagarh'**
  String get districtDebagarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dehradun'**
  String get districtDehradun;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Deogarh'**
  String get districtDeogarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Deoria'**
  String get districtDeoria;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dewas'**
  String get districtDewas;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhamtari'**
  String get districtDhamtari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhanbad'**
  String get districtDhanbad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhar'**
  String get districtDhar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dharapuram'**
  String get districtDharapuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dharmapuri'**
  String get districtDharmapuri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dharwad'**
  String get districtDharwad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhaulpur'**
  String get districtDhaulpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhemaji'**
  String get districtDhemaji;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhenkanal'**
  String get districtDhenkanal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhubri'**
  String get districtDhubri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dhule'**
  String get districtDhule;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dibrugarh'**
  String get districtDibrugarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dimapur'**
  String get districtDimapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dindigul'**
  String get districtDindigul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dindori'**
  String get districtDindori;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Diu'**
  String get districtDiu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Doda'**
  String get districtDoda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dumka'**
  String get districtDumka;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Dungarpur'**
  String get districtDungarpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Durg'**
  String get districtDurg;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East'**
  String get districtEast;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Champaran'**
  String get districtEastChamparan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Dhalai'**
  String get districtEastDhalai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Garo Hills'**
  String get districtEastGaroHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Godavari'**
  String get districtEastGodavari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Kameng'**
  String get districtEastKameng;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Khasi Hills'**
  String get districtEastKhasiHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Siang'**
  String get districtEastSiang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'East Singhbhum'**
  String get districtEastSinghbhum;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ernakulam'**
  String get districtErnakulam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Erode'**
  String get districtErode;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Etah'**
  String get districtEtah;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Etawah'**
  String get districtEtawah;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Faizabad'**
  String get districtFaizabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Faridabad'**
  String get districtFaridabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Faridkot'**
  String get districtFaridkot;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Farrukhabad'**
  String get districtFarrukhabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Fategarh Sahib'**
  String get districtFategarhSahib;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Fatehabad'**
  String get districtFatehabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Fatehpur'**
  String get districtFatehpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Firozabad'**
  String get districtFirozabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Firozpur'**
  String get districtFirozpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gadag'**
  String get districtGadag;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gadchiroli'**
  String get districtGadchiroli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gajapati'**
  String get districtGajapati;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gandhinagar'**
  String get districtGandhinagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ganganagar'**
  String get districtGanganagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ganjam'**
  String get districtGanjam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Garhwa'**
  String get districtGarhwa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gautam Budh Nagar'**
  String get districtGautamBudhNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gaya'**
  String get districtGaya;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ghaziabad'**
  String get districtGhaziabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ghazipur'**
  String get districtGhazipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Giridih'**
  String get districtGiridih;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Goa'**
  String get districtGoa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Goalpara'**
  String get districtGoalpara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Godda'**
  String get districtGodda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Godhara'**
  String get districtGodhara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Golaghat'**
  String get districtGolaghat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gonda'**
  String get districtGonda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gondia'**
  String get districtGondia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gopalganj'**
  String get districtGopalganj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gorakhpur'**
  String get districtGorakhpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gulbarga'**
  String get districtGulbarga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gumla'**
  String get districtGumla;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Guna'**
  String get districtGuna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Guntur'**
  String get districtGuntur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gurdaspur'**
  String get districtGurdaspur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gurgaon'**
  String get districtGurgaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Gwalior'**
  String get districtGwalior;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hailakandi'**
  String get districtHailakandi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hamirpur'**
  String get districtHamirpurHp;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hamirpur'**
  String get districtHamirpurUp;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hanumangarh'**
  String get districtHanumangarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Harda'**
  String get districtHarda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hardoi'**
  String get districtHardoi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hardwar'**
  String get districtHardwar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hassan'**
  String get districtHassan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hathras Mahamayanagar'**
  String get districtHathrasMahamayanagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Haveri'**
  String get districtHaveri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hazaribagh'**
  String get districtHazaribagh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hingoli'**
  String get districtHingoli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hisar'**
  String get districtHisar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hooghly'**
  String get districtHooghly;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hoshangabad'**
  String get districtHoshangabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hoshiarpur'**
  String get districtHoshiarpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Howrah'**
  String get districtHowrah;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Hyderabad'**
  String get districtHyderabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Idukki'**
  String get districtIdukki;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Imphal East'**
  String get districtImphalEast;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Imphal West'**
  String get districtImphalWest;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Indore'**
  String get districtIndore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jabalpur'**
  String get districtJabalpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jagatsinghapur'**
  String get districtJagatsinghapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jaintia Hills'**
  String get districtJaintiaHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jaipur'**
  String get districtJaipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jaisalmer'**
  String get districtJaisalmer;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jajpur'**
  String get districtJajpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalandhar'**
  String get districtJalandhar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalaun'**
  String get districtJalaun;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalgaon'**
  String get districtJalgaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalna'**
  String get districtJalna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalore'**
  String get districtJalore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jalpaiguri'**
  String get districtJalpaiguri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jammu'**
  String get districtJammu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jamnagar'**
  String get districtJamnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jamtara'**
  String get districtJamtara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jamui'**
  String get districtJamui;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Janjgir'**
  String get districtJanjgir;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jashpur'**
  String get districtJashpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jaunpur'**
  String get districtJaunpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jehanabad'**
  String get districtJehanabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhabua'**
  String get districtJhabua;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhajjar'**
  String get districtJhajjar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhalawar'**
  String get districtJhalawar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhansi'**
  String get districtJhansi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhargram'**
  String get districtJhargram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jharsuguda'**
  String get districtJharsuguda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jhunjhunun'**
  String get districtJhunjhunun;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jind'**
  String get districtJind;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jodhpur'**
  String get districtJodhpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jorhat'**
  String get districtJorhat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Junagadh'**
  String get districtJunagadh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Jyotiba Phule Nagar'**
  String get districtJyotibaPhuleNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kadapa'**
  String get districtKadapa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kaimur'**
  String get districtKaimur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kaithal'**
  String get districtKaithal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kalahandi'**
  String get districtKalahandi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kalimpong'**
  String get districtKalimpong;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kallakurichi'**
  String get districtKallakurichi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kamrup'**
  String get districtKamrup;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kancheepuram'**
  String get districtKancheepuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kandhamal'**
  String get districtKandhamal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kangpokpi'**
  String get districtKangpokpi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kangra'**
  String get districtKangra;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kanker'**
  String get districtKanker;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kannauj'**
  String get districtKannauj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kannur'**
  String get districtKannur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kanpur Dehat'**
  String get districtKanpurDehat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kanpur Nagar'**
  String get districtKanpurNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kapurthala'**
  String get districtKapurthala;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karauli'**
  String get districtKarauli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karbi Anglong'**
  String get districtKarbiAnglong;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karimganj'**
  String get districtKarimganj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karimnagar'**
  String get districtKarimnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karnal'**
  String get districtKarnal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karol Bagh'**
  String get districtKarolBagh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Karur'**
  String get districtKarur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kasaragod'**
  String get districtKasaragod;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kathua'**
  String get districtKathua;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Katihar'**
  String get districtKatihar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Katni'**
  String get districtKatni;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kaushambi'**
  String get districtKaushambi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kawardha Kabir Dham'**
  String get districtKawardhaKabirDham;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kendrapara'**
  String get districtKendrapara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Keonjhar'**
  String get districtKeonjhar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Khagaria'**
  String get districtKhagaria;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Khammam Bhadrachalam'**
  String get districtKhammamBhadrachalam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Khandwa'**
  String get districtKhandwa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Khargone'**
  String get districtKhargone;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kheda'**
  String get districtKheda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kheri'**
  String get districtKheri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Khurda'**
  String get districtKhurda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kiphire'**
  String get districtKiphire;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kishanganj'**
  String get districtKishanganj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kishtwar'**
  String get districtKishtwar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kodagu'**
  String get districtKodagu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kodarma'**
  String get districtKodarma;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kohima'**
  String get districtKohima;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kokrajhar'**
  String get districtKokrajhar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kolar'**
  String get districtKolar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kolasib'**
  String get districtKolasib;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kolhapur'**
  String get districtKolhapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kolkata'**
  String get districtKolkata;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kollam'**
  String get districtKollam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Koppal'**
  String get districtKoppal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Koraput'**
  String get districtKoraput;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Korba'**
  String get districtKorba;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Koriya'**
  String get districtKoriya;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kota'**
  String get districtKota;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kottayam'**
  String get districtKottayam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kovilpatti'**
  String get districtKovilpatti;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kozhikode'**
  String get districtKozhikode;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Krishna'**
  String get districtKrishna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Krishnagiri'**
  String get districtKrishnagiri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kullu'**
  String get districtKullu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kurnool'**
  String get districtKurnool;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kurukshetra'**
  String get districtKurukshetra;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kurung Kumey'**
  String get districtKurungKumey;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kushinagar'**
  String get districtKushinagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Kutch'**
  String get districtKutch;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lakhimpur'**
  String get districtLakhimpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lakhisarai'**
  String get districtLakhisarai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lakshadweep'**
  String get districtLakshadweep;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lalitpur'**
  String get districtLalitpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lathehar'**
  String get districtLathehar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Latur'**
  String get districtLatur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lawngtlai'**
  String get districtLawngtlai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lohardaga'**
  String get districtLohardaga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lohit'**
  String get districtLohit;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Longleng'**
  String get districtLongleng;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lower Dibang Valley'**
  String get districtLowerDibangValley;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lower Subansiri'**
  String get districtLowerSubansiri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lucknow'**
  String get districtLucknow;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ludhiana'**
  String get districtLudhiana;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Lunglei'**
  String get districtLunglei;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Madhepura'**
  String get districtMadhepura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Madhubani'**
  String get districtMadhubani;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Madurai'**
  String get districtMadurai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Maharajganj'**
  String get districtMaharajganj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mahasamund'**
  String get districtMahasamund;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mahbubnagar'**
  String get districtMahbubnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mahesana'**
  String get districtMahesana;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mahoba'**
  String get districtMahoba;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mainpuri'**
  String get districtMainpuri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Malappuram'**
  String get districtMalappuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Malda'**
  String get districtMalda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Malkangiri'**
  String get districtMalkangiri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mamit'**
  String get districtMamit;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mandi'**
  String get districtMandi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mandla'**
  String get districtMandla;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mandsaur'**
  String get districtMandsaur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mandya'**
  String get districtMandya;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mansa Pu'**
  String get districtMansaPu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Marigaon'**
  String get districtMarigaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mathura'**
  String get districtMathura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mau'**
  String get districtMau;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mayurbhanj'**
  String get districtMayurbhanj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Medak'**
  String get districtMedak;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Meerut'**
  String get districtMeerut;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mewat'**
  String get districtMewat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mirzapur'**
  String get districtMirzapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Moga'**
  String get districtMoga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mohali Sasnagar'**
  String get districtMohaliSasnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mokokchung'**
  String get districtMokokchung;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get districtMon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Moradabad'**
  String get districtMoradabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Morena'**
  String get districtMorena;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mukatsar'**
  String get districtMukatsar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Munger'**
  String get districtMunger;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Murshidabad'**
  String get districtMurshidabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Muzaffarnagar'**
  String get districtMuzaffarnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Muzaffarpur'**
  String get districtMuzaffarpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Mysore'**
  String get districtMysore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nabarangapur'**
  String get districtNabarangapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nadia'**
  String get districtNadia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nagaon'**
  String get districtNagaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nagapattinam'**
  String get districtNagapattinam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nagaur'**
  String get districtNagaur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nagercoil'**
  String get districtNagercoil;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nagpur'**
  String get districtNagpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nainital'**
  String get districtNainital;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Najafgarh'**
  String get districtNajafgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nalanda'**
  String get districtNalanda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nalbari'**
  String get districtNalbari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nalgonda'**
  String get districtNalgonda;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Namakkal'**
  String get districtNamakkal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nanded'**
  String get districtNanded;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nandurbar'**
  String get districtNandurbar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Narela'**
  String get districtNarela;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Narmada'**
  String get districtNarmada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Narnaul'**
  String get districtNarnaul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Narsinghpur'**
  String get districtNarsinghpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nasik'**
  String get districtNasik;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Navsari'**
  String get districtNavsari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nawada'**
  String get districtNawada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nawanshahr'**
  String get districtNawanshahr;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nayagarh'**
  String get districtNayagarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Neemuch'**
  String get districtNeemuch;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nellore'**
  String get districtNellore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nizamabad'**
  String get districtNizamabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get districtNorth;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'North24 Parganas'**
  String get districtNorth24Parganas;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'North Cachar Hills'**
  String get districtNorthCacharHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'North Tripura'**
  String get districtNorthTripura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Nuapada'**
  String get districtNuapada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Osmanabad'**
  String get districtOsmanabad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pakur'**
  String get districtPakur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Palakkad'**
  String get districtPalakkad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Palamu'**
  String get districtPalamu;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Palani'**
  String get districtPalani;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pali'**
  String get districtPali;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Palwal'**
  String get districtPalwal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Panchkula'**
  String get districtPanchkula;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Panipat'**
  String get districtPanipat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Panna'**
  String get districtPanna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Papum Pare'**
  String get districtPapumPare;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Paramakudi'**
  String get districtParamakudi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Parbhani'**
  String get districtParbhani;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Paschim Bardhaman'**
  String get districtPaschimBardhaman;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Paschim Medinipur'**
  String get districtPaschimMedinipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Patan'**
  String get districtPatan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pathanamthitta'**
  String get districtPathanamthitta;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Patiala'**
  String get districtPatiala;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Patna'**
  String get districtPatna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pauri Garhwal'**
  String get districtPauriGarhwal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Perambalur'**
  String get districtPerambalur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Peren'**
  String get districtPeren;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Phek'**
  String get districtPhek;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pilibhit'**
  String get districtPilibhit;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pithoragarh'**
  String get districtPithoragarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pondicherry'**
  String get districtPondicherry;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Poonamallee'**
  String get districtPoonamallee;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Poonch'**
  String get districtPoonch;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Porbandar'**
  String get districtPorbandar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Prakasam'**
  String get districtPrakasam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pratapgarh'**
  String get districtPratapgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pudukottai'**
  String get districtPudukottai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Pune'**
  String get districtPune;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Purba Bardhaman'**
  String get districtPurbaBardhaman;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Purba Medinipur'**
  String get districtPurbaMedinipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Puri'**
  String get districtPuri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Purnia'**
  String get districtPurnia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Purulia'**
  String get districtPurulia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raebareli'**
  String get districtRaebareli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raichur'**
  String get districtRaichur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raigad'**
  String get districtRaigad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raigarh'**
  String get districtRaigarhCg;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raipur'**
  String get districtRaipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Raisen'**
  String get districtRaisen;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rajgarh'**
  String get districtRajgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rajkot'**
  String get districtRajkot;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rajnandgaon'**
  String get districtRajnandgaon;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rajouri'**
  String get districtRajouri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rajsamand'**
  String get districtRajsamand;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ramanagara'**
  String get districtRamanagara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ramanathapuram'**
  String get districtRamanathapuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ramban'**
  String get districtRamban;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rampur'**
  String get districtRampur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ranchi'**
  String get districtRanchi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rangareddi'**
  String get districtRangareddi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ratlam'**
  String get districtRatlam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ratnagiri'**
  String get districtRatnagiri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rayagada'**
  String get districtRayagada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Reasi'**
  String get districtReasi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rewa'**
  String get districtRewa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rewari'**
  String get districtRewari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rohini'**
  String get districtRohini;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rohtak'**
  String get districtRohtak;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rohtas'**
  String get districtRohtas;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rudraprayag'**
  String get districtRudraprayag;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Rupnagar Ropar'**
  String get districtRupnagarRopar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'S. Paharganj'**
  String get districtSPaharGanj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sabarkantha'**
  String get districtSabarkantha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sagar'**
  String get districtSagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saharanpur'**
  String get districtSaharanpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saharsa'**
  String get districtSaharsa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sahibganj'**
  String get districtSahibganj;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saidapet'**
  String get districtSaidapet;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saiha'**
  String get districtSaiha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Salem'**
  String get districtSalem;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Samastipur'**
  String get districtSamastipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sambalpur'**
  String get districtSambalpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sambha'**
  String get districtSambha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sangli'**
  String get districtSangli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sangrur'**
  String get districtSangrur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sankarankoil'**
  String get districtSankarankoil;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sant Kabir Nagar'**
  String get districtSantKabirNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sant Ravidas Nagar'**
  String get districtSantRavidasNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saraikela Kharsawan'**
  String get districtSaraikelaKharsawan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Saran'**
  String get districtSaran;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Satara'**
  String get districtSatara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Satna'**
  String get districtSatna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sawai Madhopur'**
  String get districtSawaiMadhopur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Senapati'**
  String get districtSenapati;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Seoni'**
  String get districtSeoni;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Serchhip'**
  String get districtSerchhip;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shahadra N'**
  String get districtShahadraN;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shahadra S'**
  String get districtShahadraS;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shahdol'**
  String get districtShahdol;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shahjahanpur'**
  String get districtShahjahanpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shajapur'**
  String get districtShajapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sheikhpura'**
  String get districtSheikhpura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sheohar'**
  String get districtSheohar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sheopur'**
  String get districtSheopur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shimla'**
  String get districtShimla;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shimoga'**
  String get districtShimoga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shivpuri'**
  String get districtShivpuri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Shravasti'**
  String get districtShravasti;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sibsagar'**
  String get districtSibsagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Siddharthnagar'**
  String get districtSiddharthnagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sidhi'**
  String get districtSidhi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sikar'**
  String get districtSikar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Simdega'**
  String get districtSimdega;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sindhudurg'**
  String get districtSindhudurg;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sirmaur'**
  String get districtSirmaur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sirohi'**
  String get districtSirohi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sirsa'**
  String get districtSirsa;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sitamarhi'**
  String get districtSitamarhi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sitapur'**
  String get districtSitapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sivaganga'**
  String get districtSivaganga;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sivakasi'**
  String get districtSivakasi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Siwan'**
  String get districtSiwan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Solan'**
  String get districtSolan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Solapur'**
  String get districtSolapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sonapur Subarnapur'**
  String get districtSonapurSubarnapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sonbhadra'**
  String get districtSonbhadra;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sonipat'**
  String get districtSonipat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sonitpur'**
  String get districtSonitpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get districtSouth;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'South24 Parganas'**
  String get districtSouth24Parganas;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'South Garo Hills'**
  String get districtSouthGaroHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'South Tripura'**
  String get districtSouthTripura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Srikakulam'**
  String get districtSrikakulam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sultanpur'**
  String get districtSultanpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Sundargarh'**
  String get districtSundargarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Supaul'**
  String get districtSupaul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Surat'**
  String get districtSurat;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Surendranagar'**
  String get districtSurendranagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Surguja Ambikapur'**
  String get districtSurgujaAmbikapur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tamenglong'**
  String get districtTamenglong;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tapi'**
  String get districtTapi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tarn Taran'**
  String get districtTarnTaran;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tawang'**
  String get districtTawang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tehri Garhwal'**
  String get districtTehriGarhwal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thane'**
  String get districtThane;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thanjavur'**
  String get districtThanjavur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'The Nilgiris'**
  String get districtTheNilgiris;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Theni'**
  String get districtTheni;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruchirapalli'**
  String get districtThiruchirapalli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thirunelveli'**
  String get districtThirunelveli;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruppattur'**
  String get districtThiruppattur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruppur'**
  String get districtThiruppur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruvallore'**
  String get districtThiruvallore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruvananthapuram'**
  String get districtThiruvananthapuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thiruvarur'**
  String get districtThiruvarur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thoothukudi'**
  String get districtThoothukudi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thoubal'**
  String get districtThoubal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Thrissur'**
  String get districtThrissur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tikamgarh'**
  String get districtTikamgarh;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tinsukia'**
  String get districtTinsukia;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tirap'**
  String get districtTirap;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tiruvannamalai'**
  String get districtTiruvannamalai;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tonk'**
  String get districtTonk;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tuensang'**
  String get districtTuensang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Tumkur'**
  String get districtTumkur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Udaipur'**
  String get districtUdaipur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Udalguri'**
  String get districtUdalguri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Udham Singh Nagar'**
  String get districtUdhamSinghNagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Udhampur'**
  String get districtUdhampur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Udupi'**
  String get districtUdupi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ujjain'**
  String get districtUjjain;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Ukhrul'**
  String get districtUkhrul;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Umaria'**
  String get districtUmaria;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Una'**
  String get districtUna;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Unnao'**
  String get districtUnnao;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Upper Dibang Valley'**
  String get districtUpperDibangValley;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Upper Siang'**
  String get districtUpperSiang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Upper Subansiri'**
  String get districtUpperSubansiri;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Uttar Dinajpur'**
  String get districtUttarDinajpur;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Uttara Kannada'**
  String get districtUttaraKannada;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Uttarkashi'**
  String get districtUttarkashi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Vadodara'**
  String get districtVadodara;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Vaishali'**
  String get districtVaishali;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Valsad'**
  String get districtValsad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Varanasi'**
  String get districtVaranasi;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Vellore'**
  String get districtVellore;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Vidisha'**
  String get districtVidisha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Villupuram'**
  String get districtVillupuram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Virudhunagar'**
  String get districtVirudhunagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Visakhapatnam'**
  String get districtVisakhapatnam;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Vizianagaram'**
  String get districtVizianagaram;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Warangal'**
  String get districtWarangal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Wardha'**
  String get districtWardha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Washim'**
  String get districtWashim;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Wayanad'**
  String get districtWayanad;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West'**
  String get districtWest;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Champaran'**
  String get districtWestChamparan;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Garo Hills'**
  String get districtWestGaroHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Godavari'**
  String get districtWestGodavari;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Kameng'**
  String get districtWestKameng;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Khasi Hills'**
  String get districtWestKhasiHills;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Siang'**
  String get districtWestSiang;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Singhbhum'**
  String get districtWestSinghbhum;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'West Tripura'**
  String get districtWestTripura;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Wokha'**
  String get districtWokha;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Yamunanagar'**
  String get districtYamunanagar;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Yawatmal'**
  String get districtYawatmal;

  /// District name
  ///
  /// In en, this message translates to:
  /// **'Zunheboto'**
  String get districtZunheboto;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'as',
    'bn',
    'brx',
    'doi',
    'en',
    'gu',
    'hi',
    'kn',
    'kok',
    'ks',
    'mai',
    'ml',
    'mni',
    'mr',
    'ne',
    'or',
    'pa',
    'sa',
    'sat',
    'ta',
    'te',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'as':
      return AppLocalizationsAs();
    case 'bn':
      return AppLocalizationsBn();
    case 'brx':
      return AppLocalizationsBrx();
    case 'doi':
      return AppLocalizationsDoi();
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'kok':
      return AppLocalizationsKok();
    case 'ks':
      return AppLocalizationsKs();
    case 'mai':
      return AppLocalizationsMai();
    case 'ml':
      return AppLocalizationsMl();
    case 'mni':
      return AppLocalizationsMni();
    case 'mr':
      return AppLocalizationsMr();
    case 'ne':
      return AppLocalizationsNe();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'sa':
      return AppLocalizationsSa();
    case 'sat':
      return AppLocalizationsSat();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
