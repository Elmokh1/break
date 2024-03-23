import 'package:bloc/bloc.dart';
import 'package:breake/data/models/Quotes.dart';
import 'package:meta/meta.dart';

import '../data/repository/quotes_repostory.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepository quoteRepository;
  List<Quote> quote = [];
  QuoteCubit(this.quoteRepository) : super(QuoteInitial());

  void getQuotes(){
    quoteRepository.getAllQuote().then((quote){
      emit(QuotesLoaded(quote));
    });
  }
}

