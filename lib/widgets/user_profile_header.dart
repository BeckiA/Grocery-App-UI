import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_user.dart';
import '../services/login_service.dart';

class UserProfilePic extends StatelessWidget {
  bool showProfilePic;
  UserProfilePic(this.showProfilePic);

  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;

    String? imgPath = userModel != null ? userModel.photoUrl : '';

    return showProfilePic && imgPath!.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(child: Image.network(imgPath)))
        : const SizedBox(width: 40, height: 40);
  }
}
