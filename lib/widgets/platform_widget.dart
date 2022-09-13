/*Pertama, buat custom widget yang akan membantu kita dalam pengembangan selanjutnya. Widget ini akan menentukan mana UI yang perlu ditampilkan sesuai dengan platform perangkat yang digunakan. Di dalam folder widgets buatlah berkas baru bernama platform_widget.dart.*/
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformWidget extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  const PlatformWidget(
      {Key? key, required this.androidBuilder, required this.iosBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
