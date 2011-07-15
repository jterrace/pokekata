system.require("namespace.em");

Namespace("pokekata").PokeballJoiner = function(pos) {
    this.pos = pos;
    system.createPresence("meerkat:///jterrace/pokemon/pokeball.dae/optimized/0/pokeball.dae",
            std.core.bind(this.onPresenceCreated, this),
            this.pos);
};

pokekata.PokeballJoiner.prototype.onPresenceCreated = function(presence) {
    this.presence = presence;
    this.presence.setScale(10);
    system.print("Created pokeball joiner\n");
    std.core.bind(this.actionMsgCallback, this) << [{'action':'touch':}];
    std.core.bind(this.playerJoined, this) << [{'reply':'script':}];
};

pokekata.PokeballJoiner.prototype.actionMsgCallback = function(msg, sender) {
    system.print("Got a message from sender " + sender + " to potentially join the game\n");
    var request = {
        request : 'script',
        script : '(' + this.joinGame + ')()'
    };
    request >> sender >> [];
};

pokekata.PokeballJoiner.prototype.joinGame = function() {
    system.__debugPrint('I HAVE JOINED THE GAME\n');
    return 'yes';
};

pokekata.PokeballJoiner.prototype.playerJoined = function(msg, sender) {
    system.print('Player ' + sender + ' is joining the game\n');
    pokekata.sJoinedList[sender.toString()] = sender;
};

pokekata.sJoinedList = {};
