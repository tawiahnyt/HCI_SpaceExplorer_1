//Game controller keeps all global variables and game state for progress tracking
persistent = true;

global.game = {
    score: 0,
    location: "Earth",
	prev_location : room_previous(room),
	next_location : room_next(room),
    has_key: false,
    inventory: []
};

global.room_mappings = {};
variable_struct_set(global.room_mappings, rm_sun, "Sun");
variable_struct_set(global.room_mappings, rm_mercury, "Mercury");	
variable_struct_set(global.room_mappings, rm_venus, "Venus");
variable_struct_set(global.room_mappings, rm_earth_home, "Earth");
variable_struct_set(global.room_mappings, rm_mars, "Mars");
variable_struct_set(global.room_mappings, rm_jupiter, "Jupiter");
variable_struct_set(global.room_mappings, rm_saturn, "Saturn");
variable_struct_set(global.room_mappings, rm_uranus, "Uranus");
variable_struct_set(global.room_mappings, rm_neptune, "Neptune");


//Used for tracking of SIRRs database
global.visited = {
	Sun: false,
	Mercury: false,
	Venus: false,
	Earth: true, 
	Mars: false,
	Jupiter: false,
	Saturn: false,
	Uranus: false,
	Neptune: false
}

global.planet_info = {
    Sun: {
        has_rings: false,
        moons: 0,
        surface: "Plasma"
    },
    Mercury: {
        has_rings: false,
        moons: 0,
        surface: "Rocky, cratered"
    },
    Venus: {
        has_rings: false,
        moons: 0,
        surface: "Acidic, volcanic"
    },
    Earth: {
        has_rings: false,
        moons: 1,
        surface: "Oceans, land"
    },
    Mars: {
        has_rings: false,
        moons: 2,
        surface: "Dusty, desert"
    },
    Jupiter: {
        has_rings: true,
        moons: 95,
        surface: "Gas giant"
    },
    Saturn: {
        has_rings: true,
        moons: 83,
        surface: "Gas giant with icy rings"
    },
    Uranus: {
        has_rings: true,
        moons: 27,
        surface: "Ice giant"
    },
    Neptune: {
        has_rings: true,
        moons: 14,
        surface: "Ice giant"
    }
};

global.planet_sprites = {
    Sun: spr_sun,
    Mercury: spr_mercury,
    Venus: spr_venus,
    Earth: spr_earth2,
    Mars: spr_mars,
    Jupiter: spr_jupiter,
    Saturn: spr_saturn,
    Uranus: spr_uranus,
    Neptune: spr_neptune
};

global.missions = {
    visited_mars: false,
    visited_all_planets: false,
    visited_gas_giants: false,
	visited_ice_giants: false,
	visited_ringed_planets: false
};

global.mission_info = {
	visited_mars: "Red Planet Rover: Visit Mars.",
	visited_all_planets: "Solar System Voyager: Visit every planet.",
	visited_gas_giants: "Gas Giant Explorer: Visit Jupiter and Saturn.",
	visited_ice_giants: "Ice Giant Explorer: Visit Uranus and Neptune.",
	visited_ringed_planets: "Ring Collector: Visit all planets with rings."
};


// These will be the sprites for the badges you create
// Example: spr_badge_mars, spr_badge_voyager, etc.
// Make sure to import your badge images as sprites first.
global.badge_sprites = {
    // Safely get the sprite asset by name. If it doesn't exist, assign 'noone'.
    visited_mars: asset_get_index("spr_badge_mars") != -1 ? asset_get_index("spr_badge_mars") : noone, 
    visited_all_planets: asset_get_index("spr_badge_voyager") != -1 ? asset_get_index("spr_badge_voyager") : noone,
    visited_gas_giants: asset_get_index("spr_badge_gas_giants") != -1 ? asset_get_index("spr_badge_gas_giants") : noone,
	visited_ice_giants: asset_get_index("spr_badge_ice_giants") != -1 ? asset_get_index("spr_badge_ice_giants") : noone,
	visited_ringed_planets: asset_get_index("spr_badge_rings") != -1 ? asset_get_index("spr_badge_rings") : noone
};


global.planet_descriptions = {
	Sun: "The Sun is the star in the middle of our solar system. "
	 + " Its gravity holds all the planets in one place as they orbit around the plasma ball of energy.",
    Mercury: "Mercury is a small rocky planet that is the closest to the sun of all the planets. This is the fastest planet in our solar system. It rotates around the Sun every 88 Earth days.",
    Venus: "Venus is the second planet from the Sun. It is the hottest planet in our solar system and is predominantly made of clouds. The surface is much too hot for humans to visit.",
    Earth: "Earth is our home planet. Despite all of humanity living on land, the Earth is primarily water! This is why scientists call Earth the pale blue dot." 
	+ " Out of all the planets in our solar system, Earth is the only planet with organic life such as plants and animals.",
    Mars: "Mars is the most similar to Earth. Although it has a dusty, desert-like surface, scientists have sent rovers to Mars to explore the rusty looking planet."
	 + " These rovers found water on Mars which makes it another planet capable of sustaining organic life.",
    Jupiter: "Jupiter is the largest planet. If Jupiter was a hollow shell, 1,000 Earths could fit inside of it."
	+  " Despite the planet Saturn being known for having rings, Jupiter also has faint pale rings and many moons compared to our one moon on Earth.",
    Saturn: "Saturn is a very large planet known for its pronounced rings. The rings of Saturn are made of small chunks of ice and rock coated with other materials like space dust. "
	+ "Interestingly, Saturn does not have a hard surface like Earth. Saturn is a gas giant.",
    Uranus: "Uranus is the seventh planet from the Sun and the third largest planet in our solar system. This planet is very cold and windy. Like Jupiter, it has faint rings. "
	+ "Uranus is the first of two ice giants in the outer part of the solar system.",
    Neptune: "Neptune is the eight and most distant planet from the Sun. Similar to Uranus, it is another ice giant which would be too cold for humans to comfortably visit. "
	+ "Interestingly, this planet does have water like Earth and Mars, but we know very little about the planet because it is so far from Earth."
};