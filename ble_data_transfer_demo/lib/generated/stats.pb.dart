///
//  Generated code. Do not modify.
//  source: stats.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'stats.pbenum.dart';

export 'stats.pbenum.dart';

class Statistics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Statistics',
      createEmptyInstance: create)
    ..a<$core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'standtime',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sittime',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ergonomic',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hunching',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'layback',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'met',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'arm',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leg',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'head',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shoulder',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exercises',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'breaks',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poseChanges',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'standingInRow',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sittingInRow',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'water',
        $pb.PbFieldType.OF)
    ..e<Statistics_Mode>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OE,
        defaultOrMaker: Statistics_Mode.UNKNOWN,
        valueOf: Statistics_Mode.valueOf,
        enumValues: Statistics_Mode.values)
    ..a<$core.double>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'movement',
        $pb.PbFieldType.OF)
    ..aOB(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tableUp')
    ..hasRequiredFields = false;

  Statistics._() : super();
  factory Statistics({
    $core.double? standtime,
    $core.double? sittime,
    $core.double? ergonomic,
    $core.double? hunching,
    $core.double? layback,
    $core.double? met,
    $core.double? arm,
    $core.double? leg,
    $core.double? back,
    $core.double? head,
    $core.double? shoulder,
    $core.int? exercises,
    $core.int? breaks,
    $core.int? poseChanges,
    $core.double? standingInRow,
    $core.double? sittingInRow,
    $core.double? water,
    Statistics_Mode? mode,
    $core.double? movement,
    $core.bool? tableUp,
  }) {
    final _result = create();
    if (standtime != null) {
      _result.standtime = standtime;
    }
    if (sittime != null) {
      _result.sittime = sittime;
    }
    if (ergonomic != null) {
      _result.ergonomic = ergonomic;
    }
    if (hunching != null) {
      _result.hunching = hunching;
    }
    if (layback != null) {
      _result.layback = layback;
    }
    if (met != null) {
      _result.met = met;
    }
    if (arm != null) {
      _result.arm = arm;
    }
    if (leg != null) {
      _result.leg = leg;
    }
    if (back != null) {
      _result.back = back;
    }
    if (head != null) {
      _result.head = head;
    }
    if (shoulder != null) {
      _result.shoulder = shoulder;
    }
    if (exercises != null) {
      _result.exercises = exercises;
    }
    if (breaks != null) {
      _result.breaks = breaks;
    }
    if (poseChanges != null) {
      _result.poseChanges = poseChanges;
    }
    if (standingInRow != null) {
      _result.standingInRow = standingInRow;
    }
    if (sittingInRow != null) {
      _result.sittingInRow = sittingInRow;
    }
    if (water != null) {
      _result.water = water;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (movement != null) {
      _result.movement = movement;
    }
    if (tableUp != null) {
      _result.tableUp = tableUp;
    }
    return _result;
  }
  factory Statistics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statistics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statistics clone() => Statistics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statistics copyWith(void Function(Statistics) updates) =>
      super.copyWith((message) => updates(message as Statistics))
          as Statistics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statistics create() => Statistics._();
  Statistics createEmptyInstance() => create();
  static $pb.PbList<Statistics> createRepeated() => $pb.PbList<Statistics>();
  @$core.pragma('dart2js:noInline')
  static Statistics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statistics>(create);
  static Statistics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get standtime => $_getN(0);
  @$pb.TagNumber(1)
  set standtime($core.double v) {
    $_setFloat(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStandtime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStandtime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get sittime => $_getN(1);
  @$pb.TagNumber(2)
  set sittime($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSittime() => $_has(1);
  @$pb.TagNumber(2)
  void clearSittime() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get ergonomic => $_getN(2);
  @$pb.TagNumber(3)
  set ergonomic($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasErgonomic() => $_has(2);
  @$pb.TagNumber(3)
  void clearErgonomic() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get hunching => $_getN(3);
  @$pb.TagNumber(4)
  set hunching($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHunching() => $_has(3);
  @$pb.TagNumber(4)
  void clearHunching() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get layback => $_getN(4);
  @$pb.TagNumber(5)
  set layback($core.double v) {
    $_setFloat(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLayback() => $_has(4);
  @$pb.TagNumber(5)
  void clearLayback() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get met => $_getN(5);
  @$pb.TagNumber(6)
  set met($core.double v) {
    $_setFloat(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMet() => $_has(5);
  @$pb.TagNumber(6)
  void clearMet() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get arm => $_getN(6);
  @$pb.TagNumber(7)
  set arm($core.double v) {
    $_setFloat(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasArm() => $_has(6);
  @$pb.TagNumber(7)
  void clearArm() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get leg => $_getN(7);
  @$pb.TagNumber(8)
  set leg($core.double v) {
    $_setFloat(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLeg() => $_has(7);
  @$pb.TagNumber(8)
  void clearLeg() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get back => $_getN(8);
  @$pb.TagNumber(9)
  set back($core.double v) {
    $_setFloat(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBack() => $_has(8);
  @$pb.TagNumber(9)
  void clearBack() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get head => $_getN(9);
  @$pb.TagNumber(10)
  set head($core.double v) {
    $_setFloat(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHead() => $_has(9);
  @$pb.TagNumber(10)
  void clearHead() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get shoulder => $_getN(10);
  @$pb.TagNumber(11)
  set shoulder($core.double v) {
    $_setFloat(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasShoulder() => $_has(10);
  @$pb.TagNumber(11)
  void clearShoulder() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get exercises => $_getIZ(11);
  @$pb.TagNumber(12)
  set exercises($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasExercises() => $_has(11);
  @$pb.TagNumber(12)
  void clearExercises() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get breaks => $_getIZ(12);
  @$pb.TagNumber(13)
  set breaks($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBreaks() => $_has(12);
  @$pb.TagNumber(13)
  void clearBreaks() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get poseChanges => $_getIZ(13);
  @$pb.TagNumber(14)
  set poseChanges($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPoseChanges() => $_has(13);
  @$pb.TagNumber(14)
  void clearPoseChanges() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get standingInRow => $_getN(14);
  @$pb.TagNumber(15)
  set standingInRow($core.double v) {
    $_setFloat(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasStandingInRow() => $_has(14);
  @$pb.TagNumber(15)
  void clearStandingInRow() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get sittingInRow => $_getN(15);
  @$pb.TagNumber(16)
  set sittingInRow($core.double v) {
    $_setFloat(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasSittingInRow() => $_has(15);
  @$pb.TagNumber(16)
  void clearSittingInRow() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get water => $_getN(16);
  @$pb.TagNumber(17)
  set water($core.double v) {
    $_setFloat(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasWater() => $_has(16);
  @$pb.TagNumber(17)
  void clearWater() => clearField(17);

  @$pb.TagNumber(18)
  Statistics_Mode get mode => $_getN(17);
  @$pb.TagNumber(18)
  set mode(Statistics_Mode v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasMode() => $_has(17);
  @$pb.TagNumber(18)
  void clearMode() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get movement => $_getN(18);
  @$pb.TagNumber(19)
  set movement($core.double v) {
    $_setFloat(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasMovement() => $_has(18);
  @$pb.TagNumber(19)
  void clearMovement() => clearField(19);

  @$pb.TagNumber(20)
  $core.bool get tableUp => $_getBF(19);
  @$pb.TagNumber(20)
  set tableUp($core.bool v) {
    $_setBool(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasTableUp() => $_has(19);
  @$pb.TagNumber(20)
  void clearTableUp() => clearField(20);
}
