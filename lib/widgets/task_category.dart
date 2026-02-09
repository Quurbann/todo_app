import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/pages/index/sheets/add_category.dart';
import 'package:todo_app/widgets/primary_button.dart';

class GiveCategory extends StatefulWidget {
  GiveCategory({super.key});

  @override
  State<GiveCategory> createState() => _GiveCategoryState();
}

String category = ' ';
Color categoryBackgroundColor2 = Colors.white;

class _GiveCategoryState extends State<GiveCategory> {
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
                    categoryBackgroundColor: Color(0xffCCFF80),
                    svgAsset: 'Grocery',
                    categoryName: 'Grocery',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xffFF9680),
                    svgAsset: 'Work',
                    categoryName: 'Work',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff80FFFF),
                    svgAsset: 'Sport',
                    categoryName: 'Sport',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff80FFD9),
                    svgAsset: 'Design',
                    categoryName: 'Design',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff809CFF),
                    svgAsset: 'University',
                    categoryName: 'University',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xffFF80EB),
                    svgAsset: 'Social',
                    categoryName: 'Social',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xffFC80FF),
                    svgAsset: 'Music',
                    categoryName: 'Music',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff80FFA3),
                    svgAsset: 'Health',
                    categoryName: 'Health',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff80D1FF),
                    svgAsset: 'Video',
                    categoryName: 'Video',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xffFFCC80),
                    svgAsset: 'Home',
                    categoryName: 'Home',
                  ),
                  CategoryAdd(
                    categoryBackgroundColor: Color(0xff80FFD1),
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
  final Color categoryBackgroundColor;
  final String svgAsset;
  final String categoryName;
  final VoidCallback? onPressed;

  const CategoryAdd({
    super.key,
    required this.categoryBackgroundColor,
    required this.svgAsset,
    required this.categoryName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            category = categoryName;
            categoryBackgroundColor2 = categoryBackgroundColor;
          },
          padding: EdgeInsets.all(0),
          icon: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: categoryBackgroundColor,
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
