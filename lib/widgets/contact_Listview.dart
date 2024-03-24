import 'package:flutter/material.dart';
import 'package:reach_collect/utils/app_styles.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titleArray = [
      'Sr.',
      'Date',
      'Name',
      'Age',
      'Disability',
      'IDP',
      'Gestational',
      'Gravida'
    ];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 150),
                color: AppTheme.secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: titleArray
                      .map((e) => SizedBox(
                            width: e == titleArray[0]
                                ? 30
                                : e == titleArray[3]
                                    ? 30
                                    : e == titleArray[5]
                                        ? 30
                                        : 90,
                            child: Text(
                              e,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: titleArray.map((e) => ContactView()).toList(),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class ContactView extends StatelessWidget {
  ContactView({super.key});
  List<String> titleArray = [
    '100',
    '12.3.2024',
    'Sai Sai Khen',
    '20',
    'Disability',
    'IDP',
    'Gestational',
    'Gravida'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 1),
      height: 50,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 3.0, spreadRadius: 2.0, color: Colors.black12)
      ]),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: titleArray
                    .map((e) => SizedBox(
                        width: e == titleArray[0]
                            ? 30
                            : e == titleArray[3]
                                ? 30
                                : e == titleArray[5]
                                    ? 30
                                    : 90,
                        child: Text(
                          e,
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        )))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            height: 30,
            width: 30,
            color: Colors.red,
            child: const Center(
              child: Icon(
                Icons.delete,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            width: 30,
            color: AppTheme.thirdColor,
            child: const Center(
              child: Icon(
                Icons.remove_red_eye,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }
}
