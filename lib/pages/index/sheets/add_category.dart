import 'package:flutter/material.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_fields.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});

  List<Color> colors = [Color(0xffC9CC41), Color(0xff66CC41), Color(0xff41CCA7), Color(0xff4181CC), Color(0xff41A2CC), Color(0xffCC8441), Color(0xff9741CC), Color(0xffCC4173)];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Create new category', style: TextStyle(color: Colors.white.withValues(alpha: 0.87), fontSize: 20, fontWeight: FontWeight.w700),),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                PrimaryTextField(labelName: 'Category name:', hintText: 'Category name', obscureText: false, hintColor: Color(0xffAFAFAF), enabledBorderColor: Colors.white,),
                SizedBox(height: 20),
                Text("Category icon :", style: TextStyle(color: Colors.white.withValues(alpha: 0.87), fontSize: 16),),
                SizedBox(height: 16,),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.21),
                    shadowColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    )
                  ),
                  child: Text("Choose icon from library", style: TextStyle(color: Colors.white.withValues(alpha: 0.87), fontSize: 12),)
                ),
                SizedBox(height: 20,),
                Text("Category color :", style: TextStyle(color: Colors.white.withValues(alpha: 0.87), fontSize: 16),),
                SizedBox(height: 16,),
                SizedBox(
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index){
                    return Container(
                        width: 36,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle
                        ),
                        margin: EdgeInsets.only(right: 12),
                    );  
                  }),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Expanded(child: PrimaryButton(text: "Cancel", onPressed: () => Navigator.pop(context), backgroundColor: Colors.transparent, textColor: Color(0xff8687E7))),
                    SizedBox(width: 20,),
                    Expanded(child: PrimaryButton(text: "Create Category", onPressed: () => Navigator.pop(context), backgroundColor: Color(0xff8687E7), textColor: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}