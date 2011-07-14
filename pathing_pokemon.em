system.require("namespace.em");
system.require("std/core/repeatingTimer.em");
system.require("std/movement/moveAndRotateTo.em");

Namespace("pokekata").PathingPokemon = function(species, pos, radius) {
    this.pos = pos;
    this.radius = radius;
    this.species = species;
    system.createPresence(species.getMesh(), std.core.bind(this.onPresenceCreated, this), pos);
};

pokekata.PathingPokemon.prototype.onPresenceCreated = function(presence) {
    this.presence = presence;
    this.moving = new std.movement.MoveAndRotateTo(this.presence, undefined, undefined, undefined, this.randSpeed(), 5, function() { });
    this.moving.goTo(this.pos + <this.randLoc(),0,this.randLoc()>, undefined, std.core.bind(this.finishedMoving, this));
};

pokekata.PathingPokemon.prototype.randLoc = function() {
    return (util.rand() - 0.5) * 10.0;
};

pokekata.PathingPokemon.prototype.randSpeed = function() {
    return util.rand() * 5.0 + 1.0;
};

pokekata.PathingPokemon.prototype.finishedMoving = function() {
    var self = this;
    system.timeout(util.rand() * 5, function() {
        self.moving.setSpeed(self.randSpeed());
        self.moving.goTo(self.pos + <self.randLoc(),0,self.randLoc()>, undefined, std.core.bind(self.finishedMoving, self));
    });
};
