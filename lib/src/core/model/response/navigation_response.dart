import 'package:akgamarra_app/src/core/model/response/nav_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigation_response.g.dart';

@JsonSerializable()
class NavigationResponse {
  List<NavResponse> sideBarItems;
  List<NavResponse> bottomBarItems;

  NavigationResponse({
    required this.bottomBarItems,
    required this.sideBarItems,
  });

  factory NavigationResponse.fromJson(Map<String, dynamic> json) =>
      _$NavigationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationResponseToJson(this);
}
