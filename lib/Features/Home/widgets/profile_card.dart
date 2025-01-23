import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:taskone/Common/Utils/color.dart';
import 'package:taskone/Common/Utils/dimensions.dart';
import 'package:taskone/Common/Widgets/text.dart';
import 'package:taskone/Features/Home/repo/question_notifier.dart';

class ProfileCard extends ConsumerWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Sizes().init(context);
    final questionState = ref.watch(questionStateProvider);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/Joey 2.png",
              ),
            ),
            Gap(Sizes.sWidth * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Texts(
                    text: "Angelina, 28",
                    color: AppColors.white,
                  ),
                  Gap(Sizes.sHeight * 1.5),
                  const Texts(
                    text: "What is your favourite time of the day?",
                    fontSize: 23,
                    color: AppColors.white,
                  ),
                ],
              ),
            )
          ],
        ),
        Gap(Sizes.sHeight),
        const Texts(
          text: '"Mine is definitely the peace in the morning"',
          fontStyle: FontStyle.italic,
          color: AppColors.primaryColor,
        ),
        Gap(Sizes.sHeight),
        GridView.builder(
          itemCount: questionState.answers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 3,
            mainAxisExtent: Sizes.sHeight * 10,
          ),
          itemBuilder: (context, index) {
            final answer = questionState.answers[index];

            return GestureDetector(
              onTap: () {
                ref
                    .read(questionStateProvider.notifier)
                    .selectAnswer(answer.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: questionState.selectedAnswer == answer.id
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                color: const Color(0XFF232A2E),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Center(
                          child: Texts(
                            text: answer.id,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Gap(Sizes.sWidth * 2),
                      Expanded(
                        child: Texts(
                          text: answer.text,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Gap(Sizes.sHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts(
                  text: "Pick your option.",
                  color: AppColors.white,
                ),
                Texts(
                  text: "See who has a similar mind.",
                  color: AppColors.white,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 3,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.mic,
                      size: 40,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Gap(Sizes.sWidth),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: const Center(
                    child: Icon(
                      IconlyLight.arrow_right,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
