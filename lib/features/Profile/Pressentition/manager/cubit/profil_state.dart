part of 'profil_cubit.dart';

@immutable
sealed class ProfilState {}

final class ProfilInitial extends ProfilState {}

final class ProfilLoding extends ProfilState {}

final class ProfilSuccssful extends ProfilState {
  final UserModel user;

  ProfilSuccssful({required this.user});
}

final class ProfilFailuer extends ProfilState {
  final String message;

  ProfilFailuer({required this.message});
}
