system.require("namespace.em");
system.require("pokedex.em");
system.require("pathing_pokemon.em");
system.require("grid_spawner.em");

Namespace("pokekata");

pokekata.createGround = function() {
    system.createPresence("meerkat:///echeslack/simple_terrain.dae/optimized/0/simple_terrain.dae", function(pres){pres.setScale(1000);}, <0,-1,0>);
};

pokekata.init = function init() {
    pokekata.createGround();
    pokekata.gridspawner = new pokekata.GridSpawner(<0,0,0>, 500, 1000, 50);
}

function init() {
    pokekata.init();
}
