import 'dart:convert';

import 'package:ocean_publication/model/homepageBannerResponse/homepageBannerResponse.dart';
import 'package:ocean_publication/model/homepageResponse/homepage_response.dart';
import 'package:ocean_publication/helpers/requests.dart';

class HomepageRepository {
  Future<HomepageResponse> getHomepageData() async {
    var response = await getRequest('/homepage');
    print(response.body);
    return homepageResponseFromMap(response.body);
  }

  Future<HomepageBannerResponse> getBanner() async {
    var response = await getRequest('/homepage/banner');
    var homepageResponse = HomepageBannerResponse.fromJson(json.decode(response.body));
    return homepageResponse;
  }
}
