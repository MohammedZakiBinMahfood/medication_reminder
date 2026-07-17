// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_details_model.dart';

class MedicationDetailsModelMapper
    extends ClassMapperBase<MedicationDetailsModel> {
  MedicationDetailsModelMapper._();

  static MedicationDetailsModelMapper? _instance;
  static MedicationDetailsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationDetailsModelMapper._());
      MedicationFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationDetailsModel';

  static MedicationField _$medication(MedicationDetailsModel v) => v.medication;
  static const Field<MedicationDetailsModel, MedicationField> _f$medication =
      Field('medication', _$medication);
  static List<dynamic> _$upcomingDoses(MedicationDetailsModel v) =>
      v.upcomingDoses;
  static const Field<MedicationDetailsModel, List<dynamic>> _f$upcomingDoses =
      Field('upcomingDoses', _$upcomingDoses, opt: true, def: const []);

  @override
  final MappableFields<MedicationDetailsModel> fields = const {
    #medication: _f$medication,
    #upcomingDoses: _f$upcomingDoses,
  };

  static MedicationDetailsModel _instantiate(DecodingData data) {
    return MedicationDetailsModel(
      medication: data.dec(_f$medication),
      upcomingDoses: data.dec(_f$upcomingDoses),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationDetailsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationDetailsModel>(map);
  }

  static MedicationDetailsModel fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationDetailsModel>(json);
  }
}

mixin MedicationDetailsModelMappable {
  String toJson() {
    return MedicationDetailsModelMapper.ensureInitialized()
        .encodeJson<MedicationDetailsModel>(this as MedicationDetailsModel);
  }

  Map<String, dynamic> toMap() {
    return MedicationDetailsModelMapper.ensureInitialized()
        .encodeMap<MedicationDetailsModel>(this as MedicationDetailsModel);
  }

  MedicationDetailsModelCopyWith<
    MedicationDetailsModel,
    MedicationDetailsModel,
    MedicationDetailsModel
  >
  get copyWith =>
      _MedicationDetailsModelCopyWithImpl<
        MedicationDetailsModel,
        MedicationDetailsModel
      >(this as MedicationDetailsModel, $identity, $identity);
  @override
  String toString() {
    return MedicationDetailsModelMapper.ensureInitialized().stringifyValue(
      this as MedicationDetailsModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationDetailsModelMapper.ensureInitialized().equalsValue(
      this as MedicationDetailsModel,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationDetailsModelMapper.ensureInitialized().hashValue(
      this as MedicationDetailsModel,
    );
  }
}

extension MedicationDetailsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationDetailsModel, $Out> {
  MedicationDetailsModelCopyWith<$R, MedicationDetailsModel, $Out>
  get $asMedicationDetailsModel => $base.as(
    (v, t, t2) => _MedicationDetailsModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MedicationDetailsModelCopyWith<
  $R,
  $In extends MedicationDetailsModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MedicationFieldCopyWith<$R, MedicationField, MedicationField> get medication;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>
  get upcomingDoses;
  $R call({MedicationField? medication, List<dynamic>? upcomingDoses});
  MedicationDetailsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationDetailsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationDetailsModel, $Out>
    implements
        MedicationDetailsModelCopyWith<$R, MedicationDetailsModel, $Out> {
  _MedicationDetailsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationDetailsModel> $mapper =
      MedicationDetailsModelMapper.ensureInitialized();
  @override
  MedicationFieldCopyWith<$R, MedicationField, MedicationField>
  get medication =>
      $value.medication.copyWith.$chain((v) => call(medication: v));
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>
  get upcomingDoses => ListCopyWith(
    $value.upcomingDoses,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(upcomingDoses: v),
  );
  @override
  $R call({MedicationField? medication, List<dynamic>? upcomingDoses}) =>
      $apply(
        FieldCopyWithData({
          if (medication != null) #medication: medication,
          if (upcomingDoses != null) #upcomingDoses: upcomingDoses,
        }),
      );
  @override
  MedicationDetailsModel $make(CopyWithData data) => MedicationDetailsModel(
    medication: data.get(#medication, or: $value.medication),
    upcomingDoses: data.get(#upcomingDoses, or: $value.upcomingDoses),
  );

  @override
  MedicationDetailsModelCopyWith<$R2, MedicationDetailsModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MedicationDetailsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

