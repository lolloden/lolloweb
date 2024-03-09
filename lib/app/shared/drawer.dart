import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolloweb/app/modules/home/controllers/language_controller.dart';
import 'package:lolloweb/app/modules/home/views/settings_view.dart';
import 'package:lolloweb/app/shared/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('images/splash.png'),
              ),
            ),
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info, size: drawerIconSize),
            title: const Text(
              'Welcome',
              style: kStyle20,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user, size: drawerIconSize),
            title: const Text(
              'Settings',
              style: kStyle20,
            ),
            onTap: () {
              Get.to(() => SettingsView());
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}
