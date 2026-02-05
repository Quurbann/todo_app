import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/pages/index/sheets/add_category.dart';
import 'package:todo_app/widgets/primary_button.dart';

class GiveCategory extends StatelessWidget {
  GiveCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff363636),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withValues(alpha: 0.87),
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Color(0xff979797), height: 1),
              SizedBox(height: 22),
              Wrap(
                spacing: 50,
                runSpacing: 42,
                children: [
                  CategoryAdd(
                    backgroundColor: Color(0xffCCFF80),
                    svgAsset: 'bread1',
                    categoryName: 'Grocery',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xffFF9680),
                    svgAsset: 'briefcase1',
                    categoryName: 'Work',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff80FFFF),
                    svgAsset: 'sport1',
                    categoryName: 'Sport',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff80FFD9),
                    svgAsset: 'design',
                    categoryName: 'Design',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff809CFF),
                    svgAsset: 'mortarboard1',
                    categoryName: 'University',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xffFF80EB),
                    svgAsset: 'megaphone1',
                    categoryName: 'Social',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xffFC80FF),
                    svgAsset: 'music1',
                    categoryName: 'Music',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff80FFA3),
                    svgAsset: 'heartbeat1',
                    categoryName: 'Health',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff80D1FF),
                    svgAsset: 'videocamrea1',
                    categoryName: 'Video',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xffFFCC80),
                    svgAsset: 'home1',
                    categoryName: 'Home',
                  ),
                  CategoryAdd(
                    backgroundColor: Color(0xff80FFD1),
                    svgAsset: 'add1',
                    categoryName: 'Create New',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCategory()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: "Add Category",
                      backgroundColor: Color(0xff8687E7),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryAdd extends StatelessWidget {
  final Color backgroundColor;
  final String svgAsset;
  final String categoryName;
  final VoidCallback? onPressed;

  const CategoryAdd({
    super.key,
    required this.backgroundColor,
    required this.svgAsset,
    required this.categoryName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => onPressed?.call(),
          padding: EdgeInsets.all(0),
          icon: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(
              'assets/svg/index/index-priority/$svgAsset.svg',
              width: 32,
              height: 32,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(categoryName, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
