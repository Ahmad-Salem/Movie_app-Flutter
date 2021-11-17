import 'package:appname/data/models/Charaters.dart';
import 'package:appname/data/models/quotes.dart';
import 'package:appname/data/repository/characters_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Characters_model> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Characters_model> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getAllCharactersQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
      this.characters = characters;
    });
  }
}
