import 'package:flutter/material.dart';

import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_bloc.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

import 'package:ghichu/presentation/journey/home/home_page/widgets/sight_widget.dart';


class WrapWidget extends StatelessWidget {
  CheckButtonBloc blocCheckButton;
  HomePageBloc homePageBloc;
  WrapWidget({Key key,this.blocCheckButton,this.homePageBloc}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: blocCheckButton.checkButton,
      builder: (context, snapshot) {
        return Visibility(
          visible: !blocCheckButton.check,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedOpacity(
            opacity: blocCheckButton.check?0:1,
            duration: HomePageConstants.durationContainer,
            child: StreamBuilder<HomePageState>(
              initialData: homePageBloc.homePageState,
              stream: homePageBloc.groupControllerStream,
              builder: (context, snapshot) {
                return Wrap(
                    spacing: HomePageConstants.paddingWidth20,
                    children: List.generate(3, (index) {
                      return SightWidget(index: index,homePageBloc: homePageBloc,);
                    }));
              }
            ),
          ),
        );
      }
    );
  }
}
