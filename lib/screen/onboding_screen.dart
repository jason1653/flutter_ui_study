import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:ui_study/screen/components/animated_btn.dart';
import 'package:ui_study/screen/components/sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isShowSignInDialog = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Scaffold : Material Design의 레이아웃 구조를 구현할 수 있게 해주는 위젯
     */
    return Scaffold(
      /**
       * Stack : 위젯을 겹쳐서 배치할 수 있게 해주는 위젯
       */
      body: Stack(
        children: [
          /** background image 설정 **/
          /**
           * Positioned : Stack 위젯의 자식 위젯을 위치를 지정하여 배치할 수 있게 해주는 위젯
           */
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              left: 100,
              bottom: 100,
              child: Image.asset(
            'assets/Backgrounds/Spline.png',
            fit: BoxFit.cover,
          )),
          /*** blur background ***/
          /**
           * Positioned.fill : Stack 위젯의 자식 위젯을 전체 화면에 꽉 채워서 배치할 수 있게 해주는 위젯
           */
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: const SizedBox(),
              )
          ),

          /**
           * AnimatedPositioned : Stack 위젯의 자식 위젯의 위치를 애니메이션 효과를 주어 변경할 수 있게 해주는 위젯
           */
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            /**
             * SafeArea : 기기의 안전한 영역을 지정하여 위젯을 배치할 수 있게 해주는 위젯
             */
            child: SafeArea(
              /**
               * Padding : 위젯의 내부 여백을 지정할 수 있게 해주는 위젯
               */
              child: Padding(
                /**
                 * EdgeInsets.symmetric : 위젯의 내부 여백을 좌우로 지정할 수 있게 해주는 위젯
                 */
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(

                  /**
                   * CrossAxisAlignment.stretch : Column 위젯의 자식 위젯을 전체 화면에 꽉 채워서 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.start : Column 위젯의 자식 위젯을 왼쪽으로 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.end : Column 위젯의 자식 위젯을 오른쪽으로 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.center : Column 위젯의 자식 위젯을 가운데로 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.baseline : Column 위젯의 자식 위젯을 기준선에 맞춰서 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.firstBaseline : Column 위젯의 자식 위젯을 첫번째 기준선에 맞춰서 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.lastBaseline : Column 위젯의 자식 위젯을 마지막 기준선에 맞춰서 배치할 수 있게 해주는 위젯
                   * CrossAxisAlignment.stretch : Column 위젯의 자식 위젯을 전체 화면에 꽉 채워서 배치할 수 있게 해주는 위젯
                   */
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /**
                     * Spacer : 위젯의 내부 여백을 지정할 수 있게 해주는 위젯
                     */
                    const Spacer(),
                    /**
                     * SizedBox : 위젯의 크기를 지정할 수 있게 해주는 위젯
                     */
                    SizedBox(
                      width:260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 60,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height:16),
                          Text("Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),

                    ElevatedButton(
                        onPressed: () {
                          _btnAnimationController.isActive = true;

                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () {
                              setState(() {
                                isShowSignInDialog = true;
                              });
                              showCustomDialog(context, onValue: (value) {
                                setState(() {
                                  isShowSignInDialog = false;
                                });
                              });
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        ),
                        child: const Text("Start the Course"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
