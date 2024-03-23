import 'package:breake/bussiness_logic/cubit/characters_cubit.dart';
import 'package:breake/bussiness_logic/quote_cubit.dart';
import 'package:breake/data/models/Quotes.dart';
import 'package:breake/data/repository/characters_repostory.dart';
import 'package:breake/data/repository/quotes_repostory.dart';
import 'package:breake/data/web_services/characters_web_services.dart';
import 'package:breake/data/web_services/quote_web_services.dart';
import 'package:breake/peresentation/screens/charecters_details_screen.dart';
import 'package:breake/peresentation/screens/charecters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/string.dart';
import 'data/models/characters_model.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  late QuoteRepository quoteRepository;
  late QuoteCubit quoteCubit;


  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
    quoteRepository = QuoteRepository(QuoteWebServices());
    quoteCubit= QuoteCubit(quoteRepository);

  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: CharactersScreen(),
              ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (BuildContext context) => quoteCubit,
                child: CharactersDetailsScreen(character: character),
              ),
        );
    }
  }
}
