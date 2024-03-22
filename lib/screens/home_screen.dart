import 'package:flutter/material.dart';
import 'package:reach_collect/utils/app_styles.dart';
import 'package:reach_collect/widgets/home_app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeAppBarWidget()
          ],
        )
    );
  }
  
  ElevatedButton _mainButton(Function()? onPressed, String text) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text)
    );
  }

  IconButton _actionButton(Function()? onPressed, IconData icon) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(icon,
        color: AppTheme.secondaryColor,),

    );
  }
}
