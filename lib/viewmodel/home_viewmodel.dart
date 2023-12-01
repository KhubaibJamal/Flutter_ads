import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  late BannerAd bannerAd;
  bool isLoaded = false;

  // load add method
  void loadAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: '',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isLoaded = true;
          rebuildUi();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
        },
      ),
      request: const AdRequest(),
    );
  }
}
