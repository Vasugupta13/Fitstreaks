import 'package:fitstreaks/features/diet_plan/controller/diet_controller.dart';
import 'package:fitstreaks/model/diet_plan_model.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightLossPlanView extends StatefulWidget {
  const WeightLossPlanView({super.key});

  @override
  State<WeightLossPlanView> createState() => _WeightLossPlanViewState();
}

class _WeightLossPlanViewState extends State<WeightLossPlanView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color selectedTabColor = AppColors.kGreenColor;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      selectedTabColor = _tabController.index == 0
          ? AppColors.kGreenColor
          : AppColors.kRedAccent;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DietController dietController = Get.find();
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.kWhiteColor,
        surfaceTintColor: AppColors.kWhiteColor,
        title: ReusableText(
          text: "Weight Loss Plan",
          size: 20 * autoScale,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: ThemeData(useMaterial3: false),
              child: Container(
                height: 40,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0)),
                child: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: selectedTabColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tabs: const [
                    Row(
                      children: [
                        Expanded(
                            child: Tab(
                          text: "Veg",
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Tab(
                          text: "Non Veg",
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Veg tab content
                  Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ReusableText(
                                text:
                                    "Here's your recommended weight gain diet",
                                size: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: buildDietList(dietController.weightLossVegList,
                            AppColors.kGreenColor),
                      )
                    ],
                  ),
                  // Non-Veg tab content
                  // Replace with your non-veg list
                  Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ReusableText(
                                text:
                                    "Here's your recommended weight gain diet",
                                size: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: buildDietList(
                            dietController.weightLossNonVegList,
                            AppColors.kRedAccent),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDietList(List<WeightPlanModel> dietList, Color color) {
    return ListView.builder(
      itemCount: dietList.length,
      itemBuilder: (context, index) {
        WeightPlanModel plan = dietList[index];
        Map<String, dynamic> planMap = plan.toMap();
        List<String> sortedKeys = [
          'Breakfast',
          'Mid-Morning Snack',
          'Lunch',
          'Afternoon Snack',
          'Dinner'
        ];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.kGreyColor.withOpacity(0.5),
                      blurRadius: 3)
                ]),
            child: ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: color,
              collapsedBackgroundColor: color,
              textColor: AppColors.kWhiteColor,
              iconColor: AppColors.kWhiteColor,
              collapsedIconColor: AppColors.kWhiteColor,
              title: ReusableText(
                text: 'Day ${index + 1}',
                color: AppColors.kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
              children: sortedKeys.map((key) {
                return Padding(
                  padding:
                      EdgeInsets.fromLTRB(2, 0, 2, key == "Dinner" ? 2 : 0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.kWhiteColor,
                          borderRadius: key == "Dinner"
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))
                              : null),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ReusableText(
                                  text: key,
                                  color: color,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ReusableText(
                                  text: planMap[key],
                                  size: 12,
                                )),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
