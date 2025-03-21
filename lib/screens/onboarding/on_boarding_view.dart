import 'package:expensify/helper/app_route.dart';
import 'package:expensify/helper/color_extension.dart';
import 'package:expensify/widget/pageArr.dart';
import 'package:expensify/widget/round_btn.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: media.height,
        width: media.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/splash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: ((context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: media.width,
                      height: media.width,
                      alignment: Alignment.center,
                      child: Image.asset(
                        pObj["image"].toString(),
                        width: media.width * 0.65,
                      ),
                    ),
                    Text(
                      pObj["title"].toString(),
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: media.width * 0.05),
                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: media.width * 0.20),
                  ],
                );
              }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.height * 0.6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      pageArr.map((e) {
                        var index = pageArr.indexOf(e);

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color:
                                index == selectPage
                                    ? TColor.primary
                                    : TColor.placeholder,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: media.height * 0.28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundBtn(
                    title: "Next",
                    onPressed: () {
                      if (selectPage >= 2) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoute.SIGN_IN_SCREEN,
                        );
                      } else {
                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(
                            selectPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          );
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
