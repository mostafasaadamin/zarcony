import 'dart:io';

// import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ProfileWidget extends StatelessWidget {
  File? imagePath;
  String? imageUrl;
  bool isEdit;
  VoidCallback onClicked;

  ProfileWidget({
     this.imagePath,
    required this.imageUrl,
    this.isEdit = false,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return   CircularProfileAvatar(
      '',
      errorWidget: (context, url, error) => Container(
        child: const Icon(Icons.error),
      ),
      placeHolder: (context, url) => SizedBox(
        width: ScreenUtil().setWidth(50.05),
        height: ScreenUtil().setHeight(50.05),
        child:  const CircularProgressIndicator(),
      ),
      child:imagePath!=null?Image.file(imagePath!,fit: BoxFit.cover,)
          :imageUrl!=null?Image.network(imageUrl!,fit: BoxFit.cover,):
      SvgPicture.asset("assets/placholderImage.svg",
        fit: BoxFit.contain,
      ),
      radius: 20,
      backgroundColor: Colors.white,
      borderWidth: imagePath!=null?2:2,
      borderColor: imagePath!=null?Colors.grey:Colors.grey,
      imageFit: BoxFit.cover,
      elevation:0.2,
      onTap: () {

      },
      cacheImage: true,

      showInitialTextAbovePicture: false,
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 0,
    child: buildCircle(
        color: color,
        all: 0,
        child: SvgPicture.asset(
          "assets/camera.svg",
          width: ScreenUtil().setHeight(30),
          height: ScreenUtil().setWidth(30),)
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          // color: color,
          child: child,
        ),
      );
}