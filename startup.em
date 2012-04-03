system.import('init.em');

/*
 * The following will delete the presence created for this entity
 * via scene.db. It then calls a user-supplied function called "init"
 */
var cbc;
function delete_default_presence(default_presence) {
    cbc.clear();
    default_presence.disconnect();
    init();
}
cbc = system.onPresenceConnected(delete_default_presence);
