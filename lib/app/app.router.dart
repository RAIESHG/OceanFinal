// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../model/authors/authors.dart';
import '../ui/components/pdf%20viewer/pdfview.dart';
import '../ui/components/search/search_view.dart';
import '../ui/screens/aboutBook/aboutBookView.dart';
import '../ui/screens/authentication/auth_presenter.dart';
import '../ui/screens/authentication/forgot_password/forgot_password_view.dart';
import '../ui/screens/authentication/login/login_view.dart';
import '../ui/screens/authentication/signup/signup_view.dart';
import '../ui/screens/authors/author_profile_view.dart';
import '../ui/screens/bookdetail/book_detail_view.dart';
import '../ui/screens/cart/cart_view.dart';
import '../ui/screens/checkout/checkout_view.dart';
import '../ui/screens/dashboard/homepage/homepage_view.dart';
import '../ui/screens/details/details_view.dart';
import '../ui/screens/history/history_by_id/history_by_id.dart';
import '../ui/screens/myOrders/my_orders_view.dart';
import '../ui/screens/profile/edit_profile/editProfile.dart';
import '../ui/screens/profile/view_profile/profile_view.dart';
import '../ui/screens/saveCourses/saved_course_view.dart';
import '../ui/screens/view_all/view_all_view.dart';

class Routes {
  static const String homepageView = '/';
  static const String loginView = '/login-view';
  static const String searchView = '/search-view';
  static const String viewAllView = '/view-all-view';
  static const String detailsObjView = '/details-obj-view';
  static const String bookDetailView = '/book-detail-view';
  static const String checkoutView = '/checkout-view';
  static const String cartView = '/cart-view';
  static const String authorProfileView = '/author-profile-view';
  static const String profileView = '/profile-view';
  static const String signupView = '/signup-view';
  static const String aboutBookView = '/about-book-view';
  static const String pdfView = '/pdf-view';
  static const String editProfileView = '/edit-profile-view';
  static const String myOrdersView = '/my-orders-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String historyByIdView = '/history-by-id-view';
  static const String savedCourseView = '/saved-course-view';
  static const String authPresenter = '/auth-presenter';
  static const all = <String>{
    homepageView,
    loginView,
    searchView,
    viewAllView,
    detailsObjView,
    bookDetailView,
    checkoutView,
    cartView,
    authorProfileView,
    profileView,
    signupView,
    aboutBookView,
    pdfView,
    editProfileView,
    myOrdersView,
    forgotPasswordView,
    historyByIdView,
    savedCourseView,
    authPresenter,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homepageView, page: HomepageView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.viewAllView, page: ViewAllView),
    RouteDef(Routes.detailsObjView, page: DetailsObjView),
    RouteDef(Routes.bookDetailView, page: BookDetailView),
    RouteDef(Routes.checkoutView, page: CheckoutView),
    RouteDef(Routes.cartView, page: CartView),
    RouteDef(Routes.authorProfileView, page: AuthorProfileView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.aboutBookView, page: AboutBookView),
    RouteDef(Routes.pdfView, page: PdfView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.myOrdersView, page: MyOrdersView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.historyByIdView, page: HistoryByIdView),
    RouteDef(Routes.savedCourseView, page: SavedCourseView),
    RouteDef(Routes.authPresenter, page: AuthPresenter),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomepageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomepageView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchView(),
        settings: data,
      );
    },
    ViewAllView: (data) {
      var args = data.getArgs<ViewAllViewArguments>(
        orElse: () => ViewAllViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewAllView(
          key: args.key,
          type: args.type,
        ),
        settings: data,
      );
    },
    DetailsObjView: (data) {
      var args = data.getArgs<DetailsObjViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailsObjView(
          key: args.key,
          object: args.object,
        ),
        settings: data,
      );
    },
    BookDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BookDetailView(),
        settings: data,
      );
    },
    CheckoutView: (data) {
      var args = data.getArgs<CheckoutViewArguments>(
        orElse: () => CheckoutViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CheckoutView(
          key: args.key,
          item: args.item,
        ),
        settings: data,
      );
    },
    CartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CartView(),
        settings: data,
      );
    },
    AuthorProfileView: (data) {
      var args = data.getArgs<AuthorProfileViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthorProfileView(
          key: args.key,
          authorData: args.authorData,
        ),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignupView(),
        settings: data,
      );
    },
    AboutBookView: (data) {
      var args = data.getArgs<AboutBookViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutBookView(
          key: args.key,
          object: args.object,
        ),
        settings: data,
      );
    },
    PdfView: (data) {
      var args = data.getArgs<PdfViewArguments>(
        orElse: () => PdfViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PdfView(
          key: args.key,
          url: args.url,
        ),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditProfileView(),
        settings: data,
      );
    },
    MyOrdersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MyOrdersView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordView(),
        settings: data,
      );
    },
    HistoryByIdView: (data) {
      var args = data.getArgs<HistoryByIdViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => HistoryByIdView(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
    SavedCourseView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SavedCourseView(),
        settings: data,
      );
    },
    AuthPresenter: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthPresenter(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ViewAllView arguments holder class
class ViewAllViewArguments {
  final Key? key;
  final Object? type;
  ViewAllViewArguments({this.key, this.type});
}

/// DetailsObjView arguments holder class
class DetailsObjViewArguments {
  final Key? key;
  final dynamic object;
  DetailsObjViewArguments({this.key, required this.object});
}

/// CheckoutView arguments holder class
class CheckoutViewArguments {
  final Key? key;
  final dynamic item;
  CheckoutViewArguments({this.key, this.item});
}

/// AuthorProfileView arguments holder class
class AuthorProfileViewArguments {
  final Key? key;
  final AuthorData authorData;
  AuthorProfileViewArguments({this.key, required this.authorData});
}

/// AboutBookView arguments holder class
class AboutBookViewArguments {
  final Key? key;
  final dynamic object;
  AboutBookViewArguments({this.key, required this.object});
}

/// PdfView arguments holder class
class PdfViewArguments {
  final Key? key;
  final dynamic url;
  PdfViewArguments({this.key, this.url});
}

/// HistoryByIdView arguments holder class
class HistoryByIdViewArguments {
  final Key? key;
  final dynamic id;
  HistoryByIdViewArguments({this.key, required this.id});
}
