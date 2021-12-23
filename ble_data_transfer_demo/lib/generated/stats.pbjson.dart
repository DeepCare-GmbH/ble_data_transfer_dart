///
//  Generated code. Do not modify.
//  source: stats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statisticsDescriptor instead')
const Statistics$json = const {
  '1': 'Statistics',
  '2': const [
    const {'1': 'standtime', '3': 1, '4': 1, '5': 2, '10': 'standtime'},
    const {'1': 'sittime', '3': 2, '4': 1, '5': 2, '10': 'sittime'},
    const {'1': 'ergonomic', '3': 3, '4': 1, '5': 2, '10': 'ergonomic'},
    const {'1': 'hunching', '3': 4, '4': 1, '5': 2, '10': 'hunching'},
    const {'1': 'layback', '3': 5, '4': 1, '5': 2, '10': 'layback'},
    const {'1': 'met', '3': 6, '4': 1, '5': 2, '10': 'met'},
    const {'1': 'arm', '3': 7, '4': 1, '5': 2, '10': 'arm'},
    const {'1': 'leg', '3': 8, '4': 1, '5': 2, '10': 'leg'},
    const {'1': 'back', '3': 9, '4': 1, '5': 2, '10': 'back'},
    const {'1': 'head', '3': 10, '4': 1, '5': 2, '10': 'head'},
    const {'1': 'shoulder', '3': 11, '4': 1, '5': 2, '10': 'shoulder'},
    const {'1': 'exercises', '3': 12, '4': 1, '5': 13, '10': 'exercises'},
    const {'1': 'breaks', '3': 13, '4': 1, '5': 13, '10': 'breaks'},
    const {'1': 'pose_changes', '3': 14, '4': 1, '5': 13, '10': 'poseChanges'},
    const {'1': 'standing_in_row', '3': 15, '4': 1, '5': 2, '10': 'standingInRow'},
    const {'1': 'sitting_in_row', '3': 16, '4': 1, '5': 2, '10': 'sittingInRow'},
    const {'1': 'water', '3': 17, '4': 1, '5': 2, '10': 'water'},
    const {'1': 'movement', '3': 19, '4': 1, '5': 2, '10': 'movement'},
    const {'1': 'table_up', '3': 20, '4': 1, '5': 8, '10': 'tableUp'},
    const {'1': 'mode', '3': 18, '4': 1, '5': 14, '6': '.Statistics.Mode', '10': 'mode'},
  ],
  '4': const [Statistics_Mode$json],
};

@$core.Deprecated('Use statisticsDescriptor instead')
const Statistics_Mode$json = const {
  '1': 'Mode',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'NORMAL', '2': 1},
    const {'1': 'OBSERVER', '2': 2},
    const {'1': 'WORKOUT', '2': 3},
    const {'1': 'BACKPAIN', '2': 4},
    const {'1': 'STANDING', '2': 5},
    const {'1': 'WATER', '2': 6},
  ],
};

/// Descriptor for `Statistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statisticsDescriptor = $convert.base64Decode('CgpTdGF0aXN0aWNzEhwKCXN0YW5kdGltZRgBIAEoAlIJc3RhbmR0aW1lEhgKB3NpdHRpbWUYAiABKAJSB3NpdHRpbWUSHAoJZXJnb25vbWljGAMgASgCUgllcmdvbm9taWMSGgoIaHVuY2hpbmcYBCABKAJSCGh1bmNoaW5nEhgKB2xheWJhY2sYBSABKAJSB2xheWJhY2sSEAoDbWV0GAYgASgCUgNtZXQSEAoDYXJtGAcgASgCUgNhcm0SEAoDbGVnGAggASgCUgNsZWcSEgoEYmFjaxgJIAEoAlIEYmFjaxISCgRoZWFkGAogASgCUgRoZWFkEhoKCHNob3VsZGVyGAsgASgCUghzaG91bGRlchIcCglleGVyY2lzZXMYDCABKA1SCWV4ZXJjaXNlcxIWCgZicmVha3MYDSABKA1SBmJyZWFrcxIhCgxwb3NlX2NoYW5nZXMYDiABKA1SC3Bvc2VDaGFuZ2VzEiYKD3N0YW5kaW5nX2luX3JvdxgPIAEoAlINc3RhbmRpbmdJblJvdxIkCg5zaXR0aW5nX2luX3JvdxgQIAEoAlIMc2l0dGluZ0luUm93EhQKBXdhdGVyGBEgASgCUgV3YXRlchIaCghtb3ZlbWVudBgTIAEoAlIIbW92ZW1lbnQSGQoIdGFibGVfdXAYFCABKAhSB3RhYmxlVXASJAoEbW9kZRgSIAEoDjIQLlN0YXRpc3RpY3MuTW9kZVIEbW9kZSJhCgRNb2RlEgsKB1VOS05PV04QABIKCgZOT1JNQUwQARIMCghPQlNFUlZFUhACEgsKB1dPUktPVVQQAxIMCghCQUNLUEFJThAEEgwKCFNUQU5ESU5HEAUSCQoFV0FURVIQBg==');
