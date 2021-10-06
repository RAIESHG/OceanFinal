import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/components/textfielddecoration.dart';
import 'package:ocean_publication/ui/screens/profile/edit_profile/editProfileModel.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.9),
              appBar: appBarWithSearch(context),
              body: model.isBusy
                  ? Center(
                      child:  SpinKitWave(
                          color: colorPrimary,
                          itemCount: 8,
                        ),
                    )
                  : SingleChildScrollView(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 90, 20, 30),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: whiteColor,
                                    ),
                                    width: MediaQuery.of(context).size.width /
                                        0.25,
                                    height: 105.h,
                                    // height: MediaQuery.of(context).size.height,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 10, 8, 10),
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    model
                                                        .updateProfilePicture();
                                                  },
                                                  child: Text("Upload"))),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                model.firstNameController,
                                            onChanged: (val) {
                                              model.onFirstNameChanged(val);
                                            },
                                            validator: (val) {
                                              if (model.onFirstNameChanged(
                                                      val) ==
                                                  false) {
                                                return '';
                                              }
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.firstnamecolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.firstnamecolor,
                                                labelText: model.firstname,
                                                icon: Icons.person),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                model.lastNameController,
                                            onChanged: (val) {
                                              model.onLastNameChanged(val);
                                            },
                                            validator: (val) {
                                              if (model
                                                      .onLastNameChanged(val) ==
                                                  false) {
                                                return '';
                                              }
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.lastnamecolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.lastnamecolor,
                                                labelText: model.lastname,
                                                icon: Icons.person),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                model.phoneNumberController,
                                            onChanged: (val) {
                                              model.onPhoneNumberChanged(val);
                                            },
                                            validator: (val) {
                                              if (model.onPhoneNumberChanged(
                                                      val) ==
                                                  false) {
                                                return '';
                                              }
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.phcolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.phcolor,
                                                labelText: model.contactnumber,
                                                icon: Icons.phone),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: model.addressController,
                                            onChanged: (val) {
                                              model.onaddressChanged(val);
                                            },
                                            validator: (val) {
                                              if (model.onaddressChanged(val) ==
                                                  false) {
                                                return '';
                                              }
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.addresscolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.addresscolor,
                                                labelText: model.address,
                                                icon: Icons.location_on),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: model.emailController,
                                            onChanged: (val) {
                                              model.onEmailChanged(val);
                                            },
                                            validator: (val) {
                                              if (model.onEmailChanged(val) ==
                                                  false) {
                                                return '';
                                              }
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.emailcolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.emailcolor,
                                                labelText: model.email,
                                                icon: Icons.email),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            obscureText: true,
                                            textInputAction:
                                                TextInputAction.next,
                                            controller:
                                                model.passwordController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.passwordcolor,
                                                labelColor:
                                                    model.myFocusNode.hasFocus
                                                        ? Colors.blue
                                                        : model.passwordcolor,
                                                labelText: model.password,
                                                icon: Icons.password),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          TextFormField(
                                            obscureText: true,
                                            textInputAction:
                                                TextInputAction.done,
                                            controller:
                                                model.rePasswordController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: textfieldDecoration(
                                                borderAndIconColor:
                                                    model.confirmpasscolor,
                                                labelColor: model
                                                        .myFocusNode.hasFocus
                                                    ? Colors.blue
                                                    : model.confirmpasscolor,
                                                labelText:
                                                    model.confirmpassword,
                                                icon: Icons.lock),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  model.updateProfile();
                                                },
                                                child: Text('Submit'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  model.updatePassword();
                                                },
                                                child: Text('Change Password'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(children: <Widget>[
                            SizedBox(
                              height: 32,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  model.imgFromGallery();
                                },
                                child: Container(
                                  height: 20.h,
                                  width: 40.w,
                                  child: model.imageTemp != null
                                      ? Container(
                                          height: 22.h,
                                          width: 40.w,
                                          child: Image.file(
                                            model.imageTemp,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],),
                        ],
                      ),
                    ),
            ),

            // new Center(
            //   child: new Container(
            //     height: 95.h,
            //     child: new Card(
            //       color: Colors.white,
            //       elevation: 6.0,
            //       margin: EdgeInsets.only(right: 15.0, left: 15.0),

            //     ),
            //     padding: EdgeInsets.only(bottom: 30),
            //   ),
            // ),
          );
        },
        viewModelBuilder: () => EditProfileViewModel());
  }
}
