import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appname/business_logic/cubit/characters_cubit.dart';
import 'package:appname/constants/my_colors.dart';
import 'package:appname/data/models/Charaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Characters_model character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  // const CharacterDetailsScreen({Key? key}) : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.Gray,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.White),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              color: MyColors.White, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        TextSpan(
          text: value,
          style: TextStyle(color: MyColors.White, fontSize: 16),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.Yellow,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuotesOrEmptySpace(state);
    } else {
      return showProgressBarIndicator();
    }
  }

  Widget displayRandomQuotesOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.White,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.Yellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote)
            ],
            repeatForever: true,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressBarIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.Yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.Gray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jobs.join(' / ')),
                      buildDivider(315),
                      characterInfo(
                          'Appeared in : ', character.actegoryForTwoSeries),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          character.appearanceOfSeason.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', character.statusIfDeadOrAlive),
                      buildDivider(300),
                      character.betterCallSaulApperance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Season : ',
                              character.betterCallSaulApperance.join(' / ')),
                      character.betterCallSaulApperance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.actorName),
                      buildDivider(235),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
