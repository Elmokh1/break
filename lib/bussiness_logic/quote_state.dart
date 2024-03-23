part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}
class QuotesLoaded extends QuoteState {
  final List <Quote> quote;
  QuotesLoaded(this.quote);
}