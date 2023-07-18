import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../bloc/language/language_cubit.dart';
import '../../modules/const/urlimages.dart';
import '../../modules/widgets/CheckBoxInListView.dart';
import '../../modules/widgets/buttons/nextButtonOnBoarding.dart';
import '../../router/extension.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void stopAnimationAt(double time) {
    _controller.stop();
    _controller.value = time;
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      stopAnimationAt(0.2);
    });
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        body: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) => Stack(
            children: [
              // image (map)
              Container(
                padding: EdgeInsets.only(top: size.height / 16),
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DataImages.mapLanguage.toPNGImage(size: size.width),
                      ],
                    ),
                  ],
                ),
              ),
              // image (mask group)
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height / 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: 0.6,
                            child: DataImages.maskGroup_1.toPNGImage(
                              size: size.width / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // next button
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, size.height / 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: InkWell(
                              onTap: () {},
                              child: BlocBuilder<LanguageCubit, LanguageState>(
                                builder: (context, state) {
                                  return NextButtonOnBoarding(
                                    buttonText: state.next,
                                  );
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Positioned(
                top: size.height / 24,
                right: size.width / 3.7,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: state.n == 1 ? 1 : 0.25,
                    child: Lottie.asset(
                      state.n == 1
                          ? "assets/REtthLE8hx.json"
                          : "assets/locationColoe.json",
                      controller: _controller,
                      animate: false,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height / 16,
                left: size.width / 9,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: state.n == 2 ? 1 : 0.25,
                    child: Lottie.asset(
                      state.n == 2
                          ? "assets/REtthLE8hx.json"
                          : "assets/locationColoe.json",
                      controller: _controller,
                      animate: false,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height / 11,
                right: size.width / 3.9,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: state.n == 3 ? 1 : 0.25,
                    child: Lottie.asset(
                      state.n == 3
                          ? "assets/REtthLE8hx.json"
                          : "assets/locationColoe.json",
                      controller: _controller,
                      animate: false,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height / 14,
                right: size.width / 2.7,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 700),
                    opacity: state.n == 4 ? 1 : 0.25,
                    child: Lottie.asset(
                      state.n == 4
                          ? "assets/REtthLE8hx.json"
                          : "assets/locationColoe.json",
                      controller: _controller,
                      animate: false,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: size.height / 3),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: size.width / 1.1,
                            height: size.height / 4.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(),
                                SizedBox(
                                    width: size.width / 1.3,
                                    height: size.height,
                                    child: const CheckBoxInListView()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
