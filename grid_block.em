system.require("namespace.em");
system.require("pathing_pokemon.em");

Namespace("pokekata").GridBlock = function(centerPosition, radius) {
    var species = pokekata.sPokedex.getRandomSpecies();
    this.pathingPokemon = new pokekata.PathingPokemon(species, centerPosition, radius);
};
