import 'package:get_pong/src/core/common/common.dart';
import 'package:get_pong/src/core/models/update_profile_picture_params.dart';
import 'package:get_pong/src/domain/clients/clients.dart';

class UpdateProfilePictureUseCase
    implements UseCase<DataState<String>, UpdateProfilePictureParams> {
  final PlayerRepository service;

  UpdateProfilePictureUseCase(this.service);

  @override
  Future<DataState<String>> call(
      {required UpdateProfilePictureParams params}) async {
    return await service.updateProfilePicture(params);
  }
}
