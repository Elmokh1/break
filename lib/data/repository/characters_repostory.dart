import 'package:breake/data/web_services/characters_web_services.dart';
import 'package:flutter/widgets.dart';
import '../models/characters_model.dart';
class CharactersRepository{

  final CharacterWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);
  Future<List<Character>> getAllCharacter() async{
    final characters = await characterWebServices.getAllCharacter();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}