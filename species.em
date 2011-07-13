system.require("namespace.em");

Namespace("pokekata").Species = function(id, mesh) {
    this.id = id;
    this.mesh = mesh;
};

pokekata.Species.prototype.getId = function getId() {
    return this.id;
};

pokekata.Species.prototype.getMesh = function getMesh() {
    return this.mesh;
};

pokekata.Species.prototype.toString = function toString() {
    return "<Species id=" + this.id + ">";
};
