import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchBarWidget extends StatelessWidget {
  String? hint;
  @override
  GlobalKey? key;
Function(String text)? onChanged;
Function()? onTaped;
  SearchBarWidget({this.key,this.hint,this.onTaped,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        border: Border.all(width: 1,color:Colors.grey.withOpacity(0.5)),
        color: const Color(0xffF5F7F9),
        borderRadius: const BorderRadius.all( Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              maxLines: 1,
              style: TextStyle(
                  fontFamily: "din",
                  fontSize: 12.sp,
                  color:const Color(0xff8B8B8B)
              ),
              onChanged: onChanged,
              onTap:onTaped,
              decoration: InputDecoration(
                hintText:hint??"Search in thousands of products",
                hintStyle: TextStyle(
                    color:const Color(0xff8B8B8B),
                    fontFamily: "din",
                    fontSize: ScreenUtil().setSp(13)),
                prefixIcon: const Icon(Icons.search,),
                focusedBorder:
                const  OutlineInputBorder(borderSide:  BorderSide(color: Color(0xffF5F5F5),width: 1.0),borderRadius:  BorderRadius.all(  Radius.circular(8.0))),
                enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide(color:Color(0xffF5F5F5),width: 1.0),borderRadius:  BorderRadius.all(  Radius.circular(8.0)) ),
                constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setHeight(46),
                    maxWidth: ScreenUtil().setHeight(345)),
                border:const OutlineInputBorder(borderSide: BorderSide(color:Color(0xffF5F5F5),width: 1.0),borderRadius:  BorderRadius.all(  Radius.circular(8.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
