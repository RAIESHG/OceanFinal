import 'package:get_it/get_it.dart';
import 'package:ocean_publication/services/sharedPref/local_storage_strategy.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;
Future setup() async {
  // locator.registerLazySingleton<Auth>(
  //     () => USE_FAKE_AUTH ? FakeAuth() : RealAuth());

  locator.registerSingleton<SnackbarService>(SnackbarService());
  locator.registerSingleton<NavigationService>(NavigationService());

  // locator.registerLazySingleton<LocalStorageStrategy>(() async { await SharedPreferencesService.getInstance();} );
  
  
  locator.registerSingleton<SharedPreferencesService>(
    await SharedPreferencesService.getInstance(),
  );


}
