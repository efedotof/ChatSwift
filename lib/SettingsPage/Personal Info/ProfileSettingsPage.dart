import 'package:flutter/material.dart';

import 'widgets/AvatarChange.dart';
import 'widgets/BioChange.dart';
import 'widgets/PersonalInfo.dart';


class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        title: Text(
              'Profile Settings',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons
              .chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            AvatarChange(),
            SizedBox(height: 30,),
            PersonalInfo(),
            SizedBox(height: 30,),
            BioChange(),
          ],
        ),
      ),
    );
  }
}