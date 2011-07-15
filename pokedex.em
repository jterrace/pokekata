system.require("namespace.em");
system.require("species.em");

Namespace("pokekata").Pokedex = function() {
    this.index = {};
    this.pokedex = [];
    this.addSpecies(new pokekata.Species(1, "meerkat:///jterrace/pokemon/001_bulbasaur.dae/optimized/0/001_bulbasaur.dae"));
    this.addSpecies(new pokekata.Species(2, "meerkat:///jterrace/pokemon/002_ivysaur.dae/optimized/1/002_ivysaur.dae"));
    this.addSpecies(new pokekata.Species(3, "meerkat:///jterrace/pokemon/003_venusaur.dae/optimized/1/003_venusaur.dae"));
    this.addSpecies(new pokekata.Species(4, "meerkat:///jterrace/pokemon/004_charmander.dae/optimized/0/004_charmander.dae"));
    this.addSpecies(new pokekata.Species(7, "meerkat:///jterrace/pokemon/007_squirtle.dae/optimized/0/007_squirtle.dae"));
    this.addSpecies(new pokekata.Species(10, "meerkat:///jterrace/pokemon/010_caterpie.dae/optimized/0/010_caterpie.dae"));
    this.addSpecies(new pokekata.Species(13, "meerkat:///jterrace/pokemon/013_weedle.dae/optimized/0/013_weedle.dae"));
    this.addSpecies(new pokekata.Species(16, "meerkat:///jterrace/pokemon/016_pidgey.dae/optimized/0/016_pidgey.dae"));
    this.addSpecies(new pokekata.Species(23, "meerkat:///jterrace/pokemon/023_ekans.dae/optimized/0/023_ekans.dae"));
    this.addSpecies(new pokekata.Species(25, "meerkat:///jterrace/pokemon/025_pikachu.dae/optimized/0/025_pikachu.dae"));
    this.addSpecies(new pokekata.Species(26, "meerkat:///jterrace/pokemon/026_raichu.dae/optimized/0/026_raichu.dae"));
    this.addSpecies(new pokekata.Species(35, "meerkat:///jterrace/pokemon/035_clefairy.dae/optimized/0/035_clefairy.dae"));
    this.addSpecies(new pokekata.Species(39, "meerkat:///jterrace/pokemon/jigglypuff.dae/optimized/0/jigglypuff.dae"));
    this.addSpecies(new pokekata.Species(41, "meerkat:///jterrace/pokemon/041_zubat.dae/optimized/0/041_zubat.dae"));
    this.addSpecies(new pokekata.Species(43, "meerkat:///jterrace/pokemon/043_oddish.dae/optimized/0/043_oddish.dae"));
    this.addSpecies(new pokekata.Species(50, "meerkat:///jterrace/pokemon/050_diglett.dae/optimized/0/050_diglett.dae"));
};

pokekata.Pokedex.prototype.addSpecies = function(s) {
    this.index[s.getId()] = s;
    this.pokedex.push(s);
};

pokekata.Pokedex.prototype.getByNumber = function(num) {
    if (num in this.index) {
        return this.index[num];
    } else {
        return null;
    }
};

pokekata.Pokedex.prototype.getRandomSpecies = function() {
    return this.pokedex[Math.floor(Math.random() * this.pokedex.length)];
};

pokekata.Pokedex.prototype.getArray = function() {
    return this.pokedex;
};

pokekata.sPokedex = new pokekata.Pokedex();
