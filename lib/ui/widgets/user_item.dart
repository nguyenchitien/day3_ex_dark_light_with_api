import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/ui/widgets/circle_loading_image.dart';
import 'package:day03_ex/ui/widgets/rouned_icon_button.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.user, {Key key}) : super(key: key);

  final User user;

  final itemHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.gap_dp16),
      margin: EdgeInsets.only(bottom: Dimens.gap_dp16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.gap_dp12),
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
                onPressed: () {},
                padding: EdgeInsets.all(16),
                color: Theme.of(context).primaryColor,
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
              Text("${user.phone}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          )
        ],
      ),
    );
  }
}
