import 'package:flutter/material.dart';

class GLRow2 extends StatelessWidget {
  final Image image;
  final String title;
  final String desc;
  final Widget more;
  final int color;

  final bool horizontal;

  GLRow2(
      {Key key,
      this.image,
      this.title,
      this.desc,
      this.more,
      this.color = 0xFF333366,
      this.horizontal = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontFamily: 'Poppins');
    TextStyle headerTextStyle = textStyle.copyWith(
        color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600);
    TextStyle regularTextStyle = textStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 11.0,
        fontWeight: FontWeight.w400);
    
    final planetCardContenChildren = <Widget>[
      Container(height: 4.0),
      Text(title, style: headerTextStyle)
    ];

    if (desc.isNotEmpty) {
      planetCardContenChildren.addAll(<Widget>[
        Container(height: 10.0),
        Text(desc, style: regularTextStyle)
      ]);
    }

    if (more != null) {
      planetCardContenChildren.add(Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 2.0,
          width: 18.0,
          color: Color(0xff00c6ff)));
      planetCardContenChildren.add(more);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 18.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: planetCardContenChildren,
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 124.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 0.0),
      decoration: BoxDecoration(
        color: Color(color),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          planetCard,
        ],
      ),
    );
  }
}
