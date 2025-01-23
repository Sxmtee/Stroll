import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:taskone/Common/Utils/color.dart';
import 'package:taskone/Common/Utils/dimensions.dart';
import 'package:taskone/Common/Utils/stroll_icon_icons.dart';
import 'package:taskone/Common/Widgets/text.dart';
import 'package:taskone/Features/Home/widgets/profile_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes().init(context);

    double imageContainerHeight =
        MediaQuery.of(context).size.height < 1000 ? 275 : 400;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: Sizes.screenHeight,
        width: Sizes.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), // Add a dark overlay to blend
              BlendMode.darken,
            ),
            image: const AssetImage("assets/images/fade.jpg"),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! in an ideal dev, this image will come with the background Image.
              Container(
                height: imageContainerHeight,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 0.0),
                    bottom: const BorderSide(color: Colors.black, width: 0.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.darken,
                    ),
                    image: const AssetImage("assets/images/video.png"),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(Sizes.sHeight * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Texts(
                          text: "Stroll Bonfire",
                          color: AppColors.text,
                          fontWeight: FontWeight.w900,
                          fontSize: 35,
                        ),
                        Gap(Sizes.sWidth),
                        const Icon(
                          IconlyLight.arrow_down_2,
                          color: AppColors.primaryColor,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              StrollIcon.clock,
                              color: AppColors.white,
                            ),
                            Texts(
                              text: "22h 00m",
                              color: AppColors.white,
                            )
                          ],
                        ),
                        Gap(Sizes.sWidth * 2),
                        const Row(
                          children: [
                            Icon(
                              StrollIcon.person,
                              color: AppColors.white,
                            ),
                            Texts(
                              text: "103",
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // const Spacer(),
              const ProfileCard(),
            ],
          ),
        ),
      ),
    );
  }
}
