

class BannerModel {
  int id;
  String name;
  int sectionTypeId;
  String sectionTypeName;
  int sectionVariationsId;
  String sectionVariationName;
  int countryId;
  bool hasService;
  bool hasbanner;
  bool hasIndustry;
  String textValue;
  int fontSize;
  String fontType;
  String fontStyle;
  String imageUrl;
  int positionNo;
  bool isShow;
  int? bannerServiceId;
  int? bannerofferId;
  String bannerUrl;
  List<SectionNew> sectionnew;

  BannerModel({
    required this.id,
    required this.name,
    required this.sectionTypeId,
    required this.sectionTypeName,
    required this.sectionVariationsId,
    required this.sectionVariationName,
    required this.countryId,
    required this.hasService,
    required this.hasbanner,
    required this.hasIndustry,
    required this.textValue,
    required this.fontSize,
    required this.fontType,
    required this.fontStyle,
    required this.imageUrl,
    required this.positionNo,
    required this.isShow,
    this.bannerServiceId,
    this.bannerofferId,
    required this.bannerUrl,
    required this.sectionnew,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      name: json['name'],
      sectionTypeId: json['sectionTypeId'],
      sectionTypeName: json['sectionTypeName'],
      sectionVariationsId: json['sectionVariationsId'],
      sectionVariationName: json['sectionVariationName'],
      countryId: json['countryId'],
      hasService: json['hasService'],
      hasbanner: json['hasbanner'],
      hasIndustry: json['hasIndustry'],
      textValue: json['textValue'],
      fontSize: json['fontSize'],
      fontType: json['fontType'],
      fontStyle: json['fontStyle'],
      imageUrl: json['imageUrl'],
      positionNo: json['positionNo'],
      isShow: json['isShow'],
      bannerServiceId: json['bannerServiceId'],
      bannerofferId: json['bannerofferId'],
      bannerUrl: json['bannerUrl'],
      sectionnew: (json['sectionnew'] as List)
          .map((e) => SectionNew.fromJson(e))
          .toList(),
    );
  }
}

class SectionNew {
  int id;
  String serviceName;
  String shortDesc;
  int positionNo;
  int duration;
  bool hasChild;
  int actualPrice;
  String symbol;
  String serviceSKU;
  int? offerId;
  String? offerName;
  int? offerCountryId;
  DateTime? offerStartDate;
  DateTime? offerEndDate;
  double? offerprice;
  bool? offerIsActive;
  int? bannerIndustryId;
  int offerDiffPrice;
  int offerdiscountedPrice;
  bool hasContentPage;
  bool hasAttribute;
  List<Attachment> attachments;
  List<dynamic> recommendedQuantity;

  SectionNew({
    required this.id,
    required this.serviceName,
    required this.shortDesc,
    required this.positionNo,
    required this.duration,
    required this.hasChild,
    required this.actualPrice,
    required this.symbol,
    required this.serviceSKU,
    this.offerId,
    this.offerName,
    this.offerCountryId,
    this.offerStartDate,
    this.offerEndDate,
    this.offerprice,
    this.offerIsActive,
    this.bannerIndustryId,
    required this.offerDiffPrice,
    required this.offerdiscountedPrice,
    required this.hasContentPage,
    required this.hasAttribute,
    required this.attachments,
    required this.recommendedQuantity,
  });

  factory SectionNew.fromJson(Map<String, dynamic> json) {
    return SectionNew(
      id: json['id'],
      serviceName: json['serviceName'],
      shortDesc: json['shortDesc'],
      positionNo: json['positionNo'],
      duration: json['duration'],
      hasChild: json['hasChild'],
      actualPrice: json['actualPrice']??0,
      symbol: json['symbol'],
      serviceSKU: json['serviceSKU'],
      offerId: json['offerId'],
      offerName: json['offerName'],
      offerCountryId: json['offerCountryId'],
      offerStartDate: json['offerStartDate'] != null
          ? DateTime.parse(json['offerStartDate'])
          : null,
      offerEndDate: json['offerEndDate'] != null
          ? DateTime.parse(json['offerEndDate'])
          : null,
      offerprice: json['offerprice'],
      offerIsActive: json['offerIsActive'],
      bannerIndustryId: json['bannerIndustryId'],
      offerDiffPrice: json['offerDiffPrice']??0,
      offerdiscountedPrice: json['offerdiscountedPrice'],
      hasContentPage: json['hasContentPage'],
      hasAttribute: json['hasAttribute'],
      attachments: (json['attachments'] as List)
          .map((e) => Attachment.fromJson(e))
          .toList(),
      recommendedQuantity: json['recommendedQuantity'],
    );
  }
}

class Attachment {
  int id;
  String imageUrl;
  bool isMobile;
  bool isWeb;
  bool isHorizontal;
  bool isVertical;

  Attachment({
    required this.id,
    required this.imageUrl,
    required this.isMobile,
    required this.isWeb,
    required this.isHorizontal,
    required this.isVertical,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      imageUrl: json['imageUrl'],
      isMobile: json['isMobile'],
      isWeb: json['isWeb'],
      isHorizontal: json['isHorizontal'],
      isVertical: json['isVertical']??false,
    );
  }
}
