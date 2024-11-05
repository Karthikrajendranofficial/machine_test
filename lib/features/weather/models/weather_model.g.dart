// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WelcomeImpl _$$WelcomeImplFromJson(Map<String, dynamic> json) =>
    _$WelcomeImpl(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WelcomeImplToJson(_$WelcomeImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      lastUpdatedEpoch: (json['lastUpdatedEpoch'] as num?)?.toInt(),
      lastUpdated: json['lastUpdated'] as String?,
      tempC: (json['tempC'] as num?)?.toInt(),
      tempF: (json['tempF'] as num?)?.toDouble(),
      isDay: (json['isDay'] as num?)?.toInt(),
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['windMph'] as num?)?.toDouble(),
      windKph: (json['windKph'] as num?)?.toDouble(),
      windDegree: (json['windDegree'] as num?)?.toInt(),
      windDir: json['windDir'] as String?,
      pressureMb: (json['pressureMb'] as num?)?.toInt(),
      pressureIn: (json['pressureIn'] as num?)?.toDouble(),
      precipMm: (json['precipMm'] as num?)?.toInt(),
      precipIn: (json['precipIn'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
      cloud: (json['cloud'] as num?)?.toInt(),
      feelslikeC: (json['feelslikeC'] as num?)?.toDouble(),
      feelslikeF: (json['feelslikeF'] as num?)?.toDouble(),
      windchillC: (json['windchillC'] as num?)?.toInt(),
      windchillF: (json['windchillF'] as num?)?.toInt(),
      heatindexC: (json['heatindexC'] as num?)?.toDouble(),
      heatindexF: (json['heatindexF'] as num?)?.toDouble(),
      dewpointC: (json['dewpointC'] as num?)?.toDouble(),
      dewpointF: (json['dewpointF'] as num?)?.toDouble(),
      visKm: (json['visKm'] as num?)?.toInt(),
      visMiles: (json['visMiles'] as num?)?.toInt(),
      uv: (json['uv'] as num?)?.toInt(),
      gustMph: (json['gustMph'] as num?)?.toDouble(),
      gustKph: (json['gustKph'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'lastUpdatedEpoch': instance.lastUpdatedEpoch,
      'lastUpdated': instance.lastUpdated,
      'tempC': instance.tempC,
      'tempF': instance.tempF,
      'isDay': instance.isDay,
      'condition': instance.condition,
      'windMph': instance.windMph,
      'windKph': instance.windKph,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'pressureMb': instance.pressureMb,
      'pressureIn': instance.pressureIn,
      'precipMm': instance.precipMm,
      'precipIn': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslikeC': instance.feelslikeC,
      'feelslikeF': instance.feelslikeF,
      'windchillC': instance.windchillC,
      'windchillF': instance.windchillF,
      'heatindexC': instance.heatindexC,
      'heatindexF': instance.heatindexF,
      'dewpointC': instance.dewpointC,
      'dewpointF': instance.dewpointF,
      'visKm': instance.visKm,
      'visMiles': instance.visMiles,
      'uv': instance.uv,
      'gustMph': instance.gustMph,
      'gustKph': instance.gustKph,
    };

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    _$ConditionImpl(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      tzId: json['tzId'] as String?,
      localtimeEpoch: (json['localtimeEpoch'] as num?)?.toInt(),
      localtime: json['localtime'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tzId': instance.tzId,
      'localtimeEpoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };
