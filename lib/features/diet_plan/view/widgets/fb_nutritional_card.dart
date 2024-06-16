import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';

class FBDNutritionCard extends StatelessWidget {
  final Color color;
  final String title;
  final Map<String, dynamic> data;

  const FBDNutritionCard({super.key, required this.color, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhiteColor,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.kGreyColor.withOpacity(0.6),
                  blurRadius: 2
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(19), topRight: Radius.circular(19)),
                ),
                child:  Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      ReusableText(text: title, size: 16, fontWeight: FontWeight.w500, color: AppColors.kBlackColor,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    String key = data.keys.elementAt(index);
                    return ListTile(
                      title:  ReusableText(text: key, size: 14, fontWeight: FontWeight.w500, color: color,),
                      subtitle: Text('${data[key]}'),
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}