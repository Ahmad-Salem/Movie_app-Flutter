import 'package:appname/data/models/Charaters.dart';
import 'package:appname/data/models/quotes.dart';
import 'package:appname/data/web_services/characters_api.dart';

class CharactersRepository {
  final charactersAPI charcters_api;

  CharactersRepository(this.charcters_api);
  Future<List<Characters_model>> getAllCharacters() async {
    final characters = await charcters_api.getAllCharacters();
    return characters
        .map((characters) => Characters_model.fromJson(characters))
        .toList();
  }

  Future<List<Quotes>> getAllCharactersQuotes(String charName) async {
    final quotes = await charcters_api.getAllCharactersQuotes(charName);
    return quotes.map((char_quote) => Quotes.fromJson(char_quote)).toList();
  }
}
