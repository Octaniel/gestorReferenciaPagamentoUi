import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropDown extends StatefulWidget {
  DropDown(this._list);

  List<String> _list;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        onTap: (){},
        items: widget._list.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        underline: Container(
          height: 39,
          decoration: ShapeDecoration(
            color: Color(0xFF2d363b),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Color(0xFF707070))),
          ),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 5)),
              Expanded(
                child: Center(
                  child: Text(
                    "Mais",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  ),
                ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        onChanged: (v) {
          Modular.to.pushNamed("/pagamento");
        },
      ),
    );
  }
}
