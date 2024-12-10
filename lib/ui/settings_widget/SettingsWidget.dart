import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settingswidget extends StatefulWidget {
  const Settingswidget({super.key});

  @override
  State<Settingswidget> createState() => _SettingswidgetState();
}

class _SettingswidgetState extends State<Settingswidget> {
  final List<String> items = ['English', 'العربية'];
  String? selecteditems = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 29,top: 26,right: 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language",style: Theme.of(context).textTheme.titleMedium?.
          copyWith(fontSize: 14.sp),),
          SizedBox(height: 10.h,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.w,color: Theme.of(context).colorScheme.primary)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: selecteditems,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
                items: items.map((item)=>DropdownMenuItem<String>(
                  value: item,
                    child: Text(item,style: TextStyle(fontSize: 18))
                  )).toList(),
                onChanged: (item) => setState(() => selecteditems=item),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
