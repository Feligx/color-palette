import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  final List availableColors = const [
    [
      '#AD7BE9',
      '#3E54AC',
      '#BFDCE5',
      '#EEEEEE'
    ],
    [
      '#000000',
      '#0F6292',
      '#16FF00',
      '#FFED00'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ],
    [
      '#00425A',
      '#1F8A70',
      '#BFDB38',
      '#FC7300'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: (Center(
          child: SingleChildScrollView(
            child: Column(
              children:
                List.generate(availableColors.length, (index) => ColorPalette(colors: availableColors[index], onTap: showColor))
              ,
            )
          )
        )));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette - $value',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
