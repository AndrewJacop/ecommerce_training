import 'package:ecommerce_training/core/controllers/login_controller/login_cubit.dart';
import 'package:ecommerce_training/core/controllers/login_controller/login_states.dart';
import 'package:ecommerce_training/core/managers/nav.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/local/cache_helper.dart';
import 'package:ecommerce_training/screens/modules/home.dart';
import 'package:ecommerce_training/screens/widgets/button.dart';
import 'package:ecommerce_training/screens/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginDone) {
          if (state.userModel.status == "success") {
            /// print(state.userModel.message);
            //showToast(state.userModel.message!, ToastStates.SUCCESS);
            /// print(state.userModel.user!.token);
            CacheHelper.saveData(
                    key: 'userId', value: state.userModel.user!.nationalId)
                .then((value) {
              nationalId = state.userModel.user!.nationalId;
            });
            CacheHelper.saveData(
              key: 'token',
              value: state.userModel.user!.token,
            ).then((value) {
              token = state.userModel.user!.token!;
              navigateAndFinishThisScreen(
                context,
                const HomeScreen(),
              );
            });
          } else {
            /// print(state.userModel.message);
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      DefaultFieldForm(
                        labelStyle: const TextStyle(color: Colors.black),
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        prefix: Icons.email,
                        hint: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(height: 15),
                      DefaultFieldForm(
                        labelStyle: const TextStyle(color: Colors.black),
                        controller: passwordController,
                        keyboard: TextInputType.visiblePassword,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.password,
                        hint: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        show: false,
                      ),
                      const SizedBox(height: 15),
                      DefaultButton(
                          backgroundColor: Colors.black,
                          borderColor: Colors.transparent,
                          buttonWidget: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                            navigateToNextScreen(context, const HomeScreen());
                          }),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
