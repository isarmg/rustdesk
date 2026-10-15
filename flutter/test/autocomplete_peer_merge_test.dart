import 'package:flutter_hbb/common/widgets/autocomplete.dart';
import 'package:flutter_hbb/models/peer_model.dart';
import 'package:flutter_test/flutter_test.dart';

Peer _peer({
  required String id,
  String alias = '',
  String username = '',
  String hostname = '',
  bool online = false,
}) {
  final peer = Peer(
    id: id,
    username: username,
    hostname: hostname,
    alias: alias,
    platform: '',
    forceAlwaysRelay: false,
  );
  peer.online = online;
  return peer;
}

void main() {
  test('merged autocomplete peers retain LAN identity and recent online state', () {
    final peers = mergeAutocompletePeers(
      lanPeers: [_peer(id: '123456789', alias: 'Office PC', username: 'lan-user')],
      recentPeers: [_peer(id: '123456789', online: true)],
    );
    expect(peers, hasLength(1));
    expect(peers.single.alias, 'Office PC');
    expect(peers.single.username, 'lan-user');
    expect(peers.single.online, isTrue);
  });

  test('online callback updates currently displayed options', () async {
    final loader = AllPeersLoader(
      queryOnlines: (ids) async {},
      queryOnlineDebounce: Duration(milliseconds: 1),
    );
    final displayedOptions = [_peer(id: '123456789')];

    loader.queryOnlines(displayedOptions);
    loader.updateOnlineStateForTesting({
      'onlines': '123456789',
      'offlines': '',
    });

    expect(displayedOptions.single.online, isTrue);
    await Future.delayed(Duration(milliseconds: 2));
  });
}
