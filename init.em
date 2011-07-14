system.require("namespace.em");
system.require("pokedex.em");
system.require("pathing_pokemon.em");

Namespace("pokekata").init = function init() {
    system.createPresence("meerkat:///echeslack/simple_terrain.dae/optimized/0/simple_terrain.dae", function(pres){pres.setScale(1000);}, <0,-1,0>);
    pokedex = new pokekata.Pokedex();
    species = pokedex.getArray();
    var xPos = 0;
    var zPos = 0;
    for (i in species) {
        system.print("Creating pathing pokemon for species: " + species[i] + "\n");
        p = new pokekata.PathingPokemon(species[i], <xPos, 0, zPos>, 10);
        pokekata.pokemon.push(p);
        xPos+=20;
        if (xPos >= 100) {
            xPos = 0;
            zPos += 20;
        }
    }
}

pokekata.pokemon = [];

function init() {
    pokekata.init();
}
