import 'package:flutter/material.dart';
import '../Classes/meals.dart';
import '../screens/mealDetails.dart';

//single meal item
class MealItem extends StatelessWidget {
  // const MealItem({Key? key}) : super(key: key);

  final String id, title, imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectItem(context),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 15,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Stack(
                  //only for the image and the text on the image
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(
                          imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Container(
                        //to ensure that my text field does not overflow by giving it a certain width
                        width: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black54),
                        // color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Text(title,
                            style: const TextStyle(
                                fontSize: 26, color: Colors.white),
                            softWrap: true),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(Icons.schedule),
                            const SizedBox(width: 7),
                            Text('$duration min'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(Icons.work),
                            const SizedBox(width: 7),
                            Text(complexityText),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 7),
                            Text(affordabilityText),
                          ],
                        )
                      ],
                    ))
              ],
            )));
  }
}
