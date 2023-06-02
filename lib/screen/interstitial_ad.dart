// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialScreen extends StatefulWidget {
  const InterstitialScreen({super.key});

  @override
  State<InterstitialScreen> createState() => _InterstitialScreenState();
}

class _InterstitialScreenState extends State<InterstitialScreen> {
  final interstitial = InterstitialAd.load(
    adUnitId: Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/1033173712'
        : 'ca-app-pub-3940256099942544/4411468910',
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        ad.show();
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('InterstitialAd faild to load: $error');
      },
    ),
  );

  @override
  void initState() {
    interstitial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text("Interstitial"),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }

  @override
  void dispose() {
    interstitial;
    super.dispose();
  }
}
