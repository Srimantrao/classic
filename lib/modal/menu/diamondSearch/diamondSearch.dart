// ignore_for_file: file_names

class DiamondList {
  List<String> shapes = [
    'Round',
    'Marquise',
    'Princess',
    'Pear',
    'Emerald',
    'Heart',
    'Oval',
    'Cushion',
    'Radiant',
    'Asscher',
    'Other',
  ];

  List<Map<String, dynamic>> carat = [
    {'paraMtrId': '1', 'paraMtrName': '0.30-0.39', 'min': 0.3, 'max': 0.39},
    {'paraMtrId': '2', 'paraMtrName': '0.40-0.49', 'min': 0.4, 'max': 0.49},
    {'paraMtrId': '3', 'paraMtrName': '0.50-0.69', 'min': 0.5, 'max': 0.69},
    {'paraMtrId': '4', 'paraMtrName': '0.70-0.89', 'min': 0.7, 'max': 0.89},
    {'paraMtrId': '5', 'paraMtrName': '0.90-0.99', 'min': 0.9, 'max': 0.99},
    {'paraMtrId': '6', 'paraMtrName': '1.00-1.49', 'min': 1.0, 'max': 1.49},
    {'paraMtrId': '8', 'paraMtrName': '1.50-1.99', 'min': 1.5, 'max': 1.99},
    {'paraMtrId': '9', 'paraMtrName': '2.00-2.99', 'min': 2.0, 'max': 2.99},
    {'paraMtrId': '10', 'paraMtrName': '3.00-3.99', 'min': 3.0, 'max': 3.99},
    {'paraMtrId': '11', 'paraMtrName': '4.00-4.99', 'min': 4.0, 'max': 4.99},
    {
      'paraMtrId': '12',
      'paraMtrName': '10.00-29.99',
      'min': 10.0,
      'max': 29.99,
    },
  ];

  List<String> clarity = [
    'IF',
    'Vss1',
    'Vvs2',
    'Vs1',
    'Vs2',
    'Sis1',
    'Sis2',
    'I1',
    'I2',
    'I3',
  ];

  List<String> whiteColors = ['D', 'E', 'F', 'G', 'H', 'I', 'J', 'L'];

  List<Map<String, dynamic>> shortcut = [
    {'paraMtrName': "3EX", 'paraMtrId': "3EX"},
    {'paraMtrName': "3EXNON", 'paraMtrId': "3EXNON"},
    {'paraMtrName': "NOBGM", 'paraMtrId': "NOBGM"},
  ];

  List<String> lab = ['IGI', 'GIA', 'AGS', 'HRD', 'NONE', 'GCAL'];

  List<String> polsih = ['EX', 'VG', 'GD', 'FR'];

  List<String> symmetry = ['EX', 'VG', 'GD', 'Poor'];

  List<Map<String, dynamic>> availability = [
    {'paraMtrName': "ALL", 'paraMtrId': "ALL"},
    {'paraMtrName': "HOLD", 'paraMtrId': "HOLD"},
    {'paraMtrName': "Available", 'paraMtrId': "Available"},
  ];

  List<Map<String, dynamic>> treatment = [
    {'paraMtrName': "CVD", 'paraMtrId': "CVD"},
    {'paraMtrName': "HPHT", 'paraMtrId': "HPHT"},
  ];

  List<String> fluorescence = ['None', 'Faint', 'Medium', 'Strong'];

  List<Map<String, dynamic>>eyeClean = [
    {'paraMtrName': "Yes", 'paraMtrId': "Yes" },
    {'paraMtrName': "No", 'paraMtrId': "No" },
  ];
}
