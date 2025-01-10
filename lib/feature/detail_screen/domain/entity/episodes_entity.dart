import '../domain.dart';

class EpisodesEntity {
  final String? serverName;
  final List<ServerDataEntity>? serverData;

  EpisodesEntity({
    this.serverName,
    this.serverData,
  });
}
