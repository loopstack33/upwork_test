import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upwork_test/models/brands_model.dart';
import 'package:upwork_test/service/home_api.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/widgets/bottom_bar.dart';
import 'package:upwork_test/widgets/shimmer_widget.dart';
import 'package:upwork_test/widgets/top_bar.dart';
import 'components/invite_friend.dart';
import 'components/recent_visits.dart';
import 'components/top_brand.dart';
import 'components/top_categories.dart';
import 'models/categories_model.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upwork Test',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoading = true;
  var userName="";
  var portfolioValue = "";
  var cashOutValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  //GET USER
  void fetchUser() async {
    try {
      var list = await HomeService().getUser();
      userName = list.user[0].name.toString();
      portfolioValue= list.portfolioValue.toString();
      cashOutValue = list.user[0].cashoutValue.toString();

    } finally {
      fetchBrands();
    }
  }

  List<Store>? brandData;

  //GET BRANDS
  void fetchBrands() async {
    try {
      brandData = await HomeService().getBrands();

    } finally {
     fetchCategories();
    }
  }

  List<Category>? categoryData;
  //GET CATEGORIES
  void fetchCategories() async {
    try {
      categoryData = await HomeService().getCategories();

    } finally {
     if(mounted){
       setState(() {
         isLoading = false;
       });
     }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: AppColors.appGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize:const Size.fromHeight(100),
            child: TopBar(isLoading: isLoading,name:userName.toString(),value:portfolioValue.toString(),amount:cashOutValue.toString()),
          ),

        ),
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0,-4)
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: isLoading?
          Shimmer.fromColors(
            baseColor: AppColors.backcolor,
            highlightColor: AppColors.greyColor22,
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return  ShimmerWidget();
                  }),
            ),
          )
            :Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:const EdgeInsets.only(left: 20, right: 20,bottom:10,top: 20),
                  child: Column(
                    children: [
                      TopBrand(brandData:brandData!),
                      const SizedBox(height: 30),
                      TopCategories(categoryData:categoryData!),
                      const SizedBox(height: 30),
                      const RecentVisits(),
                      const SizedBox(height: 30),
                      const InviteFriend(),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
              const BottomBar(),
            ],
          ),
        ),
      ),

    );
  }

}
