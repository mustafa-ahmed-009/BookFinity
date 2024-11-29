import 'package:bookly/features/home/presenation/views/widgets/book_details/book_detials_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view.dart';
import 'package:bookly/features/splash/presentation/manager/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetialsView(),
      ),
    ],
  );
}
