import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/routes/profile/sub_profile_base/sub_profile_base.dart';
import './item_edit_list/item_edit_list.dart';
import './item_edit_list/item_edit_list_about_me.dart';
import './item_edit_list/item_edit_list_gender.dart';
import '../../../../shared/constants/icon_paths.dart';
import '../../../../locator.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import './../../../../routes.dart';
import '../../../../shared/models/auth_user.model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditInfoRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  static AuthUser editUser = AuthUser();

  greyDivider() {
    return Container(
      child: Divider(
        color: Color(0xFFB6C1CF),
        height: 1,
        thickness: 0.3,
        indent: ScreenUtil().setWidth(44),
        endIndent: ScreenUtil().setWidth(48),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SubProfileBase(
      name: 'Edit Info',
      child: _editInfo(context),
      save: _save(context),
    );
  }

  Widget _imgProfileandSave() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(0)),
          child: Stack(
            children: <Widget>[
              Center(
                  child: Container(
                width: ScreenUtil().setWidth(190),
                height: ScreenUtil().setHeight(175),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 0.55),
                        width: ScreenUtil().setWidth(4.5)),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                        )),
              )),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(110),
                      left: ScreenUtil().setWidth(390)),
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(70),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 0.55),
                        width: ScreenUtil().setWidth(4)),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    width: ScreenUtil().setWidth(4),
                    height: ScreenUtil().setHeight(4),
                    child: Tab(
                      icon: Image.asset(
                        IconPath.cameraIcon,
                        width: ScreenUtil().setWidth(50),
                        height: ScreenUtil().setHeight(50),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  print('upload photo');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _save(BuildContext context) {
    return InkWell(
        child: Text(
          'Save',
          style: TextStyle(
            color: Color(0xff0b0b0b),
            fontWeight: FontWeight.w500,
            fontFamily: 'AirbnbCerealApp',
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil().setSp(32),
          ),
        ),
        onTap: () async {
          await authUserStore.updateUser(editUser);
        });
  }

  Widget _editInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        _imgProfileandSave(),
        Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(230),
              right: ScreenUtil().setWidth(30),
              bottom: ScreenUtil().setHeight(20)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(5),
              left: ScreenUtil().setWidth(0),
            ),
            child: Column(
              children: <Widget>[
                ItemEditList(
                  onChanged: (val) {
                    editUser.nickName = val;
                  },
                  onSubmited: (val) {
                    editUser.nickName = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'Nickname:',
                  userValue: authUserStore.authUser.nickName,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF0B0B0B),
                ),
                greyDivider(),
                ItemEditListAboutMe(
                  onChanged: (val) {
                    editUser.profileDescription = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'About me:',
                  userValue: authUserStore.authUser.profileDescription,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
                greyDivider(),
                ItemEditList(
                  onChanged: (val) {
                    editUser.firstName = val;
                  },
                  onSubmited: (val) {
                    editUser.firstName = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'First name:',
                  userValue: authUserStore.authUser.firstName,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
                greyDivider(),
                ItemEditList(
                  onChanged: (val) {
                    editUser.lastName = val;
                  },
                  onSubmited: (val) {
                    editUser.lastName = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'Last name:',
                  userValue: authUserStore.authUser.lastName,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
                greyDivider(),
                ItemEditListGender(
                  onChanged: (val) {
                    editUser.gender = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'Gender:',
                  userValue: authUserStore.authUser.gender,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
                greyDivider(),
                ItemEditList(
                  onChanged: (val) {
                    editUser.email = val;
                  },
                  onSubmited: (val) {
                    editUser.email = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'Email:',
                  userValue: authUserStore.authUser.email,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
                greyDivider(),
                ItemEditList(
                  onChanged: (val) {
                    editUser.phone = val;
                  },
                  onSubmited: (val) {
                    editUser.phone = val;
                  },
                  iconImageLocation: IconPath.cross,
                  title: 'Phone:',
                  userValue: authUserStore.authUser.phone,
                  color: Color(0xFF0B0B0B),
                  color2: Color(0xFF484F61),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
