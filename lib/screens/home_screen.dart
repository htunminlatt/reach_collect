import 'package:flutter/material.dart';
import 'package:reach_collect/data/models/reach_model.dart';
import 'package:reach_collect/network/presistance/database_provider.dart';
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
  List<ReachCollectVo> reachVo = [];

  @override
  void initState() {
    super.initState();

    DatabaseProvider.db.getAllDataFromDB().then((value) {
      setState(() {
        reachVo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: ProcessView(
        reachVO: reachVo,
      ),
    );
  }
}

// ignore: must_be_immutable
class ProcessView extends StatefulWidget {
  ProcessView({
    super.key,
    required this.reachVO,
  });

  List<ReachCollectVo> reachVO;

  @override
  State<ProcessView> createState() => _ProcessViewState();
}

class _ProcessViewState extends State<ProcessView> {
  final List<String> array = ['ANC', 'Delivery', 'SRH'];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.15,
            color: AppTheme.primaryColor,
            child: const SidebarListItemView(),
          ),
        ),
        Expanded(
          flex: 4,
            child: Container(
          color: Colors.white,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                tabs: array
                                    .map((e) => Tab(
                                          child: Text(e),
                                        ))
                                    .toList()),
                          ),
                        ),
                      ),
                      CustomButton(
                        buttonHeight: 35,
                        label: 'New',
                        iconName: kPlusIcon,
                        width: 120,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      const AcmRegisterScreen()));
                        },
                      )
                    ],
                  ),

                  //divider
                  const Divider(),
                  //
                  widget.reachVO.isEmpty
                      ? const Center(
                          child: Text('No data to show'),
                        )
                      : ContactListView(
                          reachData: widget.reachVO,
                          reloadView: () {
                            DatabaseProvider.db
                                .getAllDataFromDB()
                                .then((value) {
                              setState(() {
                                widget.reachVO = value;
                              });
                            });
                          },
                        )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
