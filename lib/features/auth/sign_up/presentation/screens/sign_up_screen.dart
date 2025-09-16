import 'package:ecommerce_c15_str/core/di/di.dart';
import 'package:ecommerce_c15_str/core/resources/color_manager.dart';
import 'package:ecommerce_c15_str/core/resources/styles_manager.dart';
import 'package:ecommerce_c15_str/core/resources/values_manager.dart';
import 'package:ecommerce_c15_str/core/routes_manager/routes.dart';
import 'package:ecommerce_c15_str/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_c15_str/core/widget/main_text_field.dart';
import 'package:ecommerce_c15_str/core/widget/validators.dart';
import 'package:ecommerce_c15_str/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => getIt<SignUpBloc>(),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.signUpRequestState == RequestState.success) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainRoute,
                      (route) => false,
                    );
                  } else if (state.signUpRequestState == RequestState.error) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(state.signUpFailure?.message ?? ""),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.s140.h),
                      BuildTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        controller: phoneController,
                        label: 'Mobile Number',
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your email address',
                        controller: emailController,
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your password',
                        controller: passwordController,
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s18.h),
                      BuildTextField(
                        hint: 'enter your re-password',
                        controller: rePasswordController,
                        backgroundColor: ColorManager.white,
                        label: 'rePassword',
                        validation: (_) =>
                            AppValidators.validateConfirmPassword(
                              passwordController.text.trim(),
                              rePasswordController.text.trim(),
                            ),
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: AppSize.s50.h),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child:
                              state.signUpRequestState == RequestState.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.white,
                                  ),
                                )
                              : CustomElevatedButton(
                                  // borderRadius: AppSize.s8,
                                  label: 'Sign Up',
                                  backgroundColor: ColorManager.white,
                                  textStyle: getBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s20,
                                  ),
                                  onTap: () {
                                    BlocProvider.of<SignUpBloc>(context).add(
                                      SignUpRequestEvent(
                                        nameController.text.trim(),
                                        phoneController.text.trim(),
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        rePasswordController.text.trim(),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
