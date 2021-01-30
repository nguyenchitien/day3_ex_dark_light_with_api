import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/repository/repository.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/themes/style_text.dart';
import 'package:day03_ex/ui/list_users.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users;
  bool isLoading = false;

  void _fetchUsers() async {
    users = await Repository().fetchUsers();

    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();

    // fetch list users
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData change with system theme
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(Dimens.gap_dp16),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (!isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListUsers(users: users);
  }
}
