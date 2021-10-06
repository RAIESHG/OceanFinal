import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_services/stacked_services.dart';

enum FormType {
  login,
  signup,
}

class AuthenticationPresenter extends StatelessWidget {
  final VoidCallback? onButtonTapped;
  final FormType? formType;
  final TextEditingController? firstnameController;
  final TextEditingController? lastnameController;
  final TextEditingController? emailController;
  final TextEditingController? contactController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  AuthenticationPresenter({
    this.onButtonTapped,
    this.formType,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.firstnameController,
    this.lastnameController,
    this.contactController,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 90.w,
        height: 82.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 5.0), //(x,y)
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (formType == FormType.login) ...[
              textField(
                controller: emailController,
                title: "Email",
                hintText: "user@mail.com",
                onChanged: (value) {
                  // print(value);
                },
              ),
              textField(
                controller: passwordController,
                title: "Password",
                obscureText: true,
                hintText: "*" * 7,
                onChanged: (value) {
                  // print(value);
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    NavigationService navigationService =
                        locator<NavigationService>();
                    navigationService.navigateTo(Routes.forgotPasswordView);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    child: text(
                      "Forgot password?",
                      textColor: greyColor,
                    ),
                  ),
                ),
              ),
            ],
            if (formType == FormType.signup) ...[
              textField(
                  controller: firstnameController,
                  title: 'First Name',
                  onChanged: (value) {}),
              textField(
                controller: lastnameController,
                title: "Last Name",
                hintText: "",
                onChanged: (value) {
                  // print(value);
                },
              ),
              textField(
                controller: emailController,
                title: "Email",
                hintText: "",
                onChanged: (value) {
                  // print(value);
                },
              ),
              textField(
                controller: contactController,
                title: "Phone Number",
                hintText: "",
                onChanged: (value) {
                  // print(value);
                },
              ),
              textField(
                controller: passwordController,
                title: "Password",
                obscureText: true,
                hintText: "*" * 7,
                onChanged: (value) {
                  print(value);
                },
              ),
              textField(
                controller: confirmPasswordController,
                title: "Confirm Password",
                obscureText: true,
                hintText: "*" * 7,
                onChanged: (value) {
                  print(value);
                },
              ),
            ],
            SizedBox(height: 2.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 7.h,
                width: 60.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: colorPrimary,
                  ),
                  onPressed: onButtonTapped,
                  child: text(
                    formType == FormType.login ? "Login" : "Signup",
                    textColor: whiteColor,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
