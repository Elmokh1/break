import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breake/bussiness_logic/quote_cubit.dart';
import 'package:breake/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters_model.dart';

class CharactersDetailsScreen extends StatefulWidget {
  final Character character;

  CharactersDetailsScreen({required this.character});

  @override
  State<CharactersDetailsScreen> createState() => _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<QuoteCubit>(context).getQuotes();
    super.initState();
  }
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          "${widget.character.name}",
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
          // textAlign:TextAlign.start,
        ),
        background: Hero(
          tag: widget.character.id ?? "",
          child: Image.network(
            "${widget.character.image}",
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
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLoaded(QuoteState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndecator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quote;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          child: AnimatedTextKit(
            animatedTexts: [
              FlickerAnimatedText('${quotes[randomQuoteIndex].quote}'),
            ],
            repeatForever: true,
          ),
          style: TextStyle(fontSize: 20, color: MyColors.myWhite, shadows: [
            Shadow(
              blurRadius: 7,
              color: MyColors.myYellow,
              offset: Offset(0, 0),
            ),
          ]),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndecator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: MyColors.myGrey,
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("status: ", "${widget.character.status}"),
                      buildDivider(315),
                      characterInfo("Gender: ", "${widget.character.gender}"),
                      buildDivider(315),
                      characterInfo("Species: ", "${widget.character.species}"),
                      buildDivider(315),
                      characterInfo("Url : ", "${widget.character.url}"),
                      buildDivider(315),
                      characterInfo(
                          "episode: ", "${widget.character.episode?.join('/')}"),
                      buildDivider(315),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<QuoteCubit, QuoteState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
