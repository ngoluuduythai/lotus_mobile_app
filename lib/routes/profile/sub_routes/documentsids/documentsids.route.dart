import 'package:flutter/material.dart';
import '../../../../shared/constants/icon_paths.dart';
import '../../../../locator.dart';
import '../../../../shared/store/auth_user/auth_user.store.dart';
import './../../../../routes.dart';
import '../../../../shared/models/auth_user.model.dart';
import '../../sub_profile_base/sub_profile_base.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsidsRoute extends StatelessWidget {
  DocumentsidsRoute();
  final AuthUserStore authUserStore = locator<AuthUserStore>();
  AuthUser editUser = AuthUser();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

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
      name: 'Documents / ids',
      child: RaisedButton(
        child: Text("load pic"),
        onPressed: () async {
          print("getting image");
          var image = await getImage();
          print("image!!");
          print(image);
        },
      ),
    );
  }
}
