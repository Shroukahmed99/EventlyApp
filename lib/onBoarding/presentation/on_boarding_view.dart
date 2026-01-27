import 'package:evently_app/Home/presentation/views/home_view.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/constants/app_colors.dart';
import 'package:evently_app/core/utils/extensions.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/onBoarding/data/models/on_boarding_model.dart';
import 'package:evently_app/onBoarding/presentation/widgets/active_dot_indicator.dart';
import 'package:evently_app/onBoarding/presentation/widgets/content_scroll_on_boarding.dart';
import 'package:evently_app/onBoarding/presentation/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});
  static String routeName = "onBoarding";

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = [
      OnBoardingModel(
        image: AppAssets.onboarding2,
        title: AppLocalizations.of(context)!.onboard_connect_title,
        subTitle: AppLocalizations.of(context)!.onboard_connect_desc,
      ),
      OnBoardingModel(
        image: AppAssets.onboarding3,
        title: AppLocalizations.of(context)!.onboard_find_events_title,
        subTitle: AppLocalizations.of(context)!.onboard_find_events_desc,
      ),
      OnBoardingModel(
        image: AppAssets.onboarding4,
        title: AppLocalizations.of(context)!.onboard_planning_title,
        subTitle: AppLocalizations.of(context)!.onboard_planning_desc,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: context.height * .01),

              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.logoRow,
                  height: context.height * 0.07,
                  width: context.width * 0.35,
                ),
              ),
              SizedBox(height: context.height * .03),
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingList.length,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingList[index];

                    return ContentScrollOnBoarding(
                      image: item.image,
                      title: item.title,
                      subTitle: item.subTitle,
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.01,
                        ),
                        child: currentIndex == index
                            ? AtiveDotsIndicator()
                            : DotsIndicator(),
                      );
                    }),
                  ),

                  Spacer(),

                  GestureDetector(
                    onTap: () {
                     
                     
                      setState(() {
                         if (currentIndex == onboardingList.length-1) {
                        context.pushNamed(HomeView.routeName);
                      }else{
                         controller!.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                      }
                      });
                    },
                    child: Container(
                      width: context.width * 0.11,
                      height: context.width * 0.11,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: AppColors.primaryLight,
                        ),
                      ),

                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.primaryLight,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.height * .05),
            ],
          ),
        ),
      ),
    );
  }
}
