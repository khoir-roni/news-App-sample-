import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latihan_news_app/theme/styles.dart';
import 'package:latihan_news_app/widgets/platform_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Settings')),
      child: _buildList(context),
    );
  }

/*Buat metode _buildList() yang mengembalikan widget. Di sini kita isi dengan beberapa opsi pengaturan yang diinginkan. Untuk saat ini kita tambahkan Switch untuk mengatur tema dark.*/
  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: const Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                defaultTargetPlatform == TargetPlatform.iOS
                    ? showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Coming Soon!'),
                            content:
                                const Text('This feature will be coming soon!'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: secondaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      )
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Coming Soon!'),
                            content:
                                const Text('This feature will be coming soon!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  print('object');
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: secondaryColor),
                                ),
                              ),
                            ],
                          );
                        },
                      );
              },
            ),
          ),
        )
      ],
    );
  }
}
