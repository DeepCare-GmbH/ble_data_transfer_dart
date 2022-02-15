///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use targetDescriptor instead')
const Target$json = const {
  '1': 'Target',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'DOCKER_IMAGE', '2': 1},
    const {'1': 'USER_BACKGROUND_IMAGE', '2': 2},
    const {'1': 'DATA', '2': 3},
    const {'1': 'BASH_SCRIPT', '2': 4},
    const {'1': 'ANSIBLE_SCRIPT', '2': 5},
    const {'1': 'PLAIN_FILE', '2': 6},
  ],
};

/// Descriptor for `Target`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List targetDescriptor = $convert.base64Decode(
    'CgZUYXJnZXQSCwoHVU5LTk9XThAAEhAKDERPQ0tFUl9JTUFHRRABEhkKFVVTRVJfQkFDS0dST1VORF9JTUFHRRACEggKBERBVEEQAxIPCgtCQVNIX1NDUklQVBAEEhIKDkFOU0lCTEVfU0NSSVBUEAUSDgoKUExBSU5fRklMRRAG');
@$core.Deprecated('Use startTransferRequestDescriptor instead')
const StartTransferRequest$json = const {
  '1': 'StartTransferRequest',
  '2': const [
    const {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'chunks', '3': 3, '4': 1, '5': 5, '10': 'chunks'},
    const {
      '1': 'target',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.deepcare.messages.Target',
      '10': 'target'
    },
    const {
      '1': 'direction',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.deepcare.messages.StartTransferRequest.Direction',
      '10': 'direction'
    },
  ],
  '4': const [StartTransferRequest_Direction$json],
};

@$core.Deprecated('Use startTransferRequestDescriptor instead')
const StartTransferRequest_Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'PHONE_TO_DEVICE', '2': 0},
    const {'1': 'DEVICE_TO_PHONE', '2': 1},
  ],
};

/// Descriptor for `StartTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransferRequestDescriptor = $convert.base64Decode(
    'ChRTdGFydFRyYW5zZmVyUmVxdWVzdBIaCghmaWxlbmFtZRgBIAEoCVIIZmlsZW5hbWUSEgoEaGFzaBgCIAEoDFIEaGFzaBIWCgZjaHVua3MYAyABKAVSBmNodW5rcxIxCgZ0YXJnZXQYBCABKA4yGS5kZWVwY2FyZS5tZXNzYWdlcy5UYXJnZXRSBnRhcmdldBJPCglkaXJlY3Rpb24YBSABKA4yMS5kZWVwY2FyZS5tZXNzYWdlcy5TdGFydFRyYW5zZmVyUmVxdWVzdC5EaXJlY3Rpb25SCWRpcmVjdGlvbiI1CglEaXJlY3Rpb24SEwoPUEhPTkVfVE9fREVWSUNFEAASEwoPREVWSUNFX1RPX1BIT05FEAE=');
@$core.Deprecated('Use startTransferResponseDescriptor instead')
const StartTransferResponse$json = const {
  '1': 'StartTransferResponse',
  '2': const [
    const {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'chunks', '3': 3, '4': 1, '5': 5, '10': 'chunks'},
    const {'1': 'next_chunk', '3': 4, '4': 1, '5': 5, '10': 'nextChunk'},
    const {
      '1': 'target',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.deepcare.messages.Target',
      '10': 'target'
    },
    const {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.deepcare.messages.StartTransferResponse.Status',
      '10': 'status'
    },
    const {'1': 'duration', '3': 7, '4': 1, '5': 2, '10': 'duration'},
    const {'1': 'size', '3': 8, '4': 1, '5': 13, '10': 'size'},
  ],
  '4': const [StartTransferResponse_Status$json],
};

@$core.Deprecated('Use startTransferResponseDescriptor instead')
const StartTransferResponse_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'TRANSFER', '2': 1},
    const {'1': 'FINISHED', '2': 2},
    const {'1': 'FILE_NOT_FOUND', '2': 3},
    const {'1': 'HDD_FULL', '2': 4},
    const {'1': 'AUTH_FAILED', '2': 5},
    const {'1': 'ERROR', '2': 6},
  ],
};

/// Descriptor for `StartTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startTransferResponseDescriptor = $convert.base64Decode(
    'ChVTdGFydFRyYW5zZmVyUmVzcG9uc2USGgoIZmlsZW5hbWUYASABKAlSCGZpbGVuYW1lEhIKBGhhc2gYAiABKAxSBGhhc2gSFgoGY2h1bmtzGAMgASgFUgZjaHVua3MSHQoKbmV4dF9jaHVuaxgEIAEoBVIJbmV4dENodW5rEjEKBnRhcmdldBgFIAEoDjIZLmRlZXBjYXJlLm1lc3NhZ2VzLlRhcmdldFIGdGFyZ2V0EkcKBnN0YXR1cxgGIAEoDjIvLmRlZXBjYXJlLm1lc3NhZ2VzLlN0YXJ0VHJhbnNmZXJSZXNwb25zZS5TdGF0dXNSBnN0YXR1cxIaCghkdXJhdGlvbhgHIAEoAlIIZHVyYXRpb24SEgoEc2l6ZRgIIAEoDVIEc2l6ZSJvCgZTdGF0dXMSCwoHVU5LTk9XThAAEgwKCFRSQU5TRkVSEAESDAoIRklOSVNIRUQQAhISCg5GSUxFX05PVF9GT1VORBADEgwKCEhERF9GVUxMEAQSDwoLQVVUSF9GQUlMRUQQBRIJCgVFUlJPUhAG');
