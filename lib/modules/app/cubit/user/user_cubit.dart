import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medlike/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserAuthState> {
  UserCubit(this.userRepository) : super(const UserAuthState.unAuth());
  
  final UserRepository userRepository;
  
  Future<void> loginWithPassword(String phone, String password) async {
    const storage = FlutterSecureStorage();

    emit(const UserAuthState.loadingAuth());
    try {
      final response = await userRepository.signIn(
          phone: phone, password: password);
      await storage.write(key: 'accessToken', value: response.token);
      await storage.write(key: 'refreshToken', value: response.refreshToken);
      emit(UserAuthState.successAuth(response.token, response.refreshToken));
    } catch (e) {
      emit(UserAuthState.failureAuth(e.toString()));
    }
  }
}
