import 'dart:developer';

import 'package:dio/dio.dart';

import './auth_repository.dart';
import '../../core/core.dart';
import '../../models/models.dart';

class AuthRepositoryImpl implements AuthRepository {

  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login({required String email, required String password,}) async {
    try{
      var data = {
        'email': email,
        'password': password,
      };
      final result = await dio.post(
        'api/auth',
        data: data,
      );
      final accessToken = result.data['access_token'];
      if(accessToken == null){
        throw UnauthorizedException;
      }else{
        return accessToken;
      }
    }on DioError catch(e,s){
       log('Erro ao realizar login', error: e, stackTrace: s);
       if(e.response?.statusCode ==401){
         throw UnauthorizedException();
       }
       throw RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerUser) async {
   try{
     await dio.unAuth().post(
       '/api/register',
       data: registerUser.toMap(),
     );
   } on DioError catch(e,s){
     log('Erro ao registrar usuário',error: e, stackTrace: s);
     throw RepositoryException(message: 'Erro ao registrar usuário');
   }
  }

}