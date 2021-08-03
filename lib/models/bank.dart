import 'package:equatable/equatable.dart';

class Bank extends Equatable {
  const Bank({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}
