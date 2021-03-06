import 'package:flutter/material.dart';
import 'package:main/locator.dart';
import '../../store/auth_user/auth_user.store.dart';

class AddBankButtonButton extends StatelessWidget {
  final authUserStore = locator<AuthUserStore>();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      child: Text('Add New Bank Account'),
      onPressed: () async {
        await authUserStore.connectFinancialInstitution(context);
      },
    );
  }
}
