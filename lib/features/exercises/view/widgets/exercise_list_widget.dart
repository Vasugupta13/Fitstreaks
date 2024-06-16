import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseListWidget extends StatelessWidget {
  const ExerciseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * autoScale, vertical: 10 * autoScale),
      child: GridView.builder(
          itemCount: allExercise.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>allExercise[index]["page"]));
              },
              child: SizedBox(
                width: 230,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              allExercise[index]["mainColor"],
                              allExercise[index]["lightColor"],
                              allExercise[index]["mainColor"],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color:
                              AppColors.kGreyColor.withOpacity(0.4),
                            )
                          ]),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: CachedNetworkImage(
                          imageUrl: allExercise[index]['image'],
                          imageBuilder: (context, provider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: provider,
                                      fit: BoxFit.fitHeight)),
                            );
                          },
                          placeholder: (context, url) =>
                          const SizedBox(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.kOrangeColor,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              index == 0
                                  ? AppColors.kLightSkyBlueColor
                                  .withOpacity(0)
                                  : index == 1
                                  ? AppColors.kLightGreenishBlueColor
                                  .withOpacity(0)
                                  : AppColors.kLightPinkColor
                                  .withOpacity(0),
                              index == 0
                                  ? AppColors.kLightSkyBlueColor
                                  .withOpacity(0)
                                  : index == 1
                                  ? AppColors.kLightGreenishBlueColor
                                  .withOpacity(0)
                                  : AppColors.kLightPinkColor
                                  .withOpacity(0),
                              allExercise[index]["opacityColor"],
                              allExercise[index]["opacityColor"],
                              allExercise[index]["mainColor"],
                              allExercise[index]["mainColor"],
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 5, right: index == 5 ? 5 : 35),
                        child: Text(
                          allExercise[index]['name'],
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kWhiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
