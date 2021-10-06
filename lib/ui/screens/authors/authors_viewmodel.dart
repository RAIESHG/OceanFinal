import 'package:ocean_publication/model/authors/authors.dart';
import 'package:ocean_publication/helpers/requests.dart';
import 'package:stacked/stacked.dart';

class AuthorsViewmodel extends BaseViewModel {
  Author? authors;
  Future<void> getAuthors() async {
    setBusy(true);
    var response = await getRequest("/authors");
    authors = authorFromMap(response.body);
    setBusy(false);
    notifyListeners();
  }
}
