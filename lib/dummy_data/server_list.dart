List serverList = [
  Server(
    state: 'Roma',
    country: 'Italy',
    host: 'GARR',
  ),
  Server(
    state: 'Helsinki',
    country: 'Finland',
    host: 'Hetzner',
    counter: 1,
  )
];

class Server {
  Server({
    this.state,
    this.country,
    this.host,
    this.counter,
  });
  String state;
  String country;
  String host;
  int counter;
}
