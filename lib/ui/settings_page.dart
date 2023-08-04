import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widget/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: const Text('Dark Theme'),
            trailing: Switch.adaptive(value: false, onChanged: (value) => {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('Coming soon!'),
                  content: const Text('This feature will be coming soon!'),
                  actions: [
                    TextButton(onPressed: () {
                      defaultTargetPlatform == TargetPlatform.iOS
                          ? showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Coming soon!'),
                              content:
                                const Text('This feature will be coming soon!'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }
                                )
                              ],
                            );
                          }
                      ) : showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Coming soon!'),
                              content:
                                const Text('This feature will be coming soon!'),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: const Text('Ok'))
                              ],
                            );
                          }
                      );
                    },
                        child: const Text('Ok'))
                  ],
                );
              })
            }),
          ),
        )
      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildList(context),
    );
  }
}