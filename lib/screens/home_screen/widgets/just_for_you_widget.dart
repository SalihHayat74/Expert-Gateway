


import '../../../models/banner_model.dart';
import 'package:flutter/material.dart';


class JustForYouWidget extends StatelessWidget {
  const JustForYouWidget({
    super.key,
    required this.height,
    required this.width,
    required this.banner
  });

  final double height;
  final double width;
  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30,),
        Text(banner.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
        Container(
          height: height/2,
          width: width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),

          child: ListView.builder(
              itemCount: banner.sectionnew.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  height: height/4,
                  width: width/1.5,
                  margin: const EdgeInsets.all(5),


                  child: Stack(
                    // alignment: Alignment.bottomCenter,
                    children: [
                      // CarouselSlider(items: List.generate(banner.banners[3].sectionnew[index].attachments.length, (i) =>
                      // Image.network(banner.banners[3].sectionnew[index].attachments[i].imageUrl)), options: CarouselOptions(
                      //   autoPlay: true
                      // )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            banner.sectionnew[index].attachments.first.imageUrl,
                            fit: BoxFit.fill,
                            height: height/2,
                            // width: width/2,
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(banner.sectionnew[index].serviceName,style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(banner.sectionnew[index].shortDesc.length>40?banner.sectionnew[index].shortDesc.substring(0,40):banner.sectionnew[index].shortDesc,style: const TextStyle(fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ),


                    ],
                  ),
                );

              }),
        ),
      ],
    );
  }
}