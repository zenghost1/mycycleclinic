import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int maxLines;
    final String title;
    final bool hasTitle;
    final String initialValue;
    final Function(String)?onChanged;
    final Function(bool?)?onFocusChanged;
  const CustomTextField({
    
    super.key, required this.maxLines, required this.title, required this.hasTitle, required this.initialValue, required this.onChanged, this.onFocusChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          hasTitle?
          Expanded(child: SizedBox(width: 75, child: Text(title, style: Theme.of(context).textTheme.headline6),)):const SizedBox(),
          Expanded(
            child: Focus(
              child: TextFormField(maxLines: maxLines, initialValue: initialValue, onChanged: onChanged,
                onEditingComplete: (){
                  print('done');
                },
                decoration: InputDecoration(isDense: true, focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.background))),
              ),
              onFocusChange: onFocusChanged??(hasFocus){
                
              },
            ),
          ),
        ],
      ),
    );
  }
}