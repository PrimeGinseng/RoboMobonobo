if(!pendulateExecuted)
{
    radius = round(faggot+8);
    //if(radius <32) radius = 32;
    jumps = 1;
}
pendulateExecuted = 1;
   
    if(distance_to_object(obj_hook) < 12)
    {
        objRoboIdle.hookShot = 0;
        objRoboIdle.hookContact = 0;
        objRoboIdle.player_state = states.Normal;
        grav = 0.2;
        xspd = 0;
        yspd = 0;
        xacc = 0;
        yacc = 0;
        pendulateExecuted = 0;
        canJump = 1;
        with(obj_hook) { instance_destroy(); }
        exit;
    }

//if(radius < 32) radius++;


if(key_down && radius < 100)
{
    radius++;
}
if(key_up && radius > 32)
{
    radius--;
}

pivotx = obj_hook.x;
pivoty = obj_hook.y;


// Update the x and y with the corresponding speeds.
x += xspd;
y += yspd;


/* Perform calculations for the next step */    
    /** 
     * Since x and y will most likely not be within
     *  the radius to the pivot point, calculate
     *  the actual x and y for the pendulum to be
     *  exactly at the correct radius.
     */
    dir = point_direction(pivotx, pivoty, x, y);
    actualx = pivotx + lengthdir_x(radius, dir);
    actualy = pivoty + lengthdir_y(radius, dir);
    
    /**
     * Create unnecessary variables to hold the
     *  difference between the actual position and
     *  the current position. These will serve as
     *  the tension force of the rope.
     */
    diffx = actualx - x;
    diffy = actualy - y;
    
    /**
     * Caculate the correct acceleration by applying
     *  the constant force (gravity in most cases) to
     *  the acceleration. Also applied is the tension
     *  of the rope.
     */
     
    if(place_meeting(x+(xspd+xacc*2),y,par_corner) or place_meeting(x,y+(yspd+yacc*2),par_corner) or (place_meeting(x+(xspd+xacc*2),y+(yspd+yacc*2),par_corner)) or place_meeting(x+1,y,par_corner) or place_meeting(x-1,y,par_corner))
    {
        
        /*xspd*=-2;
        yspd*=-2;
        xacc*=-2;
        yacc*=-2;*/
        xspd = round(xspd*-2);
        yspd = round(yspd*-2);
        xacc = 0;
        yacc = 0;
        
        objRoboIdle.hookShot = 0;
        objRoboIdle.hookContact = 0;
        objRoboIdle.player_state = states.Normal;
        grav = 0.2;
        xspd = 0;
        yspd = 0;
        xacc = 0;
        yacc = 0;
        pendulateExecuted = 0;
        canJump = 1;
        with(obj_hook) { instance_destroy(); }
        exit;
    }


     
    xacc = (forcex + diffx) / mass * coefrestore + (hspeed_save/4);
    yacc = (forcey + diffy) / mass * coefrestore + (vspeed_save/4);


    
    // Apply the acceleration to the speeds
    xspd += xacc;
    yspd += yacc;
    
    // Place the pendulum at the actual position
    if(!place_meeting(actualx,actualy,par_corner))
    {
        x = actualx;
        y = actualy;
    }

/* Calculations finished */

