import 'package:flutter/material.dart';
import 'package:reach_collect/widgets/custom_bar_widget.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBarWidget()
          ],
        )
    );
  }
}
