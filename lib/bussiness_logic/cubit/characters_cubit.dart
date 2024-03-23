import 'package:bloc/bloc.dart';
import 'package:breake/data/models/Quotes.dart';
import 'package:breake/data/models/characters_model.dart';
import 'package:meta/meta.dart';

import '../../data/repository/characters_repostory.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
 final CharactersRepository charactersRepository;
  List<Character> character = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters(){
     charactersRepository.getAllCharacter().then((character){
      emit(CharactersLoaded(character));
      this.character = character;
    });
     return character;
  }
}
