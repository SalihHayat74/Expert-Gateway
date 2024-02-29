
import 'package:expert_gateway/providers/banner_provider.dart';
import 'package:expert_gateway/screens/home_screen/widgets/all_services_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/banner_2_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/industries_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/just_for_you_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/offer_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/trending_widget.dart';
import 'package:expert_gateway/screens/home_screen/widgets/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getBanners();
    super.initState();
  }
  getBanners()async{
    await Provider.of<BannerProvider>(context,listen:false).getBanners();
    setState(() {
      isLoading=false;
    });
  }

  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Expert",style: TextStyle(color: Colors.white),),
        leading: const Icon(Icons.person,color: Colors.white,),
        actions: const [
          Icon(Icons.flag_circle,color: Colors.white,),
          SizedBox(width: 5,),
          Icon(Icons.notifications_none,color: Colors.white,),
          SizedBox(width: 20,)

        ],
      ),
      body: Consumer<BannerProvider>(

        builder: (context,banner,_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height/7,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                      
                      
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.search_rounded,color: Colors.red,),
                          hintText: "Search any service, Any time, Any where",
                          hintStyle: const TextStyle(
                            fontSize: 12
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none
                      
                          )
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Searching in London",style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
                isLoading?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height/3,),
                    const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()),

                  ],
                ):ListView.builder(
                    itemCount: banner.banners.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    itemBuilder:(context,index){
                      return index==0?
                      BannerWidget(height: height,banner: banner.banners.first,):
                      index==1?
                      IndustriesWidget(banner: banner.banners[index],):
                      index==2?
                      Banner2Widget(height: height,banner: banner.banners[index],)
                          :index==3?
                      JustForYouWidget(height: height, width: width,banner: banner.banners[index],):
                      index==4?
                      TrendingWidget(height: height,banner: banner.banners[index],):
                      index==5?
                      OffersWidget(height: height, width: width,banner: banner.banners[index],):
                      AllServicesWidget(height: height, width: width,banner: banner.banners[index],);
                    })
              ],
            ),
          );
        }
      ),
    );
  }
}
