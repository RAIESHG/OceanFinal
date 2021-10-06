import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter_viewmodel.dart';
import 'package:ocean_publication/ui/screens/authentication/signup/signup_view.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:sizer/sizer.dart';
import 'login/login_view.dart';
import 'package:stacked/stacked.dart';

class AuthPresenter extends StatelessWidget {
  const AuthPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthPresenterViewModel>.reactive(
        onModelReady: (AuthPresenterViewModel model) {
          model.onModelReady();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  image: DecorationImage(
                    image: AssetImage(authBackgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Assetimage(path: logo, height: 60.h),
                      customButton(
                        context,
                        buttonTitle: "Signup",
                        showBorder: true,
                        dialogWidget: SignupView(),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      customButton(
                        context,
                        buttonTitle: "Login",
                        dialogWidget: LoginView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => AuthPresenterViewModel());
  }

  InkWell customButton(
    BuildContext context, {
    String? buttonTitle,
    Widget? dialogWidget,
    bool showBorder = false,
  }) {
    return InkWell(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (_, __, ___) {
            return Align(
              alignment: Alignment.bottomLeft,
              child: dialogWidget,
            );
          },
        );
      },
      child: Container(
        height: 6.h,
        width: 25.h,
        child: Center(
          child: text(
            "$buttonTitle",
            textColor: showBorder ? whiteColor : colorPrimary,
            fontweight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: 2.0),
          color: showBorder ? null : whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
