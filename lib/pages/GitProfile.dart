import 'package:flutter/material.dart';
import 'package:github_profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profile/pages/widgets/TextFormField.dart';
import 'package:github_profile/pages/widgets/buildUserData.dart';

class GitProfile extends StatefulWidget {
  @override
  _GitProfileState createState() => _GitProfileState();
}

class _GitProfileState extends State<GitProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2BE1C8),
      appBar: AppBar(
        backgroundColor: Color(0xFF188991),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "GITHUB PROFILE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 650,
            child: BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileInitial)
                  return buildInitialTextField();
                else if (state is ProfileLoading)
                  return buildLoadingState();
                else if (state is ProfileLoaded)
                  return buildUserData(state.profile);
                else
                  return buildInitialTextField();
              },
              listener: (context, state) {
                if (state is ProfileError) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInitialTextField() {
    return Center(
      child: UserNameInputField(),
    );
  }

  Widget buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
