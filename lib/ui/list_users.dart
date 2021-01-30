import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/themes/style_text.dart';
import 'package:flutter/material.dart';

class ListUsers extends StatelessWidget {
  final List<User> users;

  const ListUsers({Key key, this.users})
      : assert(users != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("List friends", style: StylesText.h1),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final user = users[index];
            return Text(
              user.name.toString(),
            );
          },
          itemCount: users.length,
        )
      ],
    );
  }
}
