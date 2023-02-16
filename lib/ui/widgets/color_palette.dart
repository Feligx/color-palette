import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';

class ColorPalette extends StatelessWidget {
  final List colors;
  final Function(String) onTap;

  const ColorPalette({
    Key? key,
    required this.colors,
    required this.onTap,
    // así se reciben en el constructor, por ejemplo
    //required this.baseColor,
  }) : super(key: key);

  // atributos de la clase, por ejemplo
  //final String baseColor;

  // también se puede tener como un atributo un callback, necesiario ya que es un
  // widget sin estado, por ejemplo
  //final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    // padding para crear espacio alrededor del widget
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // vamos a mostrar los elementos en un row
      child: Row(
        children: List.generate(colors.length, (index) => Expanded(
            flex: (4 / (index + 1))
                .round(),
            child: GestureDetector(
                onTap: () => onTap(colors[index]),
                child: Container(
                    height: 100,
                    color: ColorUtils.FromHex(colors[index])
                )
            )
        ))
      )
    );
  }
}
