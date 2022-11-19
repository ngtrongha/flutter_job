import 'package:flutter_job/screens/add_edit/add_edit_trip.dart';
import 'package:get/get.dart';

import '../home/home.dart';

class RouterManager {
  static List<GetPage<dynamic>> getPages = [
    GetPage(name: HomeScreen.path, page: () => const HomeScreen()),
    GetPage(
        name: AddEditTripScreen.path, page: () => const AddEditTripScreen()),
  ];
}
