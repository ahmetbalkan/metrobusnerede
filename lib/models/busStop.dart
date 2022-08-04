class busStop {
  final int _busstopid;
  final String _name;
  final double _latitude;
  final double _longitude;
  final int _check;

  busStop(this._busstopid, this._name, this._latitude, this._longitude,
      this._check);

  get busstopid => _busstopid;
  get name => _name;
  get latitude => _latitude;
  get longitude => _longitude;
  get check => _check;
}
