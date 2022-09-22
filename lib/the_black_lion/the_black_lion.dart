import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Randomiser extends StatefulWidget {
  const Randomiser({Key? key}) : super(key: key);

  @override
  State<Randomiser> createState() => _RandomiserState();
}

class _RandomiserState extends State<Randomiser> {
  Map<String, String> colourAnimal = {
    "colour": "Black",
    "animal": "Lion",
  };

  newColourAnimal() {
    Map<int, String> colourList = {
      1: "Red",
      2: "Orange",
      3: "Yellow",
      4: "Green",
      5: "Blue",
      6: "Indigo",
      7: "Violet",
      8: "White",
      9: "Black",
      0: "Purple",
      11: "Teal",
      12: "Cyan",
      13: "Magenta",
      14: "Amber",
      15: "Scarlet",
      16: "Turquoise",
      17: "Chartreuse",
      10: "Pink",
      18: "Fuchsia",
      19: "Beige",
      20: "Aqua",
      21: "Grey",
      22: "Burgundy",
      23: "Brown",
      24: "Charcoal",
      25: "Claret",
      26: "Copper",
      27: "Coquelicot",
      28: "Crimson",
      29: "Golden",
      30: "Silver",
      31: "Bronze",
      32: "Mauve",
      33: "Ebony",
      34: "Lilac",
      35: "Ivory",
      36: "Jade",
      37: "Taupe",
      38: "Mustard",
    };

    Map<int, String> animalList = {
      1: "Dog",
      2: "Cat",
      3: "Crow",
      4: "Kangeroo",
      5: "Koala",
      6: "Panther",
      7: "Weasel",
      8: "Tiger",
      9: "Goat",
      0: "Lizard",
      10: "Beaver",
      11: "Otter",
      12: "Fish",
      13: "Crab",
      14: "Cow",
      15: "Donkey",
      16: "Snake",
      17: "Shark",
      18: "Frog",
      19: "Crocodile",
      20: "Giraffe",
      21: "Aardvark",
      22: "Penguin",
      23: "Parrot",
      24: "Toad",
      25: "Eagle",
      26: "Elephant",
      27: "Malamute",
      28: "Llama",
      29: "Alpaca",
      30: "Alligator",
      31: "Fox",
      32: "Antelope",
      33: "Monkey",
      34: "Ape",
      35: "Chimpanzee",
      36: "Turtle",
      37: "Turtoise",
      38: "Baboon",
      39: "Python",
      40: "Bull",
      41: "Sheep",
      42: "Rhino",
      43: "Iguana",
      44: "Dolphin",
      45: "Orangutang",
      46: "Armadillo"
    };
    var rng = Random();
    Map<String, String> newColourAnimal = {
      "colour": colourList[rng.nextInt(colourList.length)].toString(),
      "animal": animalList[rng.nextInt(animalList.length)].toString(),
    };
    return newColourAnimal;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme:
            GoogleFonts.alfaSlabOneTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("The Black lion"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "The",
                style: TextStyle(fontSize: 40),
              ),
              Text(
                colourAnimal["colour"].toString(),
                style: TextStyle(fontSize: 60),
              ),
              Text(
                colourAnimal["animal"].toString(),
                style: TextStyle(
                  fontSize: 60,
                ),
              ),
              TextButton(
                onPressed: () {
                  Map<String, String> newColourAnimalMap = newColourAnimal();
                  setState(() {
                    colourAnimal = newColourAnimalMap;
                  });
                },
                child: Text(
                  "🎲",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
