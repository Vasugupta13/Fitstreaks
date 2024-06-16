import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StretchingGridWidget extends StatelessWidget {
  const StretchingGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return GridView.builder(
      itemCount: stretchingLists.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.kDarkBg,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kLightGreyColor,
                  offset: const Offset(0,0),
                  blurRadius: 2,
                )
              ]
          ),
          child: GestureDetector(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>stretchingLists[index]['page']));
            } ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.kOrangeColor,
                              AppColors.kLightOrangeColor,
                              AppColors.kOrangeColor,
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl: stretchingLists[index]['image'],
                            imageBuilder: (context, provider){
                              return Padding(
                                padding: EdgeInsets.only(top: 20 * autoScale),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: provider,fit: BoxFit.fitHeight
                                      )
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.kOrangeColor,),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.kYellowColor.withOpacity(0),
                                AppColors.kYellowColor.withOpacity(0),
                                AppColors.kYellowColor.withOpacity(0),
                                AppColors.kOrangeColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8 * autoScale,vertical: 4 * autoScale),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: ReusableText(text: stretchingLists[index]['name'],size: 16 * autoScale,color: Colors.white,fontWeight: FontWeight.w600,)),
                          Expanded(child: ReusableText(text: stretchingLists[index]['description'],size: 10 * autoScale,color: AppColors.kLightGreyColor.withOpacity(0.9),maxLines: 2,fontWeight: FontWeight.w400,)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
