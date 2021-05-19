import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class TagBar extends StatelessWidget {
  final int pageIndex;
  final EdgeInsetsGeometry tagMargin;

  const TagBar(
      {Key key,
      @required this.pageIndex,
      this.tagMargin = const EdgeInsets.only(right: 10, bottom: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: tagMargin,
      height: 50,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          tagBarItem(
            tagText: "İngilizce",
            isActive: true,
            pageIndex: pageIndex,
          ),
          tagBarItem(
            tagText: "Matematik",
            isActive: false,
            pageIndex: pageIndex,
          ),
          tagBarItem(
            tagText: "Almanca",
            isActive: false,
            pageIndex: pageIndex,
          ),
          tagBarItem(
            tagText: "Programlama",
            isActive: false,
            pageIndex: pageIndex,
          ),
          tagBarItem(
            tagText: "Fizik",
            isActive: false,
            pageIndex: pageIndex,
          ),
        ],
      ),
    );
  }
}

class tagBarItem extends StatelessWidget {
  final String tagText;
  final bool isActive;
  final int pageIndex;
  const tagBarItem({
    Key key,
    @required this.tagText,
    this.isActive = false,
    this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _activeColor;

    if (pageIndex == 0) {
      _activeColor = turuncuDefault;
    } else if (pageIndex == 1) {
      _activeColor = turkuazDefault;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isActive ? _activeColor : widgetBackgroundColor,
                ),
                child: Align(
                  child: Text(
                    tagText,
                    style: TextStyle(
                        fontFamily: "Raleway",
                        color: isActive ? Colors.white : textDisabledColor),
                  ),
                ),
              ),
              Positioned(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      print("Tag item Cliked");
                    },
                    child: Container(
                      width: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
