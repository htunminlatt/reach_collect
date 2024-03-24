import 'package:flutter/material.dart';
import 'package:reach_collect/screens/acm_register.dart';
import 'package:reach_collect/utils/app_styles.dart';
import 'package:reach_collect/utils/images.dart';
import 'package:reach_collect/widgets/contact_Listview.dart';
import 'package:reach_collect/widgets/custom_button.dart';
import 'package:reach_collect/widgets/sidebar_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        backgroundColor: AppTheme.secondaryColor,
      title: Row(
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
      ),
      backgroundColor: AppTheme.whiteColor,
      body:const ProcessView(),
    );
  }

}

class ProcessView extends StatefulWidget {
  const ProcessView({
    super.key,
  });

  @override
  State<ProcessView> createState() => _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  final List<String> array = ['one', 'two', 'three', 'four', 'five'];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.15,
          color: AppTheme.primaryColor,
          child: const SidebarListItemView(),
        ),
        Expanded(
            child: Container(
              color: Colors.white,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: DefaultTabController(
                                  length: array.length,
                                  child: TabBar(
                                    tabAlignment: TabAlignment.start,
                                    isScrollable: true,
                                    dividerColor: Colors.white,
                                    tabs: array.map((e) => Tab(
                                    child: Text(e),
                                  )).toList()),
                                ),
                              ),
                            ),
                            CustomButton(
                              buttonHeight: 35,
                              label: 'New',
                              iconName: kPlusIcon,
                              width: 120,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=> AcmRegisterScreen()));
                              },
                            )
                          ],
                        ),
                                
                        //divider
                        const Divider(),
                        //
                        const ContactListView()
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
