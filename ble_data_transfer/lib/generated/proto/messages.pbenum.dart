///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class StartTransferRequest_Target extends $pb.ProtobufEnum {
  static const StartTransferRequest_Target DOCKER_IMAGE = StartTransferRequest_Target._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOCKER_IMAGE');
  static const StartTransferRequest_Target USER_BACKGROUND_IMAGE = StartTransferRequest_Target._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_BACKGROUND_IMAGE');
  static const StartTransferRequest_Target DATA = StartTransferRequest_Target._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DATA');
  static const StartTransferRequest_Target BASH_SCRIPT = StartTransferRequest_Target._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASH_SCRIPT');
  static const StartTransferRequest_Target ANSIBLE_SCRIPT = StartTransferRequest_Target._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANSIBLE_SCRIPT');
  static const StartTransferRequest_Target PLAIN_FILE = StartTransferRequest_Target._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAIN_FILE');

  static const $core.List<StartTransferRequest_Target> values = <StartTransferRequest_Target> [
    DOCKER_IMAGE,
    USER_BACKGROUND_IMAGE,
    DATA,
    BASH_SCRIPT,
    ANSIBLE_SCRIPT,
    PLAIN_FILE,
  ];

  static final $core.Map<$core.int, StartTransferRequest_Target> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StartTransferRequest_Target? valueOf($core.int value) => _byValue[value];

  const StartTransferRequest_Target._($core.int v, $core.String n) : super(v, n);
}

class StartTransferRequest_Direction extends $pb.ProtobufEnum {
  static const StartTransferRequest_Direction MAIN = StartTransferRequest_Direction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MAIN');
  static const StartTransferRequest_Direction SECOND = StartTransferRequest_Direction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SECOND');

  static const $core.List<StartTransferRequest_Direction> values = <StartTransferRequest_Direction> [
    MAIN,
    SECOND,
  ];

  static final $core.Map<$core.int, StartTransferRequest_Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StartTransferRequest_Direction? valueOf($core.int value) => _byValue[value];

  const StartTransferRequest_Direction._($core.int v, $core.String n) : super(v, n);
}

class StartTransferResponse_Target extends $pb.ProtobufEnum {
  static const StartTransferResponse_Target DOCKER_IMAGE = StartTransferResponse_Target._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOCKER_IMAGE');
  static const StartTransferResponse_Target USER_BACKGROUND_IMAGE = StartTransferResponse_Target._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_BACKGROUND_IMAGE');
  static const StartTransferResponse_Target DATA = StartTransferResponse_Target._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DATA');
  static const StartTransferResponse_Target BASH_SCRIPT = StartTransferResponse_Target._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASH_SCRIPT');
  static const StartTransferResponse_Target ANSIBLE_SCRIPT = StartTransferResponse_Target._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANSIBLE_SCRIPT');

  static const $core.List<StartTransferResponse_Target> values = <StartTransferResponse_Target> [
    DOCKER_IMAGE,
    USER_BACKGROUND_IMAGE,
    DATA,
    BASH_SCRIPT,
    ANSIBLE_SCRIPT,
  ];

  static final $core.Map<$core.int, StartTransferResponse_Target> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StartTransferResponse_Target? valueOf($core.int value) => _byValue[value];

  const StartTransferResponse_Target._($core.int v, $core.String n) : super(v, n);
}

class StartTransferResponse_Status extends $pb.ProtobufEnum {
  static const StartTransferResponse_Status UNKNOWN = StartTransferResponse_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StartTransferResponse_Status TRANSFER = StartTransferResponse_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TRANSFER');
  static const StartTransferResponse_Status FINISHED = StartTransferResponse_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FINISHED');
  static const StartTransferResponse_Status FILE_NOT_FOUND = StartTransferResponse_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FILE_NOT_FOUND');
  static const StartTransferResponse_Status HDD_FULL = StartTransferResponse_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HDD_FULL');
  static const StartTransferResponse_Status AUTH_FAILED = StartTransferResponse_Status._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTH_FAILED');
  static const StartTransferResponse_Status ERROR = StartTransferResponse_Status._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR');

  static const $core.List<StartTransferResponse_Status> values = <StartTransferResponse_Status> [
    UNKNOWN,
    TRANSFER,
    FINISHED,
    FILE_NOT_FOUND,
    HDD_FULL,
    AUTH_FAILED,
    ERROR,
  ];

  static final $core.Map<$core.int, StartTransferResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StartTransferResponse_Status? valueOf($core.int value) => _byValue[value];

  const StartTransferResponse_Status._($core.int v, $core.String n) : super(v, n);
}

