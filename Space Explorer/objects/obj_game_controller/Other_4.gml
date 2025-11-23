/// @description Update visited status when entering a new room

// Get the name of the current room from the room_mappings struct
var current_planet_name = variable_struct_get(global.room_mappings, room);

// If the current room is a valid planet in our tracking list...
if (current_planet_name != undefined && variable_struct_exists(global.visited, current_planet_name)) {
    
    // ...set its visited status to true.
    variable_struct_set(global.visited, current_planet_name, true);
    show_debug_message("Just Visited: " + current_planet_name);

    // Check for mission completions
    // Mission: Visit Mars
    if (global.visited.Mars && !global.missions.visited_mars) {
        global.missions.visited_mars = true;
        show_notification("Mission Complete: Red Planet Rover!", obj_notification);
    }

    // Mission: Visit Gas Giants (Jupiter and Saturn)
    if (global.visited.Jupiter && global.visited.Saturn && !global.missions.visited_gas_giants) {
        global.missions.visited_gas_giants = true;
        show_notification("Mission Complete: Gas Giant Explorer!", obj_notification);
    }
	
	// Mission: Visit Ice Giants (Uranus and Neptune)
	if (global.visited.Uranus && global.visited.Neptune && !global.missions.visited_ice_giants) {
		global.missions.visited_ice_giants = true;
		show_notification("Mission Complete: Ice Giant Explorer!", obj_notification);
	}

    // Mission: Visit all planets
    if (global.visited.Sun && global.visited.Mercury && global.visited.Venus && global.visited.Mars && global.visited.Jupiter && global.visited.Saturn && global.visited.Uranus && global.visited.Neptune && !global.missions.visited_all_planets) {
        global.missions.visited_all_planets = true;
        show_notification("Mission Complete: Solar System Voyager!", obj_notification);
    }
	
	// Mission: Visit all planets with rings (Jupiter, Saturn, Uranus, Neptune)
	if (global.visited.Jupiter && global.visited.Saturn && global.visited.Uranus && global.visited.Neptune && !global.missions.visited_ringed_planets) {
		global.missions.visited_ringed_planets = true;
		show_notification("Mission Complete: Ring Collector!", obj_notification);
	}
}