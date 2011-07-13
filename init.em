system.require("namespace.em");
system.require("pokedex.em");

Namespace("pokekata").init = function init() {
    pokedex = new pokekata.Pokedex();
    species = pokedex.getArray();
    var xPos = 0;
    var zPos = 0;
    for (i in species) {
        system.print("Creating presence for species: " + species[i] + "\n");
        system.createPresence(species[i].getMesh(), std.core.bind(pokekata.presenceCreated, this, <xPos, 0, zPos>));
        xPos++;
        if (xPos >= 5) {
            xPos = 0;
            zPos += 2;
        }
    }
}

pokekata.presenceCreated = function presenceCreated(pos, presence) {
    presence.setPosition(pos);
}

function init() {
    pokekata.init();
}
