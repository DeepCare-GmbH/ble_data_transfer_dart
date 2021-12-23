///
//  Generated code. Do not modify.
//  source: stats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Statistics_Mode extends $pb.ProtobufEnum {
  static const Statistics_Mode UNKNOWN = Statistics_Mode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Statistics_Mode NORMAL = Statistics_Mode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NORMAL');
  static const Statistics_Mode OBSERVER = Statistics_Mode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OBSERVER');
  static const Statistics_Mode WORKOUT = Statistics_Mode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WORKOUT');
  static const Statistics_Mode BACKPAIN = Statistics_Mode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BACKPAIN');
  static const Statistics_Mode STANDING = Statistics_Mode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STANDING');
  static const Statistics_Mode WATER = Statistics_Mode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WATER');

  static const $core.List<Statistics_Mode> values = <Statistics_Mode> [
    UNKNOWN,
    NORMAL,
    OBSERVER,
    WORKOUT,
    BACKPAIN,
    STANDING,
    WATER,
  ];

  static final $core.Map<$core.int, Statistics_Mode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Statistics_Mode? valueOf($core.int value) => _byValue[value];

  const Statistics_Mode._($core.int v, $core.String n) : super(v, n);
}

