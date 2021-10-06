import 'package:flutter_launcher_icons/constants.dart';
import 'package:image_picker/image_picker.dart';

class MultiImagePickerList {
  static List getList({List<XFile>? image}) {
    if (image == null) {
      throw errorMissingImagePath;
    }
    List imageFileList = [];
    for (int i = 0; i < image.length; i++) {
      image[i].readAsBytes().then((value) => imageFileList.add(value));
    }
    return imageFileList;
  }


}