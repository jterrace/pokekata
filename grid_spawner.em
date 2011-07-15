system.require("namespace.em");
system.require("std/core/repeatingTimer.em");
system.require("grid_block.em");

Namespace("pokekata").GridSpawner = function(centerPosition, radius, numCells, numActive) {
    this.centerPosition = centerPosition;
    this.radius = radius;
    this.numCells = numCells;
    this.numActive = numActive;
    
    var sides = Math.floor(Math.sqrt(numCells));
    var left = centerPosition.x - radius;
    var right = centerPosition.x + radius;
    var width = right - left;
    this.blockWidth = width / sides;
    var top = centerPosition.z - radius;
    var bottom = centerPosition.z + radius;
    var height = bottom - top;
    this.blockHeight = height / sides;
    
    this.freeBlocks = new Array();
    for (var i=0; i<sides; i++) {
        for (var j=0; j<sides; j++) {
            this.freeBlocks.push({x:left+i*this.blockWidth, z:top+j*this.blockHeight});
        }
    }
    this.spawnedBlocks = new Array();
    
    this.spawnCheckTimer = new std.core.RepeatingTimer(5, std.core.bind(this.spawnCheck, this));
};

pokekata.GridSpawner.prototype.spawnCheck = function() {
    system.print("allocated grid blocks = " + this.spawnedBlocks.length + "/" + this.numActive + " (" + this.numCells + ")\n");
    
    if (this.spawnedBlocks.length < this.numActive) {
        var randLoc = Math.floor(Math.random() * this.freeBlocks.length);
        var gridLoc = this.freeBlocks.splice(randLoc, 1)[0];
        system.prettyprint(gridLoc);
        var gridBlock = pokekata.GridBlock(<gridLoc['x'], 0, gridLoc['z']>, this.blockWidth);
        this.spawnedBlocks.push(gridBlock);
    }
};