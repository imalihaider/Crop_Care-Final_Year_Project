import 'package:flutter/material.dart';
import 'package:plantdetectionfyp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:plantdetectionfyp/models/user_model.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //
  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    final namefield = Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        )
    );
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            BigUserCard(
              cardColor: Color(0xff296e48),
              userName: 'Ali Haider',


              // userName: namefield,
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.green[600],
                ),

                title: "Modify",
                subtitle: "Tap to change your data",
                onTap: () {
                  print("OK");
                },

              ),
              userProfilePic: AssetImage('assets/images/posty.jpeg'),

            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  // icons: CupertinoIcons.pencil_outline,
                  icons: CupertinoIcons.person_add,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Color(0xff296e48),
                  ),

                  title: 'Privacy',
                  subtitle: "Make Planta'App yours",
                ),
              ],
            ),
            SettingsGroup(items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Color(0xff296e48),
                ),
                title: 'Dark mode',
                subtitle: "Automatic",
                trailing: Switch.adaptive(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ]),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => About()));
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Color(0xff296e48),
                    withBackground: true,
                  ),
                  title: 'About',
                  subtitle: "Learn more about Planta'App",
                ),
              ],
            ),
            SettingsGroup(items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.help_outline_outlined,
                iconStyle: IconStyle(
                    backgroundColor: Color(0xff296e48),
                    withBackground: true,
                    iconsColor: Colors.white),
                title: 'Help & Support',
                subtitle: 'Let us know how we can help you',
              )
            ]),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.mail,
                  iconStyle: IconStyle(
                      backgroundColor: Color(0xff296e48),
                      iconsColor: Colors.white),
                  title: "Change email",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SettingsGroup(items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.lock,
                iconStyle: IconStyle(
                    backgroundColor: Color(0xff296e48),
                    iconsColor: Colors.white),
                title: "Change password",
                titleStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            SettingsGroup(items: [
              SettingsItem(
                onTap: () {
                  logout(context);
                },
                icons: Icons.exit_to_app_rounded,
                iconStyle: IconStyle(
                    backgroundColor: Color(0xff296e48),
                    iconsColor: Colors.white),
                title: "Sign Out",
                titleStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            SettingsGroup(items: [
              // SettingsItem(
              //   onTap: () {},
              //   icons: CupertinoIcons.delete_solid,
              //   iconStyle: IconStyle(
              //       backgroundColor: Color(0xff296e48),
              //       iconsColor: Colors.white),
              //   title: "Delete account",
              //   titleStyle: TextStyle(
              //     color: Colors.red,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ]),
          ],
        ),
      ),
    );
  }
}

// the logout function
Future<void> logout(BuildContext context) async {

  showDialog(context: context, builder: (context)
  {

    return Center(child: CircularProgressIndicator(
      backgroundColor: Constants.primaryColor,
      color: Colors.white,
      strokeWidth: 5,



    ));
  },
  );



  // await FirebaseAuth.instance.signOut();
  // Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context) => SignIn()));
}
