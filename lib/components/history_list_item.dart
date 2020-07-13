import 'package:flutter/material.dart';

class Items {
  Items(
      {this.time,
      this.network,
      this.ping,
      this.download,
      this.upload,
      this.ip,
      this.location});
  // todo change to DateTime
  String time, ip, location;
  IconData network;
  int ping;
  double download, upload;
}

List historyItemList = [
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.wifi,
    ping: 28,
    download: 87,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
  ),
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.speaker_phone,
    ping: 84,
    download: 42.1,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
  ),
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.wifi,
    ping: 11,
    download: 257,
    upload: 61,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
  ),
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.wifi,
    ping: 28,
    download: 87,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
  ),
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.speaker_phone,
    ping: 84,
    download: 42.1,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
  ),
  Items(
    time: '07/02/2020 09:54 AM',
    network: Icons.wifi,
    ping: 11,
    download: 257,
    upload: 61,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
  ),
];
