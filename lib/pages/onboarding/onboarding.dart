import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/pages/Login/login.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  PageController topPageController = PageController();
  PageController bottomPageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text(
                  "Skip".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.44),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: topPageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SvgPicture.asset(
                      "assets/svg/onboarding-image/Onboarding1.svg",
                      width: 214,
                      height: 280,
                    ),
                    SvgPicture.asset(
                      "assets/svg/onboarding-image/Onboarding2.svg",
                      width: 214,
                      height: 280,
                    ),
                    SvgPicture.asset(
                      "assets/svg/onboarding-image/Onboarding3.svg",
                      width: 214,
                      height: 280,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 4,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 26,
                        decoration: BoxDecoration(
                          color: currentPage == index ? Colors.white : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        margin: EdgeInsets.only(right: 8),
                      );
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView(
                  controller: bottomPageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "Manage your tasks",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.87),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 42),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "You can easily manage all of your daily tasks in DoMe for free",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.87),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "Create daily routine",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.87),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 42),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "In Uptodo  you can create your personalized routine to stay productive",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.87),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "Orgonaize your tasks",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.87),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 42),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "You can organize your daily tasks by adding your tasks into separate categories",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.87),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 110,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentPage > 0
                        ? ElevatedButton(
                            onPressed: () {
                              topPageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              bottomPageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              setState(() {
                                currentPage--;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff121212),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              "BACK",
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.44),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : SizedBox(width: 80),
                    ElevatedButton(
                      onPressed: () {
                        if (currentPage < 2) {
                          topPageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          bottomPageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          setState(() {
                            currentPage++;
                          });
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8875FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        currentPage < 2 ? "NEXT" : "GET STARTED",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
