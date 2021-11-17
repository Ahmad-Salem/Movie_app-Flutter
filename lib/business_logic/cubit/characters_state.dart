part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoaded extends CharactersState {
  final List<Characters_model> characters;

  CharacterLoaded(this.characters);
}

class QuotesLoaded extends CharactersState {
  final List<Quotes> quotes;

  QuotesLoaded(this.quotes);
}
