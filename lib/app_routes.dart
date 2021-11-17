import 'package:appname/business_logic/cubit/characters_cubit.dart';
import 'package:appname/constants/strings.dart';
import 'package:appname/data/models/Charaters.dart';
import 'package:appname/data/repository/characters_repository.dart';
import 'package:appname/data/web_services/characters_api.dart';
import 'package:appname/presentation/screens/CharaterDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/screens/CharacterScreen.dart';

class App_routes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  App_routes() {
    charactersRepository = new CharactersRepository(new charactersAPI());
    charactersCubit = new CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterscreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: CharacterScreen(),
                ));
      case characterDetailScreeen:
        final character = settings.arguments as Characters_model;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: CharacterDetailsScreen(
                    character: character,
                  ),
                ));
    }
  }
}
