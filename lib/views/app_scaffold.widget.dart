import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thinkific/state_management/app_bloc.dart';
import 'package:thinkific/widgets/home_content.widget.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bc.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            const SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: HomeContent()),
          ],
        ),
      ),
    );
  }
}
