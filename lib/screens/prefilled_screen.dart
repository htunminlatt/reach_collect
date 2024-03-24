import 'package:flutter/material.dart';
import 'package:reach_collect/screens/home_screen.dart';
import 'package:reach_collect/widgets/button_widget.dart';
import 'package:reach_collect/widgets/custom_bar_widget.dart';
import 'package:reach_collect/widgets/custom_dropdown_widget.dart';

import '../utils/app_styles.dart';

class PreFilledScreen extends StatefulWidget {
  const PreFilledScreen({super.key});

  @override
  State<PreFilledScreen> createState() => _PreFilledScreenState();
}

class _PreFilledScreenState extends State<PreFilledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomBarWidget(),
          
              const SizedBox(
                height: 73,
              ),
              //section one
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Organization *',
                        style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownListView(),
                    ],
                  ),
                  const SizedBox(
                    width: 126,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'State/Region *',
                        style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownListView(),
                    ],
                  ),
                ],
              ),
          
              const SizedBox(
                height: 73,
              ),
          
              //section two
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Township(MIMU) *',
                        style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownListView(),
                    ],
                  ),
                  const SizedBox(
                    width: 126,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Township(Local)',
                        style: TextStyle(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownListView(),
                    ],
                  ),
                ],
              ),
          
              //sizebox
              const SizedBox(
                height: 60,
              ),
              //reporting unit
              const Text(
                'Reporting Unit*',
                style: TextStyle(
                    color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),

              //reporting unit
              Center(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            color: Colors.black12)
                      ]),
                  child: const Center(
                    child: Text(
                      'Reporting Unit',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
          
              //sizebox
              const SizedBox(
                height: 100,
              ),
              
              //button
              SizedBox(
                height: 50,
                width: 300,
                child: ButtonWidget(
                    buttonText: 'Continue',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ));
                    }),
              )
            ],
          ),
        ));
  }
}
