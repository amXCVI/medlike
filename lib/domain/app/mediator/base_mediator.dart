import 'package:bloc/bloc.dart';

abstract class MediatorCubit<T, E> extends Cubit<T> {
  Mediator? mediator;

  MediatorCubit(T t, Mediator? mediator) : super(t);

  void receive(String from, E event);
}

abstract class Mediator<T> {
  List<MediatorCubit> getAllMembers();

  void register(MediatorCubit member);

  void send(MediatorCubit sender, T event);

  void sendTo<C extends MediatorCubit>(MediatorCubit sender, T event);
}
