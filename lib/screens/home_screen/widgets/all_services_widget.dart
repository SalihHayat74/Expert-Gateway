
import '../../../models/banner_model.dart';
import 'package:flutter/material.dart';

class AllServicesWidget extends StatelessWidget {
  const AllServicesWidget({
    super.key,
    required this.height,
    required this.width,
    required this.banner
  });

  final BannerModel banner;
  final double height;
  final double width;

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
                childAspectRatio: .45

            ),
            itemBuilder: (context,index){
              return banner.sectionnew[index].attachments.isNotEmpty?Column(

                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(banner.sectionnew[index].attachments.first.imageUrl,
                        height: height/3.3,
                        width: width/2,
                        fit:  BoxFit.cover,)),
                  ListTile(
                    title: Text(banner.sectionnew[index].serviceName,textAlign: TextAlign.center,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      children: [
                        Text(banner.sectionnew[index].shortDesc.length>40?
                        banner.sectionnew[index].shortDesc.substring(0,40):banner.sectionnew[index].shortDesc,textAlign: TextAlign.center,style: const TextStyle(fontSize: 10),),
                        Text(banner.sectionnew[index].actualPrice.toString()+banner.sectionnew[index].symbol,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)

                      ],
                    ),

                  )
                ],
              ):const SizedBox.shrink();
            }),
      ],
    );
  }
}