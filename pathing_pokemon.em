system.require("namespace.em");
system.require("std/core/repeatingTimer.em");
system.require("std/movement/moveAndRotateTo.em");
system.require("std/movement/pursue.em");
system.require("std/core/queryDistance.em");

Namespace("pokekata").PathingPokemon = function(species, pos, radius) {
    this.pos = pos;
    this.radius = radius;
    this.species = species;
    this.isPursuing = false;
    system.createPresence(species.getMesh(), std.core.bind(this.onPresenceCreated, this), pos);
};

pokekata.PathingPokemon.prototype.onPresenceCreated = function(presence) {
    this.presence = presence;
    this.moving = new std.movement.MoveAndRotateTo(this.presence, undefined, undefined, undefined, this.randSpeed(), 5, function() { });
    this.moving.goTo(this.pos + <this.randLoc(),0,this.randLoc()>, undefined, std.core.bind(this.finishedMoving, this));
    this.presence.setQueryAngle(0.0001);
    this.presence.onProxAdded(std.core.bind(this.nearMeIn, this), true);
    this.presence.onProxRemoved(std.core.bind(this.nearMeOut, this), true);
    //this.nearMe = std.core.QueryDistance(this.radius, std.core.bind(this.nearMeIn, this), std.core.bind(this.nearMeOut, this), this.presence);
    this.nearMe = {};
    this.nearMeTimer = new std.core.RepeatingTimer(2, std.core.bind(this.recheckNear, this));
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

pokekata.PathingPokemon.prototype.nearMeIn = function(visible) {
    //system.print("a visible just came near me: " + visible + " at distance " + visible.dist(this.presence.getPosition()) + "\n");
    //system.print(visible.toString());
    this.nearMe[visible.toString()] = visible;
    //this.recheckNear();
};
pokekata.PathingPokemon.prototype.nearMeOut = function(visible) {
    //system.print("a visible just went away from me: " + visible + "\n");
    if (visible.toString() in this.nearMe) {
        delete this.nearMe[visible.toString()];
    }
};
pokekata.PathingPokemon.prototype.recheckNear = function() {
    if (!this.isPursuing) {
        for (visibleId in pokekata.sJoinedList) {
            //system.print("in game: " + visibleId + "\n");
        }
        for (visibleId in this.nearMe) {
            visible = this.nearMe[visibleId];
            //system.print("checking " + visibleId + " isin? " + (visibleId in pokekata.sJoinedList) + "\n");
            
            if (visibleId in pokekata.sJoinedList && visible.dist(this.presence.getPosition()) < 5) {
                system.print('in range so pursue!!\n');
                this.isPursuing = true;
                this.moving.abort();
                this.pursue = new std.movement.Pursue(this.presence, undefined, undefined, 1, 5, function() {}, function() {});
                this.pursue.follow(visible, function() {}, function() {});
            }
        }
    }
};
