import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';
import '../service/service.dart';

class HomeController extends ChangeNotifier {
  late HomeService homeService;
  final _baseUrl = 'https://reqres.in';
  UserModel? userModel;
  List listUserModel = [];

  HomeController() {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    homeService = HomeService(dio);
  }

  Future<void> getUserList() async {
    final response = await homeService.getUser();
    if (response != null) {
      userModel = response;
      getList();
    }
  }

  void getList() {
    List<Data?> temp = [];
    for (int i = 0; i < userModel!.data!.length; i++) {
      temp.add(userModel!.data![i]);
    }
    listUserModel = temp;
    notifyListeners();
  }
}

final homeControllerProvider = ChangeNotifierProvider((ref) => HomeController());
