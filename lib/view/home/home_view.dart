import 'package:ads/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      // work like initState
      onViewModelReady: (model) => model.loadAd(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Banner Ads"),
          ),
          body: const Center(
            child: Text("Google ads"),
          ),
          bottomNavigationBar: viewModel.isLoaded
              ? SizedBox(
                  height: viewModel.bannerAd.size.height.toDouble(),
                  width: viewModel.bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: viewModel.bannerAd),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
