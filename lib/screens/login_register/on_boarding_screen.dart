import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shared/local/cash_helper.dart';
import 'package:shopping/shared/local/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/local/component/component.dart';
import 'Login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

   var pageController=PageController();
   bool isLastPage=false;

  List<PageModel> pagesData=[
    PageModel(img: "assets/images/onboard_1.jpg", title: "Page Title 1", body: "Page Body 1",),
    PageModel(img: "assets/images/onboard_1.jpg", title: "Page Title 2", body: "Page Body 2",),
    PageModel(img: "assets/images/onboard_1.jpg", title: "Page Title 3", body: "Page Body 3",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              MyComponents.navigateAndFinish(context,  LoginScreen(),);
              CashHelper.saveData(key: "isBoardingScreen", value: false);
            },
            child: const Text("SKIP"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (int index){
                  if(pagesData.length-1==index){
                    isLastPage=true;
                  }
                },
                itemBuilder: (context, index) => pageItem(
                    context: context,
                  record: pagesData[index],
                ),
                itemCount: pagesData.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pagesData.length,
                  effect:  ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5,
                    dotColor: Colors.green,
                    activeDotColor: MyColors.defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLastPage){
                        MyComponents.navigateAndFinish(context,  LoginScreen(),);
                        CashHelper.saveData(key: "isBoardingScreen", value: false);
                      }else{
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500,),
                          curve: Curves.fastLinearToSlowEaseIn,);
                      }
                    },
                  backgroundColor: MyColors.defaultColor,
                  child: const Icon(Icons.arrow_forward,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageItem({required BuildContext context,
  required PageModel record,
  }) => Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(record.img!),
          ),
          const SizedBox(
            height: 30,
          ),
           Text(
            record.title!,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(record.body!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
}

class PageModel{
  String? img;
  String? title;
  String? body;
  PageModel({
    required this.img,
    required this.title,
    required this.body,
});
}