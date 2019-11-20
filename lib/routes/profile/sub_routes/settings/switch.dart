import 'package:flutter/material.dart';
import 'package:main/shared/constants/colors.dart';
import 'package:main/shared/constants/icon_paths.dart';

class SwitchSettings extends StatelessWidget {
  SwitchSettings({@required this.switchValue});
  bool switchValue;
  void _onSwitchChanged(bool value) {
    switchValue = !switchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
        onChanged: _onSwitchChanged,
        value: switchValue,
        activeTrackColor: AppColor.darkOrange,
        activeColor: AppColor.darkOrange,
        activeThumbImage: AssetImage(IconPath.checkSwitch),
        inactiveThumbImage: AssetImage(IconPath.noCheckSwitch));
  }
}
