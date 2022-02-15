///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

class StartTransferRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StartTransferRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'deepcare.messages'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filename')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hash',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunks',
        $pb.PbFieldType.O3)
    ..e<Target>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OE,
        defaultOrMaker: Target.UNKNOWN,
        valueOf: Target.valueOf,
        enumValues: Target.values)
    ..e<StartTransferRequest_Direction>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'direction',
        $pb.PbFieldType.OE,
        defaultOrMaker: StartTransferRequest_Direction.PHONE_TO_DEVICE,
        valueOf: StartTransferRequest_Direction.valueOf,
        enumValues: StartTransferRequest_Direction.values)
    ..hasRequiredFields = false;

  StartTransferRequest._() : super();
  factory StartTransferRequest({
    $core.String? filename,
    $core.List<$core.int>? hash,
    $core.int? chunks,
    Target? target,
    StartTransferRequest_Direction? direction,
  }) {
    final _result = create();
    if (filename != null) {
      _result.filename = filename;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (chunks != null) {
      _result.chunks = chunks;
    }
    if (target != null) {
      _result.target = target;
    }
    if (direction != null) {
      _result.direction = direction;
    }
    return _result;
  }
  factory StartTransferRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StartTransferRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StartTransferRequest clone() =>
      StartTransferRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StartTransferRequest copyWith(void Function(StartTransferRequest) updates) =>
      super.copyWith((message) => updates(message as StartTransferRequest))
          as StartTransferRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartTransferRequest create() => StartTransferRequest._();
  StartTransferRequest createEmptyInstance() => create();
  static $pb.PbList<StartTransferRequest> createRepeated() =>
      $pb.PbList<StartTransferRequest>();
  @$core.pragma('dart2js:noInline')
  static StartTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransferRequest>(create);
  static StartTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chunks => $_getIZ(2);
  @$pb.TagNumber(3)
  set chunks($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChunks() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunks() => clearField(3);

  @$pb.TagNumber(4)
  Target get target => $_getN(3);
  @$pb.TagNumber(4)
  set target(Target v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTarget() => $_has(3);
  @$pb.TagNumber(4)
  void clearTarget() => clearField(4);

  @$pb.TagNumber(5)
  StartTransferRequest_Direction get direction => $_getN(4);
  @$pb.TagNumber(5)
  set direction(StartTransferRequest_Direction v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => clearField(5);
}

class StartTransferResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StartTransferResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'deepcare.messages'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filename')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hash',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunks',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextChunk',
        $pb.PbFieldType.O3)
    ..e<Target>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OE,
        defaultOrMaker: Target.UNKNOWN,
        valueOf: Target.valueOf,
        enumValues: Target.values)
    ..e<StartTransferResponse_Status>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: StartTransferResponse_Status.UNKNOWN,
        valueOf: StartTransferResponse_Status.valueOf,
        enumValues: StartTransferResponse_Status.values)
    ..a<$core.double>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  StartTransferResponse._() : super();
  factory StartTransferResponse({
    $core.String? filename,
    $core.List<$core.int>? hash,
    $core.int? chunks,
    $core.int? nextChunk,
    Target? target,
    StartTransferResponse_Status? status,
    $core.double? duration,
    $core.int? size,
  }) {
    final _result = create();
    if (filename != null) {
      _result.filename = filename;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (chunks != null) {
      _result.chunks = chunks;
    }
    if (nextChunk != null) {
      _result.nextChunk = nextChunk;
    }
    if (target != null) {
      _result.target = target;
    }
    if (status != null) {
      _result.status = status;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (size != null) {
      _result.size = size;
    }
    return _result;
  }
  factory StartTransferResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StartTransferResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StartTransferResponse clone() =>
      StartTransferResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StartTransferResponse copyWith(
          void Function(StartTransferResponse) updates) =>
      super.copyWith((message) => updates(message as StartTransferResponse))
          as StartTransferResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartTransferResponse create() => StartTransferResponse._();
  StartTransferResponse createEmptyInstance() => create();
  static $pb.PbList<StartTransferResponse> createRepeated() =>
      $pb.PbList<StartTransferResponse>();
  @$core.pragma('dart2js:noInline')
  static StartTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartTransferResponse>(create);
  static StartTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filename => $_getSZ(0);
  @$pb.TagNumber(1)
  set filename($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFilename() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilename() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get hash => $_getN(1);
  @$pb.TagNumber(2)
  set hash($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chunks => $_getIZ(2);
  @$pb.TagNumber(3)
  set chunks($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChunks() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunks() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get nextChunk => $_getIZ(3);
  @$pb.TagNumber(4)
  set nextChunk($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNextChunk() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextChunk() => clearField(4);

  @$pb.TagNumber(5)
  Target get target => $_getN(4);
  @$pb.TagNumber(5)
  set target(Target v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTarget() => $_has(4);
  @$pb.TagNumber(5)
  void clearTarget() => clearField(5);

  @$pb.TagNumber(6)
  StartTransferResponse_Status get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(StartTransferResponse_Status v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get duration => $_getN(6);
  @$pb.TagNumber(7)
  set duration($core.double v) {
    $_setFloat(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get size => $_getIZ(7);
  @$pb.TagNumber(8)
  set size($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSize() => $_has(7);
  @$pb.TagNumber(8)
  void clearSize() => clearField(8);
}
