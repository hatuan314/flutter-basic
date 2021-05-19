import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_constaner.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_state.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_bloc.dart';
import 'package:ghichu/presentation/journey/group/add_list/widgets/select_colors.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/widgets/app_bar.dart';
import 'package:ghichu/presentation/journey/widgets/icon_widget.dart';
import 'package:ghichu/presentation/journey/widgets/show_model_button_sheet.dart';

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  TextEditingController _textEditingController = TextEditingController();
  BlocCheckButton blocCheckButton = new BlocCheckButton();
  AddListBloc blocAddList = new AddListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        blocCheckButton: blocCheckButton,
        leading: () {
          showButtonModalSheet(context);
        },
        actions: () {
          blocAddList.addToDoGroup(
            _textEditingController.text.trim(),
            blocAddList.addListState.color.value.toString(),
            DateTime.now().millisecondsSinceEpoch,
            DateTime.now().millisecondsSinceEpoch,
          );
          Navigator.pop(context);
        },
        textLeft: 'Hủy',
        title: 'Danh sách mới',
        textRight: 'Xong',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AddListConstants.screenUntilHeight30,
              ),
              Center(
                  child: StreamBuilder<AddListState>(
                      initialData: AddListState(
                          index: 4,
                          color: AddListConstants.listColors[4]),
                      stream: blocAddList.selectColor,
                      builder: (context, snapshot) {
                        return IconWidget(
                          size: AddListConstants.sizeContainer,
                          color: Color(blocAddList.addListState.color.value),
                          colorGraient:
                              Color(blocAddList.addListState.color.value)
                                  .withOpacity(0.5),
                          icon: Icons.list,
                          shadow: 0.2,
                          sizeIcon: AddListConstants.sizeIcon,
                        );
                      })),
              SizedBox(
                height: AddListConstants.screenUntilHeight30,
              ),
              TextField(
                controller: _textEditingController,
                // textAlign: TextAlign.center,
                textAlign: TextAlign.center,

                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: AddListConstants.screenUtilText),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.only(top: ScreenUtil().setHeight(13)),
                  prefixIcon: SizedBox(),
                  prefixIconConstraints: BoxConstraints(
                      maxWidth: ScreenUtil().setWidth(20),
                      minWidth: ScreenUtil().setWidth(20)),
                  suffixIconConstraints: BoxConstraints(
                      maxWidth: ScreenUtil().setWidth(40),
                      minWidth: ScreenUtil().setWidth(32),
                      maxHeight: ScreenUtil().setHeight(55),
                      minHeight: ScreenUtil().setHeight(55)),
                  suffixIcon: StreamBuilder(
                      stream: blocCheckButton.checkButtom,
                      builder: (context, snapshot) {
                        return Visibility(
                            visible: snapshot.hasData ? snapshot.data : false,
                            child: GestureDetector(
                                onTap: () {
                                  _textEditingController.text = '';
                                  blocCheckButton.setButtom('');
                                },
                                child: Icon(
                                  Icons.cancel,
                                  size: ScreenUtil().setSp(24),
                                  color: Colors.black26,
                                )));
                      }),
                  filled: true,
                  fillColor: Colors.black12.withOpacity(0.05),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.transparent),
                    borderRadius: AddListConstants.radiusCircle10,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: AddListConstants.radiusCircle10,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  blocCheckButton.setButtom(value);
                },
              ),
              SizedBox(
                height: AddListConstants.screenUntilHeight30,
              ),
              SelectColors(
                addListBloc: blocAddList,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    blocAddList.dispose();
    blocCheckButton.dispose();
  }
}
