import 'package:flutter/material.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';

import 'package:stacked/stacked.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
        onModelReady: (
            BottomNavigationViewModel model
        ) {

        },
        builder: (context, model, child) {
          return Container(
            height: 7.5.h,
            child: BottomNavigationBar(
                backgroundColor: Color(0xffDEDBDB),
                showUnselectedLabels: true,
                onTap: (index) async {
                  model.onPageChange(index);
                },
                currentIndex: 0,
                selectedItemColor: colorPrimary,
                unselectedItemColor: colorPrimary,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                items: [
                  BottomNavigationBarItem(
                    icon: IconWidget(path: homeIcon, color: Color(0xff005AAA)),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: IconWidget(path:libraryIcon, color: Color(0xff005AAA)),
                    label: "My library",
                  ),
                
                  BottomNavigationBarItem(
                      icon: IconWidget(path: userIcon, color: Color(0xff005AAA)),
                      label: "Profile"),
                ]),
          );
        },
        viewModelBuilder: () => BottomNavigationViewModel());
  }
}
