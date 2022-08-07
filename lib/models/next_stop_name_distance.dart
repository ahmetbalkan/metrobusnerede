class MainPageModel {
  final int _distance;
  final String _currentStop;
  final String _nextStop;

  MainPageModel(
    this._distance,
    this._currentStop,
    this._nextStop,
  );

  get busstopid => _distance;
  get currentStop => _currentStop;
  get nextStop => _nextStop;
}
