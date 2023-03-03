import 'package:flutter/material.dart';

class ArtPostingPage extends StatelessWidget {
  const ArtPostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          ),
        ));
  }
}
// Container(
//     width: 335,
//     height: 71,
//     child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:[
//             Text(
//                 "Upload Licence",
//                 style: TextStyle(
//                     color: Color(0xff223263),
//                     fontSize: 14,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.50,
//                 ),
//             ),
//             SizedBox(height: 8),
//             SizedBox(
//                 width: 335,
//                 height: 42,
//                 child: Material(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 1, color: Color(0xffeaefff), ),
//                         borderRadius: BorderRadius.circular(5),
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     child: Padding(
//                         padding: const EdgeInsets.only(left: 16, right: 126, top: 13, bottom: 7, ),
//                         child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children:[
//                                 Text(
//                                     "Choose License  From Gallery",
//                                     style: TextStyle(
//                                         color: Color(0xff9098b1),
//                                         fontSize: 12,
//                                         fontFamily: "Poppins",
//                                         fontWeight: FontWeight.w700,
//                                         letterSpacing: 0.50,
//                                     ),
//                                 ),
//                             ],
//                         ),
//                     ),
//                 ),
//             ),
//         ],
//     ),
// )