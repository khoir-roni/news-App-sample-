import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          // digunakan untuk memposisikan widget pada lokasi aman dari status bar
          child: Stack(
        children: [
          body,
          Card(
            shape: const BeveledRectangleBorder(
              //ubah bentuk app bar
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16.0),
              ),
            ),

            margin: const EdgeInsets.all(0), // hilangkan margin bawaan
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // ukuran widget row menajadi minimum
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Padding(
                  // di samping icon back tambah text
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    'N',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
