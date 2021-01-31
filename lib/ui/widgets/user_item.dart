import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/ui/widgets/avatar_bottom_sheet.dart';
import 'package:day03_ex/ui/widgets/circle_loading_image.dart';
import 'package:day03_ex/ui/widgets/rouned_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.user, {Key key}) : super(key: key);

  final User user;

  final itemHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    // Issue Brightness
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent, // status bar color
      ),
    );

    return Container(
      padding: EdgeInsets.all(Dimens.gap_dp16),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(Dimens.gap_dp12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 16,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleLoadingImage(
            "${user.picture.mediumImg}",
            width: itemHeight,
            height: itemHeight,
          ),
          Gaps.hGap16,
          Expanded(
            child: _buildUserInfo(context),
          ),
          Container(
            width: 40,
            height: itemHeight,
            child: Center(
              child: RoundedIconButton(
                onPressed: () async {
                  await showAvatarModalBottomSheet(
                    expand: true,
                    context: context,
                    url: user.picture.thumbnailImg,
                    backgroundColor: Colors.transparent,
                    builder: (context) => _buildContentModel(context),
                  );
                },
                padding: EdgeInsets.all(16),
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: itemHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name.toString(),
                  style: Theme.of(context).textTheme.headline6),
              Gaps.vGap8,
              Text(user.location.country,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          Row(
            children: [
              _buildIconText(context, user.phone),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconText(BuildContext context, String title) {
    return Row(
      children: [
        Icon(Icons.phone_android_outlined, color: Colors.grey[600]),
        Gaps.vGap8,
        Text(
          "${user.phone}",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(fontSize: Dimens.font_sp16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildContentModel(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.all(Dimens.gap_dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User profile", style: Theme.of(context).textTheme.headline3),
            Gaps.vGap24,
            _buildUserInfoItem(context,
                title: "UserName", value: user.name.toString()),
            Gaps.vGap24,
            _buildUserInfoItem(context, title: "Email", value: user.email),
            Gaps.vGap24,
            _buildUserInfoItem(context, title: "Phone", value: user.phone),
            Gaps.vGap24,
            _buildUserInfoItem(context, title: "Gender", value: user.gender),
            Gaps.vGap24,
            _buildUserInfoItem(context,
                title: "Date of birth", value: user.dob.toString()),
            Gaps.vGap24,
            _buildUserInfoItem(context, title: "Location", value: ""),
            Gaps.vGap24,
            Expanded(
              child: _buildUserLocation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserLocation() {
    print("${user.location.latitude} ${user.location.longitude}");
    return GoogleMap(
      // onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(user.location.latitude, user.location.longitude),
        zoom: 11.0,
      ),
    );
  }

  Widget _buildUserInfoItem(BuildContext context, {String title, value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.grey)),
        Text(capitalize(value),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(letterSpacing: 1)),
      ],
    );
  }

  String capitalize(String value) {
    if (value.length == 0) return value;
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }
}
