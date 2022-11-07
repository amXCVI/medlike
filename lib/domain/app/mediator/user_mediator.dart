import 'package:medlike/domain/app/exceptions/invalid_refresh_token_error.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';

enum UserMediatorEvent {
  logout
}

mixin RefreshErrorHandler<S, T extends MediatorCubit> on MediatorCubit<S, UserMediatorEvent> {

  @override
  void receive(String from, UserMediatorEvent event) {
    throw UnimplementedError();
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    if(error is InvalidRefreshTokenError) {
      mediator?.sendTo<T>(this, UserMediatorEvent.logout);
    }
    print('error in bloc $error $stacktrace');

    super.onError(error, stacktrace);
  }

}

class UserMediator extends Mediator<UserMediatorEvent> {
  final List<MediatorCubit> _members = [];

  @override
  List<MediatorCubit> getAllMembers() {
    return _members;
  }

  @override
  void register(MediatorCubit member) {
    member.mediator = this;

    _members.add(member);
  }

  @override
  void send(MediatorCubit sender, UserMediatorEvent event) {
    final filteredMembers = _members.where((m) => m != sender);

    for (final member in filteredMembers) {
      member.receive(sender.toString(), event);
    }
  }

  @override
  void sendTo<C extends MediatorCubit>(MediatorCubit sender, UserMediatorEvent event) {
    final filteredMembers =
        _members.where((m) => m != sender).whereType<C>();

    for (final member in filteredMembers) {
      member.receive(sender.toString(), event);
    }
  }
}
