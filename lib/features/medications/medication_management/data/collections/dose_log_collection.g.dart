// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_log_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDoseLogCollectionCollection on Isar {
  IsarCollection<DoseLogCollection> get doseLogCollections => this.collection();
}

const DoseLogCollectionSchema = CollectionSchema(
  name: r'DoseLogCollection',
  id: 7507835347610144918,
  properties: {
    r'actionAt': PropertySchema(
      id: 0,
      name: r'actionAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 2,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'medicationUuid': PropertySchema(
      id: 3,
      name: r'medicationUuid',
      type: IsarType.string,
    ),
    r'profileUuid': PropertySchema(
      id: 4,
      name: r'profileUuid',
      type: IsarType.string,
    ),
    r'scheduleUuid': PropertySchema(
      id: 5,
      name: r'scheduleUuid',
      type: IsarType.string,
    ),
    r'scheduledAt': PropertySchema(
      id: 6,
      name: r'scheduledAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(id: 7, name: r'status', type: IsarType.int),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(id: 9, name: r'uuid', type: IsarType.string),
  },

  estimateSize: _doseLogCollectionEstimateSize,
  serialize: _doseLogCollectionSerialize,
  deserialize: _doseLogCollectionDeserialize,
  deserializeProp: _doseLogCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'profileUuid': IndexSchema(
      id: 1129968050600041444,
      name: r'profileUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'profileUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'medicationUuid': IndexSchema(
      id: 5986980785597337636,
      name: r'medicationUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'medicationUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'scheduleUuid': IndexSchema(
      id: -273683534019998599,
      name: r'scheduleUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduleUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'scheduledAt': IndexSchema(
      id: -1483275037155116518,
      name: r'scheduledAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scheduledAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _doseLogCollectionGetId,
  getLinks: _doseLogCollectionGetLinks,
  attach: _doseLogCollectionAttach,
  version: '3.3.2',
);

int _doseLogCollectionEstimateSize(
  DoseLogCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.medicationUuid.length * 3;
  bytesCount += 3 + object.profileUuid.length * 3;
  bytesCount += 3 + object.scheduleUuid.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _doseLogCollectionSerialize(
  DoseLogCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actionAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.isDeleted);
  writer.writeString(offsets[3], object.medicationUuid);
  writer.writeString(offsets[4], object.profileUuid);
  writer.writeString(offsets[5], object.scheduleUuid);
  writer.writeDateTime(offsets[6], object.scheduledAt);
  writer.writeInt(offsets[7], object.status);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.uuid);
}

DoseLogCollection _doseLogCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DoseLogCollection();
  object.actionAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[2]);
  object.medicationUuid = reader.readString(offsets[3]);
  object.profileUuid = reader.readString(offsets[4]);
  object.scheduleUuid = reader.readString(offsets[5]);
  object.scheduledAt = reader.readDateTime(offsets[6]);
  object.status = reader.readInt(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.uuid = reader.readString(offsets[9]);
  return object;
}

P _doseLogCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readInt(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _doseLogCollectionGetId(DoseLogCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _doseLogCollectionGetLinks(
  DoseLogCollection object,
) {
  return [];
}

void _doseLogCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  DoseLogCollection object,
) {
  object.id = id;
}

extension DoseLogCollectionByIndex on IsarCollection<DoseLogCollection> {
  Future<DoseLogCollection?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  DoseLogCollection? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<DoseLogCollection?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<DoseLogCollection?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(DoseLogCollection object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(DoseLogCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<DoseLogCollection> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(
    List<DoseLogCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension DoseLogCollectionQueryWhereSort
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QWhere> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhere>
  anyScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scheduledAt'),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension DoseLogCollectionQueryWhere
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QWhereClause> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uuid', value: [uuid]),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  uuidNotEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [uuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'uuid',
                lower: [],
                upper: [uuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  profileUuidEqualTo(String profileUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'profileUuid',
          value: [profileUuid],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  profileUuidNotEqualTo(String profileUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [],
                upper: [profileUuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [profileUuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [profileUuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'profileUuid',
                lower: [],
                upper: [profileUuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  medicationUuidEqualTo(String medicationUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'medicationUuid',
          value: [medicationUuid],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  medicationUuidNotEqualTo(String medicationUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'medicationUuid',
                lower: [],
                upper: [medicationUuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'medicationUuid',
                lower: [medicationUuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'medicationUuid',
                lower: [medicationUuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'medicationUuid',
                lower: [],
                upper: [medicationUuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduleUuidEqualTo(String scheduleUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'scheduleUuid',
          value: [scheduleUuid],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduleUuidNotEqualTo(String scheduleUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduleUuid',
                lower: [],
                upper: [scheduleUuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduleUuid',
                lower: [scheduleUuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduleUuid',
                lower: [scheduleUuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduleUuid',
                lower: [],
                upper: [scheduleUuid],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduledAtEqualTo(DateTime scheduledAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'scheduledAt',
          value: [scheduledAt],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduledAtNotEqualTo(DateTime scheduledAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduledAt',
                lower: [],
                upper: [scheduledAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduledAt',
                lower: [scheduledAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduledAt',
                lower: [scheduledAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scheduledAt',
                lower: [],
                upper: [scheduledAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduledAtGreaterThan(DateTime scheduledAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scheduledAt',
          lower: [scheduledAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduledAtLessThan(DateTime scheduledAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scheduledAt',
          lower: [],
          upper: [scheduledAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  scheduledAtBetween(
    DateTime lowerScheduledAt,
    DateTime upperScheduledAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scheduledAt',
          lower: [lowerScheduledAt],
          includeLower: includeLower,
          upper: [upperScheduledAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  statusEqualTo(int status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  statusNotEqualTo(int status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  statusGreaterThan(int status, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [status],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  statusLessThan(int status, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [],
          upper: [status],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterWhereClause>
  statusBetween(
    int lowerStatus,
    int upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [lowerStatus],
          includeLower: includeLower,
          upper: [upperStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DoseLogCollectionQueryFilter
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QFilterCondition> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'actionAt'),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'actionAt'),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'actionAt', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'actionAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'actionAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  actionAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'actionAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'medicationUuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'medicationUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'medicationUuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'medicationUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  medicationUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'medicationUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'profileUuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'profileUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'profileUuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'profileUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  profileUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'profileUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduleUuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scheduleUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scheduleUuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduleUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduleUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scheduleUuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduledAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scheduledAt', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduledAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scheduledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduledAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scheduledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  scheduledAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scheduledAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  statusGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  statusLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'uuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'uuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterFilterCondition>
  uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uuid', value: ''),
      );
    });
  }
}

extension DoseLogCollectionQueryObject
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QFilterCondition> {}

extension DoseLogCollectionQueryLinks
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QFilterCondition> {}

extension DoseLogCollectionQuerySortBy
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QSortBy> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByActionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByActionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByMedicationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByMedicationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByProfileUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByProfileUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByScheduleUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByScheduleUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByScheduledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension DoseLogCollectionQuerySortThenBy
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QSortThenBy> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByActionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByActionAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByMedicationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByMedicationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByProfileUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByProfileUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByScheduleUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleUuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByScheduleUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleUuid', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByScheduledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduledAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QAfterSortBy>
  thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension DoseLogCollectionQueryWhereDistinct
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct> {
  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByActionAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionAt');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByMedicationUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'medicationUuid',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByProfileUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByScheduleUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByScheduledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduledAt');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DoseLogCollection, DoseLogCollection, QDistinct> distinctByUuid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension DoseLogCollectionQueryProperty
    on QueryBuilder<DoseLogCollection, DoseLogCollection, QQueryProperty> {
  QueryBuilder<DoseLogCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DoseLogCollection, DateTime?, QQueryOperations>
  actionAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionAt');
    });
  }

  QueryBuilder<DoseLogCollection, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DoseLogCollection, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<DoseLogCollection, String, QQueryOperations>
  medicationUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationUuid');
    });
  }

  QueryBuilder<DoseLogCollection, String, QQueryOperations>
  profileUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileUuid');
    });
  }

  QueryBuilder<DoseLogCollection, String, QQueryOperations>
  scheduleUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleUuid');
    });
  }

  QueryBuilder<DoseLogCollection, DateTime, QQueryOperations>
  scheduledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduledAt');
    });
  }

  QueryBuilder<DoseLogCollection, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DoseLogCollection, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DoseLogCollection, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
