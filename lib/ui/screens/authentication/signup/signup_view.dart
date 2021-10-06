import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/auth_image_container.dart';
import 'package:ocean_publication/ui/screens/authentication/authentication_widgets.dart';
import 'package:sizer/sizer.dart';

import 'signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        onModelReady: (SignupViewModel model) {
          model.onModelReady(context);
        },
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            backgroundColor: Colors.transparent,
            body: AuthImageContainer(
              child: model.busy("object") == true
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator())
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: AuthenticationPresenter(
                        formType: FormType.signup,
                        firstnameController: model.firstnameController,
                        lastnameController: model.lastnameController,
                        emailController: model.emailController,
                        contactController: model.phonenumberController,
                        passwordController: model.passwordController,
                        confirmPasswordController:
                            model.confirmPasswordController,
                        onButtonTapped: () async {
                          //

                          await model.signup();
                        },
                      ),
                    ),
            ),
          );
        },
        viewModelBuilder: () => SignupViewModel());
  }
}
