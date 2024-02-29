



import '../../../models/banner_model.dart';
import 'package:flutter/material.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
    super.key,
    required this.height,
    required this.banner
  });

  final double height;
  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30,),
        Text(banner.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),

        GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: banner.sectionnew.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: .55

            ),
            itemBuilder: (context,index){
              return banner.sectionnew[index].attachments.isNotEmpty?Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        banner.sectionnew[index].attachments.first.imageUrl,
                        fit:  BoxFit.cover,
                        height: height/3,
                      )),
                  Text(banner.sectionnew[index].serviceName,style: const TextStyle(fontSize: 10),),
                  // Text(banner.banners[4].sectionnew[index].shortDesc,style: TextStyle(fontSize: 10),),
                  // Text(banner.banners[4].sectionnew[index].actualPrice.toString(),style: TextStyle(fontSize: 10),)
                ],
              ):const SizedBox.shrink();
            }),
      ],
    );
  }
}