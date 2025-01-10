import 'package:film_time/feature/detail_screen/data/data.dart';
import 'package:film_time/feature/detail_screen/data/models/server_data_model.dart';
import 'package:film_time/feature/detail_screen/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episodes_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EpisodesModel {
  final String? serverName;
  final List<ServerDataModel> serverData;

  EpisodesModel({
    required this.serverName,
    required this.serverData,
  });
  factory EpisodesModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesModelFromJson(json);

  EpisodesEntity toEntity() {
    return EpisodesEntity(
      serverName: serverName,
      serverData: serverData.map((e) => e.toEntity()).toList(),
    );
  }
}
