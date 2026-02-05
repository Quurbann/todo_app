import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_fields.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

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
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24),
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

            ],
          ),
        ),
      ),
    );
  }
}