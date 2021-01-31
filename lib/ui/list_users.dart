import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/themes/style_text.dart';
import 'package:day03_ex/ui/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListUsers extends StatelessWidget {
  final bool isLoading;
  final List<User> users;

  const ListUsers({Key key, this.users, this.isLoading})
      : assert(isLoading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "List friends",
            style: StylesText.h1,
          ),
          Gaps.vGap16,
          !isLoading ? _buildShimmerLoading() : _buildListUsers(),
        ],
      ),
    );
  }

  Widget _buildListUsers() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final user = users[index];
        return UserItem(user);
      },
      itemCount: users.length,
    );
  }

  Widget _buildShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.gap_dp16),
      child: Shimmer.fromColors(
        // baseColor: Colors.grey[600],
        // highlightColor: Colors.grey[700],
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[400],
        enabled: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: Dimens.gap_dp24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 90.0,
                  height: 90.0,
                ),
                Gaps.hGap16,
                Expanded(
                  child: Container(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              height: Dimens.gap_dp16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                              width: 40,
                              height: Dimens.gap_dp8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.hGap16,
                Container(
                  height: 90,
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          itemCount: 7,
        ),
      ),
    );
  }
}
