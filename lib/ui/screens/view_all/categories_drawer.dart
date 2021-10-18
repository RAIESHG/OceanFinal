import 'package:flutter/material.dart';
import 'package:ocean_publication/model/viewAllResponse/view_all_bookResponse.dart';

import 'package:ocean_publication/model/viewAllResponse/view_all_response.dart';
import 'package:ocean_publication/ui/components/icon_image_component.dart';
import 'package:ocean_publication/helpers/colors.dart';
import 'package:ocean_publication/ui/components/widgets.dart';
import 'package:ocean_publication/ui/screens/view_all/view_all_viewmodel.dart';
import 'package:sizer/sizer.dart';

import 'package:stacked/stacked.dart';

class CategoriesDrawer extends ViewModelWidget<ViewAllViewmodel> {
  final dynamic results;
  CategoriesDrawer({required this.results});
  @override
  Widget build(BuildContext context, ViewAllViewmodel model) {
    return SafeArea(
      child: Container(
        width: 57.w,
        child: Drawer(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 30.h,
                width: double.infinity,
                color: colorPrimary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Assetimage(path: logo, height: 110),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
                      child: text(
                        "Categories",
                        textColor: Colors.white,
                        fontSize: 12.sp,
                        fontweight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  key: Key('builder ${model.expandedTile.toString()}'),
                  physics: BouncingScrollPhysics(),
                  itemCount: results.categories?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    try {
                     
                        return BuildExpansionTile(
                          category: results.categories![index],
                          initiallyExpanded: index == model.expandedTile,
                          index: index,
                        );
                    
                    } catch (e) {
                      return BuildExpansionTile(
                        category: results.categories![index][0],
                        initiallyExpanded: index == model.expandedTile,
                        index: index,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    model.changeActiveActegory(0);
                  },
                  child: text(
                    "Clear all",
                    textColor: whiteColor,
                    fontweight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  // backgroundColor: colorPrimary,
                  // label: text(
                  //   "Clear all",
                  //   textColor: whiteColor,
                  //   fontweight: FontWeight.w600,
                  //   fontSize: 12.sp,
                  // ), child: null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildExpansionTile extends ViewModelWidget<ViewAllViewmodel> {
  final Category category;
  final bool initiallyExpanded;
  final int index;

  const BuildExpansionTile(
      {Key? key,
      required this.category,
      required this.initiallyExpanded,
      required this.index})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, ViewAllViewmodel model) {
    return category != null
        ? ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            backgroundColor:
                initiallyExpanded ? Colors.grey.shade200 : Colors.white,
            onExpansionChanged: (bool value) {
//
            },
            // key: Key("$expandedTile"),
            title: Container(
              color: index != null && initiallyExpanded ? colorPrimary : null,
              constraints: BoxConstraints.expand(
                height: 35.0,
                width: double.infinity,
              ),
              child: Center(
                child: text(
                  "${category!.title}",
                  textColor: !initiallyExpanded ? colorPrimary : Colors.white,
                  fontweight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
            children: category!.childs!.map(
              (parentCategory) {
                if (parentCategory.childs!.length > 0) {
//
                  return Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: BuildExpansionTile(
                        category: parentCategory,
                        initiallyExpanded: false,
                        index: 0),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      model.changeActiveActegory(category!.id ?? 0);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 24.0),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        //second level title
                        child: text(
                          "${parentCategory.title}",
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  );
                }
              },
            ).toList(),
          )
        : Container();
  }
}
