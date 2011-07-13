/*
 * Allows you to define objects in a namespace
 * without checking if the namespace already exists.
 * 
 * To define a function called std.core.bind, you can use:
 *    Namespace("std.core").bind = function() {}
 *    
 */
function Namespace(namespace) {
    parts = namespace.split(".");
    curPart = this;
    while (parts.length > 0) {
        nextPart = parts.shift();
        if (!(nextPart in curPart)) {
            curPart[nextPart] = {};
        }
        curPart = curPart[nextPart];
    }
    return curPart;
}
