import 'package:ocean_publication/model/distributorResponse/distributor_response.dart';
import 'package:ocean_publication/ui/screens/distributors/distrubuter_repo.dart';
import 'package:stacked/stacked.dart';

class DistributerViewmodel extends BaseViewModel {
  //
  DistributorRepository _distributorRepository = DistributorRepository();
  DistributorResponse? _distributorResponse;
  List<DistributorData>? distributorData;
  Future<void> getDistributorData() async {
  
    setBusy(true);
    _distributorResponse = await _distributorRepository.getDistributerData();
    distributorData = _distributorResponse!.data;
    setBusy(false);
  }
}
