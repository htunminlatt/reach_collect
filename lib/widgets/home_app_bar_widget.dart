import 'package:flutter/material.dart';
import 'package:reach_collect/utils/images.dart';

import '../utils/app_styles.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({super.key});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      color: AppTheme.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  kInsuranceLogo,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "IHRP System",
                  style: AppTheme.navigationTitleStyle,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  // child: ,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
