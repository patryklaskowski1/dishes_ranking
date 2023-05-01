import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var dishName = '';
  var rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę restauracji',
            ),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę dania',
            ),
            onChanged: (newValue) {
              setState(
                () {
                  dishName = newValue;
                },
              );
            },
          ),
          const SizedBox(height: 20),
          Slider(
            onChanged: (newValue) {
              setState(
                () {
                  rating = newValue;
                },
              );
            },
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add(
                {
                  'name': restaurantName,
                  'dishes': dishName,
                  'rating': rating,
                },
              );
            },
            child: const Text(
              'DODAJ',
            ),
          )
        ],
      ),
    );
  }
}
