import 'dart:convert';

import 'package:ocean_publication/model/searchResponse/searchResponse.dart';
import 'package:ocean_publication/helpers/requests.dart';

class SearchRepository {
  Future<SearchModel> getSearchData(String searchTerm) async {
    var response = await postRequest('/search', body: {"data": searchTerm});
    print(response);
    return SearchModel.fromJson(json.decode(response.body));
  }
}
