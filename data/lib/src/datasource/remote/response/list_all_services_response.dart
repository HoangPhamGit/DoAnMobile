part of swagger.api;

class ListAllServicesResponse {
  List<Service> listAllServices = [];
  List<Service> favouriteServices = [];

  ListAllServicesResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json["p_all_services"] != null && json["p_all_services"] is List) {
      List jsListAllService = json["p_all_services"];
      for (Map<String, dynamic> jsService in jsListAllService) {
        listAllServices.add(Service.fromJson(jsService));
      }
    }
    if (json["p_favourite_services"] != null &&
        json["p_favourite_services"] is List) {
      List jsFavouriteServices = json["p_favourite_services"];
      for (Map<String, dynamic> jsService in jsFavouriteServices) {
        favouriteServices.add(Service.fromJson(jsService));
      }
    }
  }
}

class Service {
  String? id;
  String? code;
  String? description;
  String? overlayText;
  ImageResponse? icon;
  String? status;
  String? mnem;
  String? serviceType;
  String? pos;
  bool? visible;
  Service.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json["p_id"];
    code = json["p_code"];
    description = json["p_description"];
    overlayText = json["p_overlay_text"];
    icon = ImageResponse.fromJson(json["p_icon"]);
    status = json["p_status"];
    mnem = json["p_mnem"];
    serviceType = json["p_service_type"];
    pos = json["p_pos"];
    visible = json["p_visible"];
  }
}
