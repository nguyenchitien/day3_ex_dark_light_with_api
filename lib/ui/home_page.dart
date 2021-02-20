import 'package:day03_ex/model/user_model.dart';
import 'package:day03_ex/repository/repository.dart';
import 'package:day03_ex/res/dimens.dart';
import 'package:day03_ex/ui/list_users.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function changeDarkThemeCallBack;

  const HomePage({this.changeDarkThemeCallBack});

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
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: Dimens.gap_dp16),
          child: _buildContent(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.changeDarkThemeCallBack,
        child: Icon(Icons.wb_sunny_sharp),
      ),
    );
  }

  Widget _buildContent() {
    return ListUsers(isLoading: isLoading, users: users);
  }
}
