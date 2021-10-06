import 'package:flutter/material.dart';
import 'package:ocean_publication/ui/components/constant_widgets/appbarView.dart';
import 'package:ocean_publication/ui/screens/contact_us/contact_us_view_model.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return ViewModelBuilder<ContactUsViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: appBarWithSearch(context, title: 'Contact Us'),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              //
              children: [
                //

                // 10.heightBox,
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                // 10.heightBox,
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                // 10.heightBox,
                TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                // 10.heightBox,
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                // 10.heightBox,
                Container(
                  // height: context.screenWidth / 10,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: theme.button!.fontSize! + 5,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        viewModelBuilder: () => ContactUsViewModel());
  }
}
