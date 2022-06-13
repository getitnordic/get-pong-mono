import 'package:grpc/grpc.dart';

abstract class GrpcClient {
  static ClientChannel client = ClientChannel(
    'get-pong-grpc.bravedune-8fc84b2e.westeurope.azurecontainerapps.io',
    options: const ChannelOptions(),
  );
}
