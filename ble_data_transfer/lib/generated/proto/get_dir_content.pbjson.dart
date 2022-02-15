///
//  Generated code. Do not modify.
//  source: get_dir_content.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use singleFileDescriptor instead')
const SingleFile$json = const {
  '1': 'SingleFile',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'size', '3': 2, '4': 1, '5': 13, '10': 'size'},
    const {'1': 'time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
  ],
};

/// Descriptor for `SingleFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleFileDescriptor = $convert.base64Decode('CgpTaW5nbGVGaWxlEhIKBG5hbWUYASABKAlSBG5hbWUSEgoEc2l6ZRgCIAEoDVIEc2l6ZRIuCgR0aW1lGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEdGltZQ==');
@$core.Deprecated('Use getDirContentDescriptor instead')
const GetDirContent$json = const {
  '1': 'GetDirContent',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'files', '3': 2, '4': 3, '5': 11, '6': '.deepcare.get_dir_content.SingleFile', '10': 'files'},
  ],
};

/// Descriptor for `GetDirContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDirContentDescriptor = $convert.base64Decode('Cg1HZXREaXJDb250ZW50EhIKBHBhdGgYASABKAlSBHBhdGgSOgoFZmlsZXMYAiADKAsyJC5kZWVwY2FyZS5nZXRfZGlyX2NvbnRlbnQuU2luZ2xlRmlsZVIFZmlsZXM=');
