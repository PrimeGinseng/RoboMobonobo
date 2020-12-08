if(!pendulateExecuted)
{
    radius = distance_to_object(obj_hook)+8;
    if(radius <24) radius = 24;
    jumps = 1;
}
pendulateExecuted = 1;

pivotx = obj_hook.x;
pivoty = obj_hook.y;

if(key_down && radius < 100)
{
    radius++;
}
if(key_up && radius > 32)
{
    radius--;
}

/*
if(!place_meeting(x+xspd,y+yspd,par_corner))
{
    x += xspd;
    y += yspd;
}



// Update the x and y with the corresponding speeds.
/*x += xspd;
y += yspd;*/


x+=xspd;
y+=yspd;




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
    xacc = (forcex + diffx) / mass * coefrestore + hspeed_;
    yacc = (forcey + diffy) / mass * coefrestore + vspeed_;
    
    // Apply the acceleration to the speeds
    xspd += xacc;
    yspd += yacc;
    
    // Place the pendulum at the actual position
    x = actualx;
    y = actualy;
    
    //radius--;

/* Calculations finished */

