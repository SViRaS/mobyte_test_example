import 'package:mobyte_first_example/feature/presentation/pages/wish_list_screen/wish_list_screen.dart';

import '../feature/presentation/pages/guest_list_screen/list_guest_screen.dart';
import '../feature/presentation/pages/my_home_page_screen/my_home_page_screen.dart';

final routes = {
  '/my_home_page': (context) => const MyHomePageScreen(),
  '/guest_list_page': (context) => const ListGuestScreen(),
  '/wish_list_page': (context) => const WishListScreen(),
};
