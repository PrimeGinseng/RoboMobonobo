/*view_xview[0] += ((x-(view_wview[0]/2)) - view_xview[0]) * 0.2;
view_yview[0] += ((y-(view_hview[0]/2)) - view_yview[0]) * 0.2;*/

view_xview = lerp(view_xview,activeCamera.x-(view_wview/2),0.1)
view_yview = lerp(view_yview,activeCamera.y-(view_hview/2),0.1)

view_xview = clamp(view_xview,0,room_width-view_wview)
view_yview = clamp(view_yview,0,room_height-view_hview)
