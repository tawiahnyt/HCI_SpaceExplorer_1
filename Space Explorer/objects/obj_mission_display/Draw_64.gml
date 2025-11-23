/// @description Draw Missions and Badges on Profile Page

// Set initial drawing position and styles
var start_x = 225;
var start_y = 150;
var row_h = 60;
var badge_size = 48;

draw_set_font(SIRRDBHeaderFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the title for the mission section
draw_text(start_x, start_y - 50, "Space Missions");

// Get all the mission names from your global struct
var mission_names = variable_struct_get_names(global.missions);

// Loop through each mission to draw it
for (var i = 0; i < array_length(mission_names); i++) {
    var mission_id = mission_names[i];
    
    // Safely get data from the global structs using the mission_id string
    var mission_completed = variable_struct_get(global.missions, mission_id);
    var mission_desc = variable_struct_get(global.mission_info, mission_id);
    var badge_sprite = variable_struct_get(global.badge_sprites, mission_id);
    
    var current_y = start_y + (i * row_h);
    
    // --- Draw Badge ---
    if (badge_sprite != noone && sprite_exists(badge_sprite)) {
        var scale = badge_size / sprite_get_width(badge_sprite);
        var badge_color = mission_completed ? c_white : c_black;
        var badge_alpha = mission_completed ? 1.0 : 0.8;
        draw_sprite_ext(badge_sprite, 0, start_x, current_y, scale, scale, 0, badge_color, badge_alpha);
    }
    
    // --- Draw Mission Text ---
    draw_set_font(SIRRDBColumnFont);
    var text_color = mission_completed ? c_white : c_gray;
    draw_set_color(text_color);
    
    draw_text(start_x + 70, current_y + 10, mission_desc);
    
    draw_set_color(c_white);
}

// --- Draw Completed Mission Badges Section ---

// Set up for the badge collection
var badge_area_x = 700; 
var badge_area_y = 100;
var badge_padding = 20;
var badges_per_row = 3;
var completed_count = 0;

draw_set_font(SIRRDBHeaderFont);
draw_text(badge_area_x, badge_area_y - 50, "Mission Badges");

// Loop through missions again, but this time just to draw completed badges
for (var i = 0; i < array_length(mission_names); i++) {
    var mission_id = mission_names[i];
    var mission_completed = variable_struct_get(global.missions, mission_id);

    // Only draw badges for completed missions
    if (mission_completed) {
        var badge_sprite = variable_struct_get(global.badge_sprites, mission_id);
        
        if (badge_sprite != noone && sprite_exists(badge_sprite)) {
            var col = completed_count % badges_per_row;
            var row = floor(completed_count / badges_per_row);
            var draw_x = badge_area_x + col * (badge_size + badge_padding);
            var draw_y = badge_area_y + row * (badge_size + badge_padding);
            draw_sprite_ext(badge_sprite, 0, draw_x, draw_y, 1, 1, 0, c_white, 1.0);
        }
        completed_count++;
    }
}

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);