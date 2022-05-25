import 'package:flutter/widgets.dart';
import 'package:medlike/utils/api/dio_client.dart';

// class UserRepository {
//   final _dio = Api().dio;
//
//   Future<Object> signInWithPassword({
//     @required required String phone,
//     @required required String password,
//   }) async {
//     try {
//       final response = await _dio.post('/api/v1.0/auth/token',
//           data: {'UserName': phone, 'Password': password});
//       if (response.statusCode == 200) {
//         var getUsersData = response.data as List;
//       }
//       return response.data;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> deleteToken() async {
//     /// delete from keystore/keychain
//     await Future.delayed(const Duration(seconds: 1));
//     return;
//   }
//
//   Future<void> persistToken(String token) async {
//     /// write to keystore/keychain
//     await Future.delayed(const Duration(seconds: 1));
//     return;
//   }
//
//   Future<bool> hasToken() async {
//     /// read from keystore/keychain
//     await Future.delayed(const Duration(seconds: 1));
//     return false;
//   }
// }
