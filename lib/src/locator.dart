import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../firebase_options.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Remove '#' sign in url
  usePathUrlStrategy();

  await Future.wait([
    _initFirebaseServices(),
    _initPayment(),
  ]);
}

Future<void> _initPayment() async {
  Stripe.publishableKey =
      const String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
}

Future<void> _initFirebaseServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    if (!kIsWeb) {
      // Only send error to Firebase Crashlytics when not in debug mode.
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  });
}
