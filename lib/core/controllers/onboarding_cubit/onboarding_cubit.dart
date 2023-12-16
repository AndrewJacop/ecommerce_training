import 'package:ecommerce_training/core/controllers/onboarding_cubit/onboarding_states.dart';
import 'package:ecommerce_training/core/managers/nav.dart';
import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/screens/modules/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitState());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  bool isLastPage = false;
  int pageIndex = 0;

  void pageLast(index) {
    isLastPage = true;
    pageIndex = index;
    emit(LastPage());
  }

  void pageNotLast(index) {
    isLastPage = false;
    pageIndex = index;

    /// print(pageIndex);
    emit(NotLastPage());
  }

  void submit(context) {
    CacheHelper.saveData(key: 'Boarding', value: true)
        .then((value) => navigateToNextScreen(context, const RegisterScreen()));
  }
}
