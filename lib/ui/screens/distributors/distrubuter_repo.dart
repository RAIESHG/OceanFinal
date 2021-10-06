import 'dart:convert';

import 'package:ocean_publication/model/distributorResponse/distributor_response.dart';
import 'package:ocean_publication/helpers/requests.dart';

class DistributorRepository {
  Future<DistributorResponse> getDistributerData() async {
    var response = await getRequest('/distributor');
    print(response.body);
    return distributorResponseFromJson(response.body);
  }
}
