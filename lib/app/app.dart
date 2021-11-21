import 'package:ocean_publication/ui/components/pdf%20viewer/pdfview.dart';
import 'package:ocean_publication/ui/components/search/search_view.dart';
import 'package:ocean_publication/ui/screens/aboutBook/aboutBookView.dart';
import 'package:ocean_publication/ui/screens/authentication/auth_presenter.dart';
import 'package:ocean_publication/ui/screens/authentication/forgot_password/forgot_password_view.dart';
import 'package:ocean_publication/ui/screens/authentication/login/login_view.dart';
import 'package:ocean_publication/ui/screens/authentication/signup/signup_view.dart';
import 'package:ocean_publication/ui/screens/authors/author_profile_view.dart';
import 'package:ocean_publication/ui/screens/bookdetail/book_detail_view.dart';
import 'package:ocean_publication/ui/screens/cart/cart_view.dart';
import 'package:ocean_publication/ui/screens/checkout/checkout_view.dart';
import 'package:ocean_publication/ui/screens/dashboard/homepage/homepage_view.dart';
import 'package:ocean_publication/ui/screens/details/details_view.dart';
import 'package:ocean_publication/ui/screens/history/history_by_id/history_by_id.dart';
import 'package:ocean_publication/ui/screens/lets_explore/lets_explore_view.dart';
import 'package:ocean_publication/ui/screens/myOrders/my_orders_view.dart';
import 'package:ocean_publication/ui/screens/profile/edit_profile/editProfile.dart';
import 'package:ocean_publication/ui/screens/profile/view_profile/profile_view.dart';
import 'package:ocean_publication/ui/screens/saveCourses/saved_course_view.dart';

import 'package:ocean_publication/ui/screens/view_all/view_all_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomepageView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(
    page: SearchView,
  ),
  MaterialRoute(
    page: ViewAllView,
  ),
  MaterialRoute(
    page: DetailsObjView,
  ),
  MaterialRoute(
    page: BookDetailView,
  ),
  MaterialRoute(
    page: CheckoutView,
  ),
  MaterialRoute(
    page: CartView,
  ),
  MaterialRoute(
    page: AuthorProfileView,
  ),
  MaterialRoute(
    page: ProfileView,
  ),
  MaterialRoute(
    page: SignupView,
  ),
  MaterialRoute(
    page: AboutBookView,
  ),
  MaterialRoute(page: PdfView),
  MaterialRoute(page: EditProfileView),
  MaterialRoute(page: MyOrdersView),
  MaterialRoute(
    page: ForgotPasswordView,
  ),
 
  MaterialRoute(page: HistoryByIdView),
  MaterialRoute(page: SavedCourseView),
  MaterialRoute(page: AuthPresenter),
  
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
