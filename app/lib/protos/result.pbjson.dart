///
//  Generated code. Do not modify.
//  source: result.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getResultByGameIdRequestDescriptor instead')
const GetResultByGameIdRequest$json = const {
  '1': 'GetResultByGameIdRequest',
  '2': const [
    const {'1': 'gameId', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
  ],
};

/// Descriptor for `GetResultByGameIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultByGameIdRequestDescriptor = $convert.base64Decode('ChhHZXRSZXN1bHRCeUdhbWVJZFJlcXVlc3QSFgoGZ2FtZUlkGAEgASgJUgZnYW1lSWQ=');
@$core.Deprecated('Use getResultByGameIdReplyDescriptor instead')
const GetResultByGameIdReply$json = const {
  '1': 'GetResultByGameIdReply',
  '2': const [
    const {'1': 'resultModel', '3': 1, '4': 3, '5': 11, '6': '.ResultModel', '10': 'resultModel'},
  ],
};

/// Descriptor for `GetResultByGameIdReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultByGameIdReplyDescriptor = $convert.base64Decode('ChZHZXRSZXN1bHRCeUdhbWVJZFJlcGx5Ei4KC3Jlc3VsdE1vZGVsGAEgAygLMgwuUmVzdWx0TW9kZWxSC3Jlc3VsdE1vZGVs');
@$core.Deprecated('Use getResultsByPlayerIdRequestDescriptor instead')
const GetResultsByPlayerIdRequest$json = const {
  '1': 'GetResultsByPlayerIdRequest',
  '2': const [
    const {'1': 'playerId', '3': 1, '4': 1, '5': 9, '10': 'playerId'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetResultsByPlayerIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultsByPlayerIdRequestDescriptor = $convert.base64Decode('ChtHZXRSZXN1bHRzQnlQbGF5ZXJJZFJlcXVlc3QSGgoIcGxheWVySWQYASABKAlSCHBsYXllcklkEhQKBWxpbWl0GAIgASgFUgVsaW1pdBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldA==');
@$core.Deprecated('Use getResultsByPlayerIdReplyDescriptor instead')
const GetResultsByPlayerIdReply$json = const {
  '1': 'GetResultsByPlayerIdReply',
  '2': const [
    const {'1': 'resultModels', '3': 1, '4': 3, '5': 11, '6': '.ResultModel', '10': 'resultModels'},
  ],
};

/// Descriptor for `GetResultsByPlayerIdReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultsByPlayerIdReplyDescriptor = $convert.base64Decode('ChlHZXRSZXN1bHRzQnlQbGF5ZXJJZFJlcGx5EjAKDHJlc3VsdE1vZGVscxgBIAMoCzIMLlJlc3VsdE1vZGVsUgxyZXN1bHRNb2RlbHM=');
@$core.Deprecated('Use saveResultRequestDescriptor instead')
const SaveResultRequest$json = const {
  '1': 'SaveResultRequest',
  '2': const [
    const {'1': 'resultModel', '3': 1, '4': 1, '5': 11, '6': '.ResultModel', '10': 'resultModel'},
  ],
};

/// Descriptor for `SaveResultRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveResultRequestDescriptor = $convert.base64Decode('ChFTYXZlUmVzdWx0UmVxdWVzdBIuCgtyZXN1bHRNb2RlbBgBIAEoCzIMLlJlc3VsdE1vZGVsUgtyZXN1bHRNb2RlbA==');
@$core.Deprecated('Use saveResultReplyDescriptor instead')
const SaveResultReply$json = const {
  '1': 'SaveResultReply',
  '2': const [
    const {'1': 'resultModel', '3': 1, '4': 1, '5': 11, '6': '.ResultModel', '10': 'resultModel'},
  ],
};

/// Descriptor for `SaveResultReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveResultReplyDescriptor = $convert.base64Decode('Cg9TYXZlUmVzdWx0UmVwbHkSLgoLcmVzdWx0TW9kZWwYASABKAsyDC5SZXN1bHRNb2RlbFILcmVzdWx0TW9kZWw=');
@$core.Deprecated('Use getResultsRequestDescriptor instead')
const GetResultsRequest$json = const {
  '1': 'GetResultsRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `GetResultsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultsRequestDescriptor = $convert.base64Decode('ChFHZXRSZXN1bHRzUmVxdWVzdBIUCgVsaW1pdBgBIAEoBVIFbGltaXQ=');
@$core.Deprecated('Use getResultsReplyDescriptor instead')
const GetResultsReply$json = const {
  '1': 'GetResultsReply',
  '2': const [
    const {'1': 'resultModel', '3': 1, '4': 3, '5': 11, '6': '.ResultModel', '10': 'resultModel'},
  ],
};

/// Descriptor for `GetResultsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResultsReplyDescriptor = $convert.base64Decode('Cg9HZXRSZXN1bHRzUmVwbHkSLgoLcmVzdWx0TW9kZWwYASADKAsyDC5SZXN1bHRNb2RlbFILcmVzdWx0TW9kZWw=');
@$core.Deprecated('Use resultModelDescriptor instead')
const ResultModel$json = const {
  '1': 'ResultModel',
  '2': const [
    const {'1': 'eloDiff', '3': 1, '4': 1, '5': 5, '10': 'eloDiff'},
    const {'1': 'newElo', '3': 2, '4': 1, '5': 5, '10': 'newElo'},
    const {'1': 'gameWon', '3': 3, '4': 1, '5': 8, '10': 'gameWon'},
    const {'1': 'timeStamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timeStamp'},
    const {'1': 'gameId', '3': 5, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'playerId', '3': 6, '4': 1, '5': 9, '10': 'playerId'},
  ],
};

/// Descriptor for `ResultModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultModelDescriptor = $convert.base64Decode('CgtSZXN1bHRNb2RlbBIYCgdlbG9EaWZmGAEgASgFUgdlbG9EaWZmEhYKBm5ld0VsbxgCIAEoBVIGbmV3RWxvEhgKB2dhbWVXb24YAyABKAhSB2dhbWVXb24SOAoJdGltZVN0YW1wGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZVN0YW1wEhYKBmdhbWVJZBgFIAEoCVIGZ2FtZUlkEhoKCHBsYXllcklkGAYgASgJUghwbGF5ZXJJZA==');
