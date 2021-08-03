import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Account extends Equatable {
  const Account({required this.name});

  final String name;
  @override
  List<Object?> get props => [name];
}
