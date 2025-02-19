import 'package:flutter/material.dart';

import '../../../../core/common/entities/user.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);

}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
