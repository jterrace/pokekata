system.require("namespace.em");
system.require("grid_spawner.em");
system.require("pokeball_joiner.em");

Namespace("pokekata");

pokekata.createGround = function() {
    system.createPresence("meerkat:///echeslack/simple_terrain.dae/optimized/0/simple_terrain.dae",
            function(pres){pres.setScale(250);},
            <0,-1,0>);
};

pokekata.init = function init() {
    pokekata.createGround();
    pokekata.pokeballJoiner = new pokekata.PokeballJoiner(<0,50,0>);
    pokekata.gridSpawner = new pokekata.GridSpawner(<0,0,0>, Math.sqrt((250*250)/2.0), 50, 10);
}

function init() {
    pokekata.init();
}
