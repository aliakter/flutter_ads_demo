import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'home_screen.dart';

AppOpenAd? appOpenAd;
loadAppOpenAd() {
  AppOpenAd.load(
    adUnitId: "ca-app-pub-3940256099942544/3419835294",
    request: AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        appOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        print(error);
      },
    ),
    orientation: AppOpenAd.orientationPortrait,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  loadAppOpenAd();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ad',
      home: HomeScreen(),
    );
  }
}
