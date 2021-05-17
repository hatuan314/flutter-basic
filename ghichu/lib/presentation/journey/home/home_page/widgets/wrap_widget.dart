import 'package:flutter/material.dart';

import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

import 'package:ghichu/presentation/journey/home/home_page/widgets/sight_widget.dart';


class WrapWidget extends StatelessWidget {
  BlocCheckButton blocCheckButton;

  WrapWidget({Key key,this.blocCheckButton}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: blocCheckButton.checkButtom,
      builder: (context, snapshot) {
        return Visibility(
          visible: !blocCheckButton.check,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedOpacity(
            opacity: blocCheckButton.check?0:1,
            duration: HomePageConstants.durationContainer,
            child: Wrap(
                spacing: HomePageConstants.paddingWidth20,
                children: List.generate(3, (index) {
                  return SightWidget(index: index,);
                })),
          ),
        );
      }
    );
  }
}
