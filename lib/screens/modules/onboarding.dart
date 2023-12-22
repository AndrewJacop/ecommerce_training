import 'package:ecommerce_training/core/controllers/onboarding_controller/onboarding_states.dart';
import 'package:ecommerce_training/core/controllers/onboarding_controller/onboarding_cubit.dart';
import 'package:ecommerce_training/core/managers/lists.dart';
import 'package:ecommerce_training/screens/widgets/build_onboarding_item.dart';
import 'package:ecommerce_training/screens/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var onboardingController = PageController();
        var cubit = OnboardingCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "App Name",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 450,
                child: PageView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      buildOnboardingItem(onboardingList[index]),
                  controller: onboardingController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    index == onboardingList.length - 1
                        ? cubit.pageLast(index)
                        : cubit.pageNotLast(index);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: cubit.isLastPage
                    ? DefaultButton(
                        backgroundColor: Colors.black,
                        buttonWidget: const Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white),
                        ),
                        function: () {
                          cubit.submit(context);
                        },
                      )
                    : DefaultButton(
                        backgroundColor: Colors.black,
                        buttonWidget: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                        function: () {
                          onboardingController.nextPage(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(milliseconds: 750));
                        },
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
