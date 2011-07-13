system.import('init.em');

/*
 * The following will delete the presence created for this entity
 * via scene.db. It then calls a user-supplied function called "init"
 */
function delete_default_presence(default_presence) {
    system.onPresenceConnected(function() {});
    default_presence.disconnect();
    init();
}
system.onPresenceConnected(delete_default_presence);
