// import 'package:ocean_publication/locator/locator.dart' as locator;
// import 'package:ocean_publication/model/auth/login/loginResponse.dart';
// import 'package:ocean_publication/services/api/auth/auth.api.dart';
// import 'package:ocean_publication/services/api/auth/fake_auth.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:mockito/annotations.dart';
// import 'auth_service_test.mocks.dart';

// // @GenerateMocks([FakeApi])
// @GenerateMocks([], customMocks: [
//   MockSpec<FakeAuth>(as: #MocFakeAuth),
// ])
// void main() async {
//   group("service Test", () {
//     setUpAll(() {
//       locator.setup();
//       locator.locator.allowReassignment = true;
//     });

//     test("fake_api should not be null", () async {
//       // Api? api = locator.locator<Api>();
//       locator.locator.registerLazySingleton<Auth>(() => MocFakeAuth());
//       Auth api = locator.locator<Auth>();
//       // MocFakeAuth mockApi = MocFakeAuth();

//       // when(api.login(phone: "9860120715", password: "password")).thenAnswer((
//       //   realInvocation) => Future.value(LoginResponse((b)=>b..admin=false..email="raieshg@gmail.com"..id=1..phoneNumber="9860120715"..token="xyz")));
//       // when(api.login(phone: anyNamed("phone"), password: anyNamed("password"))).thenAnswer((realInvocation) => Future.value(LoginResponse((b)=>b..id="1"..token="wtf")));
//       LoginResponse test =
//           await api.login(phone: "9860120715", password: "password");
//       expect(test.admin, false);
//     });
//   });
// }
