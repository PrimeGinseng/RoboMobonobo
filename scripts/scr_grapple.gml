//reset hookshot and reset all the values yo
if(hookShot && hookContact && key_grapple)
{
    objRoboIdle.hookShot = 0;
    objRoboIdle.hookContact = 0;
    objRoboIdle.player_state = states.Normal;
    grav = 0.2;
    xspd = 0;
    yspd = 0;
    xacc = 0;
    yacc = 0;
    hspeed_save = 0;
    vspeed_save = 0;
    pendulateExecuted = 0;
    canJump = 1;
    
    if(place_meeting(x,y,par_corner))
    {
        x = xoriginal;
        y = yoriginal;
    }
    
    with(obj_hook)
    {
        instance_destroy();
    }
    exit;
}


//shoot out that hookshot
if((!hookShot && !hookContact && key_grapple && !key_left && !key_right)  && !key_up)
{
    with(instance_create(x,y-12,obj_hook))
    {
        if(objRoboIdle.image_xscale == 1) 
        {
            direction = 0;
            image_angle = 270;
        }
        if(objRoboIdle.image_xscale == -1) 
        {
            direction = 180;
            image_angle = 90;
        }
    }
    hookShot = 1;
}

if(!hookShot && !hookContact && key_grapple && !key_up && (key_right || key_left))
{
    with(instance_create(x,y-12,obj_hook))
    {
        if(objRoboIdle.image_xscale == 1) 
        {
            direction = 0;
            image_angle = 270;
        }
        if(objRoboIdle.image_xscale == -1) 
        {
            direction = 180;
            image_angle = 90;
        }
    }
    hookShot = 1;
}

if(!hookShot && !hookContact && key_grapple && key_right && key_up)
{
    with(instance_create(x,y-12,obj_hook))
    {
        direction = 45;
        image_angle = -45;
    }
    hookShot = 1;
}

if(!hookShot && !hookContact && key_grapple && key_left && key_up)
{
    with(instance_create(x,y-12,obj_hook))
    {
        direction = 135;
        image_angle = 45;
    }
    hookShot = 1;
}

if(!hookShot && !hookContact && key_grapple & !key_left && !key_right && key_up)
{
    with(instance_create(x,y-12,obj_hook))
    {
        direction = 90;
        image_angle = 0;
    }
    hookShot = 1;
}

