import 'dart:io';
import 'package:dio/dio.dart';
import '../../../models/models.dart';

abstract class IHomeService {
  final String path = '/api/users?page=2';

  IHomeService(this.dio);

  Future<UserModel?> getUser();
  final Dio dio;
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<UserModel?> getUser() async {
    final response = await dio.get(path);
    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(response.data);
    }
    return null;
  }
}
