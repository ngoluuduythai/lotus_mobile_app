import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/routes/profile/sub_profile_base/sub_profile_base.dart';
import './item_edit_list/item_edit_list.dart';
import '../../../../shared/constants/icon_paths.dart';
import '../../../../locator.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import './../../../../routes.dart';
import '../../../../shared/models/auth_user.model.dart';

class EditInfoRoute extends StatelessWidget {
  EditInfoRoute();
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  AuthUser editUser = AuthUser();

  greyDivider() {
    return Container(
      child: Divider(
        color: Colors.grey,
        height: 1,
        indent: ScreenUtil().setWidth(25),
        endIndent: ScreenUtil().setWidth(25),
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
          child: Stack(
            children: <Widget>[
              Center(child:Container(
                width: ScreenUtil().setWidth(109.9),
                height: ScreenUtil().setHeight(109.9),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 0.55), width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                        )),
              )),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 75, left: 90),
                  width: ScreenUtil().setWidth(34.9),
                  height: ScreenUtil().setHeight(34.9),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 0.55), width: 2),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    width: 2,
                    height: 2,
                    child: Tab(
                      icon: Image.asset(
                        IconPath.cameraIcon,
                        width: 21.4,
                        height: 15.5,
                      ),
                    ),
                  ),
                ),
                onTap: () => print('upload image'),
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
          fontSize: ScreenUtil().setSp(42),
        ),
      ),
      onTap: () async {
        await authUserStore.saveUserApi(editUser);
      },
    );
  }

  Widget _editInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        _imgProfileandSave(),
        Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              top: ScreenUtil().setWidth(130),
              right:ScreenUtil().setWidth(30),
              bottom: ScreenUtil().setWidth(30)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              ItemEditList(
                onChanged: (val) {
                  editUser.nickName = val;
                },
                iconImageLocation: IconPath.cross,
                title: 'Nickname:',
                userValue: authUserStore.authUser.nickName,
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
              greyDivider(),
              ItemEditList(
                onChanged: (val) {
                  //editUser.about = val;
                },
                iconImageLocation: IconPath.cross,
                title: 'About me:',
                userValue:
                    'Vestibulum rutrum',
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
              greyDivider(),
              ItemEditList(
                onChanged: (val) {
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
                iconImageLocation: IconPath.cross,
                title: 'Last name:',
                userValue: authUserStore.authUser.lastName,
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
              greyDivider(),
              ItemEditList(
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
                iconImageLocation: IconPath.cross,
                title: 'Phone:',
                userValue: authUserStore.authUser.phone,
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
              greyDivider(),
              ItemEditList(
                onChanged: (val) {
                  // editUser.location = val;
                },
                iconImageLocation: IconPath.cross,
                title: 'Location:',
                userValue: 'Lives in Brooklyn , NY',
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
              greyDivider(),
              ItemEditList(
                onChanged: (val) {
                  //editUser.language = val;
                },
                iconImageLocation: IconPath.cross,
                title: 'Language:',
                userValue: 'English,Spanish',
                color: Color(0xFF0B0B0B),
                color2: Color(0xFF484F61),
              ),
            ],
          ),
        )
      ],
    );
  }
}
