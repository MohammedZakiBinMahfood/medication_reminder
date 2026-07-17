// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_schedule_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicationScheduleCollectionCollection on Isar {
  IsarCollection<MedicationScheduleCollection>
  get medicationScheduleCollections => this.collection();
}

const MedicationScheduleCollectionSchema = CollectionSchema(
  name: r'MedicationScheduleCollection',
  id: -60844116147902043,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endDate': PropertySchema(
      id: 1,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'interval': PropertySchema(id: 2, name: r'interval', type: IsarType.long),
    r'isDeleted': PropertySchema(
      id: 3,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'medicationUuid': PropertySchema(
      id: 4,
      name: r'medicationUuid',
      type: IsarType.string,
    ),
    r'minutesFromMidnight': PropertySchema(
      id: 5,
      name: r'minutesFromMidnight',
      type: IsarType.int,
    ),
    r'repeatType': PropertySchema(
      id: 6,
      name: r'repeatType',
      type: IsarType.int,
    ),
    r'startDate': PropertySchema(
      id: 7,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(id: 9, name: r'uuid', type: IsarType.string),
    r'weekdays': PropertySchema(
      id: 10,
      name: r'weekdays',
      type: IsarType.byteList,
    ),
  },

  estimateSize: _medicationScheduleCollectionEstimateSize,
  serialize: _medicationScheduleCollectionSerialize,
  deserialize: _medicationScheduleCollectionDeserialize,
  deserializeProp: _medicationScheduleCollectionDeserializeProp,
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
    r'startDate': IndexSchema(
      id: 7723980484494730382,
      name: r'startDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'endDate': IndexSchema(
      id: 422088669960424970,
      name: r'endDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'endDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _medicationScheduleCollectionGetId,
  getLinks: _medicationScheduleCollectionGetLinks,
  attach: _medicationScheduleCollectionAttach,
  version: '3.3.2',
);

int _medicationScheduleCollectionEstimateSize(
  MedicationScheduleCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.medicationUuid.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  bytesCount += 3 + object.weekdays.length;
  return bytesCount;
}

void _medicationScheduleCollectionSerialize(
  MedicationScheduleCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.endDate);
  writer.writeLong(offsets[2], object.interval);
  writer.writeBool(offsets[3], object.isDeleted);
  writer.writeString(offsets[4], object.medicationUuid);
  writer.writeInt(offsets[5], object.minutesFromMidnight);
  writer.writeInt(offsets[6], object.repeatType);
  writer.writeDateTime(offsets[7], object.startDate);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.uuid);
  writer.writeByteList(offsets[10], object.weekdays);
}

MedicationScheduleCollection _medicationScheduleCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicationScheduleCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.endDate = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.interval = reader.readLong(offsets[2]);
  object.isDeleted = reader.readBool(offsets[3]);
  object.medicationUuid = reader.readString(offsets[4]);
  object.minutesFromMidnight = reader.readInt(offsets[5]);
  object.repeatType = reader.readInt(offsets[6]);
  object.startDate = reader.readDateTime(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.uuid = reader.readString(offsets[9]);
  object.weekdays = reader.readByteList(offsets[10]) ?? [];
  return object;
}

P _medicationScheduleCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readInt(offset)) as P;
    case 6:
      return (reader.readInt(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readByteList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicationScheduleCollectionGetId(MedicationScheduleCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicationScheduleCollectionGetLinks(
  MedicationScheduleCollection object,
) {
  return [];
}

void _medicationScheduleCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MedicationScheduleCollection object,
) {
  object.id = id;
}

extension MedicationScheduleCollectionByIndex
    on IsarCollection<MedicationScheduleCollection> {
  Future<MedicationScheduleCollection?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  MedicationScheduleCollection? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<MedicationScheduleCollection?>> getAllByUuid(
    List<String> uuidValues,
  ) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<MedicationScheduleCollection?> getAllByUuidSync(
    List<String> uuidValues,
  ) {
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

  Future<Id> putByUuid(MedicationScheduleCollection object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(
    MedicationScheduleCollection object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<MedicationScheduleCollection> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(
    List<MedicationScheduleCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension MedicationScheduleCollectionQueryWhereSort
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QWhere
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhere
  >
  anyStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startDate'),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhere
  >
  anyEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'endDate'),
      );
    });
  }
}

extension MedicationScheduleCollectionQueryWhere
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QWhereClause
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'uuid', value: [uuid]),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  startDateEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'startDate', value: [startDate]),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  startDateNotEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startDate',
                lower: [],
                upper: [startDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startDate',
                lower: [startDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startDate',
                lower: [startDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startDate',
                lower: [],
                upper: [startDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  startDateGreaterThan(DateTime startDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startDate',
          lower: [startDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  startDateLessThan(DateTime startDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startDate',
          lower: [],
          upper: [startDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  startDateBetween(
    DateTime lowerStartDate,
    DateTime upperStartDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startDate',
          lower: [lowerStartDate],
          includeLower: includeLower,
          upper: [upperStartDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'endDate', value: [null]),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endDate',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateEqualTo(DateTime? endDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'endDate', value: [endDate]),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateNotEqualTo(DateTime? endDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endDate',
                lower: [],
                upper: [endDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endDate',
                lower: [endDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endDate',
                lower: [endDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endDate',
                lower: [],
                upper: [endDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateGreaterThan(DateTime? endDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endDate',
          lower: [endDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateLessThan(DateTime? endDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endDate',
          lower: [],
          upper: [endDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterWhereClause
  >
  endDateBetween(
    DateTime? lowerEndDate,
    DateTime? upperEndDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endDate',
          lower: [lowerEndDate],
          includeLower: includeLower,
          upper: [upperEndDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MedicationScheduleCollectionQueryFilter
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QFilterCondition
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'endDate'),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'endDate'),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endDate', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  intervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'interval', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  intervalGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'interval',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  intervalLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'interval',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  intervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'interval',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  medicationUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'medicationUuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  medicationUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'medicationUuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  minutesFromMidnightEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minutesFromMidnight', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  minutesFromMidnightGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minutesFromMidnight',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  minutesFromMidnightLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minutesFromMidnight',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  minutesFromMidnightBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minutesFromMidnight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  repeatTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'repeatType', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  repeatTypeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'repeatType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  repeatTypeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'repeatType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  repeatTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'repeatType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startDate', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  startDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  startDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uuid', value: ''),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weekdays', value: value),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weekdays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weekdays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weekdays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekdays', length, true, length, true);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekdays', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekdays', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekdays', 0, true, length, include);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'weekdays', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterFilterCondition
  >
  weekdaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weekdays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MedicationScheduleCollectionQueryObject
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QFilterCondition
        > {}

extension MedicationScheduleCollectionQueryLinks
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QFilterCondition
        > {}

extension MedicationScheduleCollectionQuerySortBy
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QSortBy
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByMedicationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByMedicationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByMinutesFromMidnight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesFromMidnight', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByMinutesFromMidnightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesFromMidnight', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByRepeatType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatType', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByRepeatTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatType', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicationScheduleCollectionQuerySortThenBy
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QSortThenBy
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interval', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByMedicationUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByMedicationUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationUuid', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByMinutesFromMidnight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesFromMidnight', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByMinutesFromMidnightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesFromMidnight', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByRepeatType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatType', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByRepeatTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeatType', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QAfterSortBy
  >
  thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicationScheduleCollectionQueryWhereDistinct
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QDistinct
        > {
  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interval');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByMedicationUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'medicationUuid',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByMinutesFromMidnight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutesFromMidnight');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByRepeatType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatType');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
    MedicationScheduleCollection,
    MedicationScheduleCollection,
    QDistinct
  >
  distinctByWeekdays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekdays');
    });
  }
}

extension MedicationScheduleCollectionQueryProperty
    on
        QueryBuilder<
          MedicationScheduleCollection,
          MedicationScheduleCollection,
          QQueryProperty
        > {
  QueryBuilder<MedicationScheduleCollection, int, QQueryOperations>
  idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicationScheduleCollection, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MedicationScheduleCollection, DateTime?, QQueryOperations>
  endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<MedicationScheduleCollection, int, QQueryOperations>
  intervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interval');
    });
  }

  QueryBuilder<MedicationScheduleCollection, bool, QQueryOperations>
  isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<MedicationScheduleCollection, String, QQueryOperations>
  medicationUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationUuid');
    });
  }

  QueryBuilder<MedicationScheduleCollection, int, QQueryOperations>
  minutesFromMidnightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutesFromMidnight');
    });
  }

  QueryBuilder<MedicationScheduleCollection, int, QQueryOperations>
  repeatTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatType');
    });
  }

  QueryBuilder<MedicationScheduleCollection, DateTime, QQueryOperations>
  startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<MedicationScheduleCollection, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MedicationScheduleCollection, String, QQueryOperations>
  uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<MedicationScheduleCollection, List<int>, QQueryOperations>
  weekdaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekdays');
    });
  }
}
