import 'package:flutter/material.dart';
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
        indent: 25,
        endIndent: 25,
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
          margin: EdgeInsets.only(right: 0, left: 130),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, left: 20),
                width: 109.9,
                height: 109.9,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 186, 115, 0.55), width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            '${authUserStore.authUser.pictureUrl}') //eventually going to use facebook url
                        )),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 75, left: 90),
                  width: 34.9,
                  height: 34.9,
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
          fontSize: 16,
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
          width: 372,
          height: 580,
          margin: EdgeInsets.only(left: 20, top: 130, bottom: 31),
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
                    'Vestibulum rutrum quam vitae fringilla tincidunt. Suspendisse nec tortor urna. Ut laoreet sodales nisi, quis iaculis nulla iaculis vitae. ',
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
