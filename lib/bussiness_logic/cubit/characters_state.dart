part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoaded extends CharactersState {
  final List <Character> character;

  CharactersLoaded(this.character);
}
class QuotesLoaded extends CharactersState {
  final List <Quote> quote;

  QuotesLoaded(this.quote);
}
