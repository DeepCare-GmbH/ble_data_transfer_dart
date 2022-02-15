///
//  Generated code. Do not modify.
//  source: transfer_data.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transferDataDescriptor instead')
const TransferData$json = const {
  '1': 'TransferData',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 5, '10': 'address'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'current_chunk', '3': 3, '4': 1, '5': 5, '10': 'currentChunk'},
    const {
      '1': 'overall_chunks',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'overallChunks'
    },
    const {'1': 'data', '3': 5, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `TransferData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDataDescriptor = $convert.base64Decode(
    'CgxUcmFuc2ZlckRhdGESGAoHYWRkcmVzcxgBIAEoBVIHYWRkcmVzcxISCgRoYXNoGAIgASgMUgRoYXNoEiMKDWN1cnJlbnRfY2h1bmsYAyABKAVSDGN1cnJlbnRDaHVuaxIlCg5vdmVyYWxsX2NodW5rcxgEIAEoBVINb3ZlcmFsbENodW5rcxISCgRkYXRhGAUgASgMUgRkYXRh');
