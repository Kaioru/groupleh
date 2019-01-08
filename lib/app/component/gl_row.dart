import 'package:flutter/material.dart';

class GLRow extends StatelessWidget {
  final Image image;
  final String title;
  final String desc;
  final int amount;

  const GLRow({Key key, this.image, this.title, this.desc, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontFamily: 'Poppins');
    final headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
    final regularTextStyle = textStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

    return Container(
      margin: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
        left: 24.0,
        right: 24.0,
      ),
      height: 120.0,
      child: Stack(
        children: <Widget>[
          Container(
              height: 124.0,
              margin: EdgeInsets.only(left: 46.0),
              decoration: BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
                constraints: BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 4.0),
                    Text(
                      title,
                      style: headerTextStyle,
                    ),
                    Container(height: 10.0),
                    Text(desc, style: subHeaderTextStyle),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 2.0,
                        width: 18.0,
                        color: Color(0xff00c6ff)),
                    Row(
                      children: <Widget>[
                        Icon(Icons.people, size: 12.0),
                        Container(width: 8.0),
                        Text(
                          amount.toString(),
                          style: regularTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: image,
            ),
          )
        ],
      ),
    );
  }
}
