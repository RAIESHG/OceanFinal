import 'package:flutter/material.dart';
import 'package:ocean_publication/app/app.router.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/locator/locator.dart';
import 'package:ocean_publication/ui/components/auth_image_container.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/authentication/authentication_widgets.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_viewmodel.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onModelReady: (LoginViewModel model) {
          model.onModelReady(context);
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              key: model.scaffoldKey,
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                  child: Padding(
                        padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height*0.45,20,0),
                    child: Container(
                        width: 90.w,
                        height: 50.h,
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
                            textField(
                              controller: model.emailController,
                              title: "Email",
                              hintText: "user@mail.com",
                              onChanged: (value) {
              // print(value);
                              },
                            ),
                            textField(
                              controller: model.passwordController,
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
                navigationService
                    .navigateTo(Routes.forgotPasswordView);
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
                            SizedBox(height: 2.h),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
              height: 7.h,
              width: 60.w,
              child: 
              
              model.busy("object") == true ? Center(child: CircularProgressIndicator()) :
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: colorPrimary,
                ),
                onPressed: () {
                    model.login();
                },
                child: text(
                    "Login",
                    textColor: whiteColor,
                    fontSize: 13.sp,
                ),
              ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ),
                ),
            ),
          );
        },
        viewModelBuilder: () => LoginViewModel());
  }
}
