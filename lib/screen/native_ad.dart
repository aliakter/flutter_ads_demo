import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({super.key});

  @override
  State<NativeScreen> createState() => _NativeScreenAdState();
}

class _NativeScreenAdState extends State<NativeScreen> {
  NativeAd? nativeAd;
  bool isNativeAdLoaded = false;

  @override
  void didChangeDependencies() {
    loadNativeAd();
    super.didChangeDependencies();
  }

  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId: "listTileMedium",
      listener: NativeAdListener(onAdLoaded: (ad) {
        setState(() {
          isNativeAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        nativeAd!.dispose();
      }),
      request: const AdRequest(),
    );
    nativeAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text("Native"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isNativeAdLoaded
                ? Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 300,
                    child: AdWidget(
                      ad: nativeAd!,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
