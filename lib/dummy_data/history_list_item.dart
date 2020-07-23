import 'package:flutter/material.dart';

class Items {
  Items({
    this.time,
    this.networkType,
    this.ping,
    this.download,
    this.upload,
    this.ip,
    this.location,
    this.wifiName,
  });
  String time, ip, location, wifiName;
  IconData networkType;
  int ping;
  double download, upload;
}

List historyItemList = [
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 28,
    download: 87.7,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
    wifiName: 'Khalid 5G',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.speaker_phone,
    ping: 84,
    download: 42.1,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
    wifiName: 'Starbucks\' guest',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 11,
    download: 257.1,
    upload: 61.3,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
    wifiName: 'The Good Neighbor',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 28,
    download: 51.4,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
    wifiName: 'Bob',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.speaker_phone,
    ping: 84,
    download: 5.6,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
    wifiName: 'MN Rules',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 11,
    download: 21.8,
    upload: 3.1,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
    wifiName: 'I H8 Winter',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 11,
    download: 349.8,
    upload: 84.3,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
    wifiName: 'I H8 Winter',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 28,
    download: 87.7,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
    wifiName: 'Jesus Not Jesus',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.speaker_phone,
    ping: 84,
    download: 42.1,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
    wifiName: 'Bob\'s Bedroom',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 28,
    download: 87.7,
    upload: 4.2,
    ip: '127.0.0.1',
    location: 'Dallas, TX',
    wifiName: 'Master haxer',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.speaker_phone,
    ping: 84,
    download: 42.1,
    upload: 5.9,
    ip: '63.5.1.1',
    location: 'Minneapolis, MN',
    wifiName: 'Don\'t hack me plz',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 11,
    download: 435.6,
    upload: 84.3,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
    wifiName: 'xfinity',
  ),
  Items(
    time:
        '${DateTime.now().month}/${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}',
    networkType: Icons.wifi,
    ping: 11,
    download: 136.84,
    upload: 84.3,
    ip: '15.49.81.3',
    location: 'Los Angeles, CA',
    wifiName: 'NETGEAR00',
  ),
];
