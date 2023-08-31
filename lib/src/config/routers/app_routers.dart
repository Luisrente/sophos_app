import 'package:go_router/go_router.dart';
import '/src/presentation/screens/screens.dart';


GoRouter appRouter = GoRouter(
  initialLocation: '/post',
  routes: [
     
  GoRoute(
  path: '/movie',
  builder: (context, state) => const MovieScreen(),
),

  GoRoute(
    path: '/post',
    builder: (context, state) => const PostScreen(),
  ),
          
  ]
);


