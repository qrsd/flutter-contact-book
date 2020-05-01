import 'package:equatable/equatable.dart';

/// Abstract of links events.
abstract class LinksEvent extends Equatable {
  /// Constructor
  const LinksEvent();

  @override
  List<Object> get props => [];
}

/// Event fires when a link is requested.
class LinksLoadEvent extends LinksEvent {
  /// [nodeCode] used to find links
  final String nodeCode;

  /// Constructor
  LinksLoadEvent(this.nodeCode);

  @override
  List<Object> get props => [nodeCode];
}

/// Event fires when a POST occurs
class LinksPostEvent extends LinksEvent {
  /// New user [firstName]
  final String firstName;

  /// New user [surName]
  final String surName;

  /// New user[email]
  final String email;

  /// New user [password]
  final String password;

  /// New user [birthday]
  final String birthday;

  /// New user [gender]
  final String gender;

  /// Constructor
  LinksPostEvent(this.firstName, this.surName, this.email, this.password,
      this.birthday, this.gender);

  @override
  List<Object> get props =>
      [firstName, surName, email, password, birthday, gender];
}
