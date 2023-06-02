import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../config/adhelper_id.dart';

class BannarScreen extends StatefulWidget {
  const BannarScreen({Key? key}) : super(key: key);

  @override
  State<BannarScreen> createState() => _BannarScreenState();
}

class _BannarScreenState extends State<BannarScreen> {
  final BannerAd bannerAd = BannerAd(
    size: AdSize.banner,
    adUnitId: AdHelper.bannerAdUnitId,
    request: AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (ad) => print('Ad loaded.'),
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print('Ad failed to load: $error');
      },
      onAdOpened: (Ad ad) => print('Ad Opened.'),
      onAdClosed: (Ad ad) => print('Ad closed.'),
      onAdImpression: (Ad ad) => print('Ad impression.'),
    ),
  );

  @override
  void initState() {
    bannerAd.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text("Banner"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.maxFinite,
              child: AdWidget(ad: bannerAd),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }
}
