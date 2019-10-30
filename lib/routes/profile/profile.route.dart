import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:main/routes.dart';
import 'package:main/locator.dart';
import 'package:main/routes/profile/sub_routes/documentsids/documentsids_route.dart';
import 'package:main/routes/profile/sub_routes/feedback/feedback_route.dart'
    as prefix0;
import 'package:main/routes/profile/sub_routes/friends/friends_route.dart';
import 'package:main/routes/profile/sub_routes/gethelp/gethelp_route.dart';
import 'package:main/routes/profile/sub_routes/notifications/notifications_route.dart';
import 'package:main/routes/profile/sub_routes/payments/payments_route.dart';
import 'package:main/routes/profile/sub_routes/personal_information/personal_information.route.dart';
import 'package:main/routes/profile/sub_routes/termofservice/termofservice_route.dart';
import '../../shared/widgets/base_widget/base_widget.dart';
import '../../shared/widgets/add_bank_button/add_bank_button.dart';
import '../../shared/widgets/bottom_navigation_base/bottom_navigation_base.dart';
import '../../shared/store/auth_user/auth_user.store.dart';

class ProfileRoute extends StatelessWidget {
  final AuthUserStore authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return BottomNavigationBase(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(255, 186, 115, 1),
                                  width: 2),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://picsum.photos/250?image=9') //eventually going to use facebook url
                                  )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 22, bottom: 2),
                          child: Column(
                            children: <Widget>[
                              Observer(
                                  builder: (_) =>
                                      Text('${authUserStore.authUser.fullName}',
                                          style: TextStyle(
                                            color: Color(0xff0b0b0b),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'AirbnbCerealApp',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 21.0,
                                          ))),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 90),
                                child: InkWell(
                                  child: Text(
                                    "View profile",
                                    style: TextStyle(
                                      color: Colors.amber[700],
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'AirbnbCerealApp',
                                      fontStyle: FontStyle.normal,
                                      fontSize: 17.0,
                                      shadows: [
                                        Shadow(
                                            // bottomLeft
                                            offset: Offset(-0.01, -0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // bottomRight
                                            offset: Offset(0.01, -0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // topRight
                                            offset: Offset(0.01, 0.01),
                                            color: Colors.black),
                                        Shadow(
                                            // topLeft
                                            offset: Offset(-0.01, 0.01),
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  //onTap: (),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    width: 372,
                    height: 644,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 120),
                          width: 208,
                          height: 25,
                          child: Text(
                            "Account Settings",
                            style: TextStyle(
                              color: Color(0xff0b0b0b),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AirbnbCerealApp',
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.amber[600],
                          height: 1,
                          indent: 25,
                          endIndent: 307,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Personal Information",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalInformation()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Payments",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payments()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Notifications",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Friends",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Friends()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Documents / Ids",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Documentsids()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Get Help",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gethelp()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Terms of Service",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Termofservice()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Give us feedback",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => prefix0.Feedback()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 25,
                          endIndent: 25,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 23.8, right: 20),
                          height: 21,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Log out",
                                  style: TextStyle(
                                    color: Color(0xff0b0b0b),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'AirbnbCerealApp',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0,
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/images/personalInformationIcon.JPG",)),
                              ],
                            ),
                            onTap: () => authUserStore.logout(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]));
    });
  }
}
