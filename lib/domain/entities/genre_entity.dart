import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  int id;
  String name;

  GenreEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
