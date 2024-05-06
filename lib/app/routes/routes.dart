import 'package:delosi_test/home/home.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const HomePage(),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
