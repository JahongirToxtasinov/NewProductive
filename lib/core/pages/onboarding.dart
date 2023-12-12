import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/routes.dart';
import '../widgets/w_scale.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;

  int page = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WScale(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'SKIP',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.625,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  page = index;
                });
              },
              controller: pageController,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        OnboardingIcons.easyTimeManagement,
                      ),
                    ),
                    const Gap(60),
                    Text(
                      'Easy Time Management',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap(6),
                    Text(
                      'We help you stay organized and manage your day',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        OnboardingIcons.trackYourExpenses,
                      ),
                    ),
                    const Gap(60),
                    Text(
                      'Track Your Expense',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap(6),
                    Text(
                      'We help you organize your expenses easily and safely',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (page != 0)
                  WScale(
                    onTap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(OnboardingIcons.back),
                    ),
                  )
                else
                  const Gap(44),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: ExpandingDotsEffect(
                    activeDotColor: blue,
                    dotWidth: 8,
                    dotHeight: 8,
                    dotColor: blue.withOpacity(.32),
                    expansionFactor: 3,
                    spacing: 4,
                  ),
                ),
                WScale(
                  onTap: () {
                    if (page == 1) {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.loginScreen);
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(OnboardingIcons.next),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
