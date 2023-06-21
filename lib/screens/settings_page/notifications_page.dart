import 'package:flutter/material.dart';
import 'package:pbh_project/reusable_widgets/app_bar.dart';
import 'package:pbh_project/reusable_widgets/switch_list_tile.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  //Variables
  bool _notificationsEnabled = true;
  bool _newMessageNotificationsEnabled = true;
  bool _favoriteBookUpdatesEnabled = true;
  bool _releaseReminderNotificationsEnabled = true;
  bool _wishListNotificationsEnabled = true;
  bool _appAnnouncementNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomSwitchListTile(
            title: 'Enable All Notifications',
            value: _notificationsEnabled,
            onChanged: (value) => setState(
              () {
                _notificationsEnabled = value;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSwitchListTile(
            title: 'Update Donations',
            value: _newMessageNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _newMessageNotificationsEnabled = value;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSwitchListTile(
            title: 'Release Reminders',
            value: _releaseReminderNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _releaseReminderNotificationsEnabled = value;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSwitchListTile(
            title: 'Wish List',
            value: _wishListNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _wishListNotificationsEnabled = value;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomSwitchListTile(
            title: 'App Announcements and Updates',
            value: _appAnnouncementNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _appAnnouncementNotificationsEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
