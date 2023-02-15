import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_study/screen/components/sign_in_form.dart';

void showCustomDialog(BuildContext context, {required ValueChanged onValue}) {
  /**
   * showGeneralDialog : 다이얼로그를 띄울 수 있게 해주는 위젯
   **/
  showGeneralDialog(
      // context : 다이얼로그를 띄울 수 있게 해주는 위젯
      context: context,
      // barrierLabel : 다이얼로그를 띄울 수 있게 해주는 위젯
      barrierLabel: "Barrier",
      // barrierDismissible : 다이얼로그 외부 클릭시 dismiss 여부를 지정할 수 있게 해주는 위젯
      barrierDismissible: true,
      // barrierColor : 다이얼로그 외부 배경색을 지정할 수 있게 해주는 위젯
      barrierColor: Colors.black.withOpacity(0.5),
      // transitionDuration : 다이얼로그가 띄워지는 시간을 지정할 수 있게 해주는 위젯
      transitionDuration: const Duration(milliseconds: 200),
      // pageBuilder : 다이얼로그의 내용을 지정할 수 있게 해주는 위젯
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Center(
          child: Container(
            height: 620,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            /**
             * BoxDecoration : 위젯의 테두리, 그림자, 색상 등을 지정할 수 있게 해주는 위젯
             * color : 위젯의 색상을 지정할 수 있게 해주는 위젯
             * borderRadius : 위젯의 테두리를 둥글게 지정할 수 있게 해주는 위젯
             */
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                /**
                 * BoxShadow : 위젯의 그림자를 지정할 수 있게 해주는 위젯
                 * color : 그림자의 색상을 지정할 수 있게 해주는 위젯
                 * offset : 그림자의 위치를 지정할 수 있게 해주는 위젯
                 * blurRadius : 그림자의 흐림 정도를 지정할 수 있게 해주는 위젯
                 */
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                ),
              ],
            ),
            /**
             * Scaffold : 위젯의 배경색을 지정할 수 있게 해주는 위젯
             */
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                /**
                 * Clip : 위젯의 내부를 잘라내는 위젯
                 */
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                            "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift",
                            textAlign: TextAlign.center,
                        ),
                      ),
                      const SignInForm(),
                      Row(
                        children: const [
                          Expanded(
                              child: Divider()
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                "OR",
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          "Sign up with Email, Apple or Google",
                          style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                  "assets/icons/email_box.svg",
                                  width: 64,
                                  height: 64,
                              ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              width: 64,
                              height: 64,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              width: 64,
                              height: 64,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      // transitionBuilder : 다이얼로그가 띄워지는 애니메이션을 지정할 수 있게 해주는 위젯
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          Tween<Offset> tween;
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
          return SlideTransition(
            position: tween.animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut
              ),
            ),
            child: child,
          );
      }
  ).then(onValue);

}
