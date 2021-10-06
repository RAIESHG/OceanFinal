import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/auth_image_container.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/authentication/authentication_widgets.dart';
import 'package:ocean_publication/ui/screens/authentication/forgot_password/forgot_password_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        onModelReady: (ForgotPasswordViewModel model) {
          // model.onModelReady(context);
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              key: model.scaffoldKey,
              backgroundColor: Colors.transparent,
              body: AuthImageContainer(
                // height: 60.h,
                child: model.isBusy
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SpinKitWave(
                          color: colorPrimary,
                          itemCount: 8,
                        ),)
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          child: Container(
                            width: 70.w,
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
                                  // controller: emailController,
                                  title: "Email",
                                  hintText: "user@mail.com",
                                  onChanged: (value) {
                                    // print(value);
                                  },
                                ),
                                SizedBox(height: 0.05.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    height: 7.h,
                                    width: 60.w,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: colorPrimary,
                                      ),
                                      onPressed: () {},
                                      child: text(
                                        "Send",
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
            ),
          );
        },
        viewModelBuilder: () => ForgotPasswordViewModel());
  }
}
