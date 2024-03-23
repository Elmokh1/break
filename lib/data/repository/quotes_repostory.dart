import 'package:breake/data/models/Quotes.dart';
import 'package:breake/data/models/Quotes.dart';
import 'package:breake/data/web_services/characters_web_services.dart';
import 'package:breake/data/web_services/quote_web_services.dart';
import 'package:flutter/widgets.dart';
import '../models/characters_model.dart';
class QuoteRepository{

  final QuoteWebServices quoteWebServices;


  QuoteRepository(this.quoteWebServices);
  Future<List<Quote>> getAllQuote() async {
    final quote = await quoteWebServices.getAllQuotes();
    return quote.map((text) => Quote.fromJson(text)).toList();
  }

}