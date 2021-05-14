import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';

class TagBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      height: 50,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          tagBarItem(
            tagText: "İngilizce",
            isActive: true,
          ),
          tagBarItem(
            tagText: "Matematik",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Almanca",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Programlama",
            isActive: false,
          ),
          tagBarItem(
            tagText: "Fizik",
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class tagBarItem extends StatelessWidget {
  final String tagText;
  final bool isActive;

  const tagBarItem({
    Key key,
    @required this.tagText,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isActive ? turuncuDefault : widgetBackgroundColor,
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
