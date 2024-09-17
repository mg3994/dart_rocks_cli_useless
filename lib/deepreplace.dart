void main() {
  final legacySystemApi = {
    'legacy_nameV1': 'Legacy Name 1',
    'legacy_nameV2': 'Legacy Name 2',
    'legacy_nameV3': 'Legacy Name 3',
    'legacy_timstampV1': '2023-09-17T10:00:00Z',
    'new_timestampV1': '2023-09-17T10:00:00Z',
    'legacy_userV1': {
      'legacy_uuidV1': 1234,
      'legacy_uuid_V2': 'abcd-1234',
      'legacy_firstnameV1': 'Christian'
    }
  };

  final replacements = [
    {'from': 'legacy_', 'to': ''},
    {'from': 'new_', 'to': ''},
    {'from': 'V', 'to': ''},
    {'from': 'timstamp', 'to': 'timestamp'},
    {'from': 'uuid_', 'to': 'id'},
    {'from': 'uuid', 'to': 'id'},
  ];

  Map<String, dynamic> deepReplace(
      Map<String, dynamic> map, List<Map<String, String>> replacements) {
    final result = <String, dynamic>{};

    map.forEach((key, value) {
      var newKey = key;
      for (var replacement in replacements) {
        newKey = newKey.replaceAll(replacement['from']!, replacement['to']!);
      }

      if (value is Map<String, dynamic>) {
        result[newKey] = deepReplace(value, replacements);
      } else {
        result[newKey] = value;
      }
    });

    return result;
  }

  final cleaned = deepReplace(legacySystemApi, replacements);

  print('Cleaned: $cleaned');
}
