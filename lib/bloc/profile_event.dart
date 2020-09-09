part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetUser extends ProfileEvent {
  final String userName;
  GetUser(this.userName);
}
