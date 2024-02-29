
import '../../../models/banner_model.dart';
import 'package:flutter/material.dart';

class IndustriesWidget extends StatelessWidget {
  const IndustriesWidget({
    super.key,
    required this.banner
  });

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: banner.sectionnew.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: .6

        ),
        itemBuilder: (context,index){
          return banner.sectionnew[index].attachments.isNotEmpty?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(banner.sectionnew[index].attachments.first.imageUrl),
              Text(banner.sectionnew[index].serviceName,style: const TextStyle(fontSize: 10),)
            ],
          ):const SizedBox.shrink();
        });
  }
}
