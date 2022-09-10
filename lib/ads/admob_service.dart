import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }
  static BannerAd createBannerAds() {

    BannerAd banner = BannerAd(size: AdSize.banner, adUnitId: bannerAdUnitId, listener: BannerAdListener(

      onAdClicked: (Ad ad){
        print(ad);
      }

    ), request: AdRequest());

    return banner;

  }

  static intestialLoad() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
    // Keep a reference to the ad so you can show it later.
            // this._interstitialAd = ad;
            ad.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }


}
