// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/language/language_cubit.dart';
import '../../router/extension.dart';

class CheckBoxInListView extends StatefulWidget {
  const CheckBoxInListView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckBoxInListViewState createState() => _CheckBoxInListViewState();
}

class _CheckBoxInListViewState extends State<CheckBoxInListView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: 200, // card height
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: context.read<LanguageCubit>().len,
          controller: PageController(viewportFraction: 0.3),
          onPageChanged: (int index) {
            _index = index;
            setState(() {
              context.read<LanguageCubit>().updateLanguage(index);
            });
          },
          itemBuilder: (_, i) {
            return Transform.scale(
                scale: i == _index ? 1 : 1,
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: i == _index
                            ? SolidColors.selectCover
                            : SolidColors.backgroundColor,
                        border: i == _index
                            ? Border.all(
                                width: 0.01, color: SolidColors.textPurple)
                            : Border.all(color: SolidColors.backgroundColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            i == _index
                                ? const Icon(
                                    Icons.check,
                                    color: SolidColors.textPurple,
                                  )
                                : Container(),
                            Text(
                              // _texts[i],
                              context.read<LanguageCubit>().getLanguage(i),
                              style: TextStyle(
                                color: i == _index
                                    ? SolidColors.textPurple
                                    : SolidColors.textBlack,
                                fontFamily: i == _index
                                    ? FontFamily.bold
                                    : FontFamily.regular,
                                fontSize: i == _index
                                    ? FontSize.medium
                                    : FontSize.small,
                                fontWeight: i == _index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
