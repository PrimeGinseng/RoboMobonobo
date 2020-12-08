if(allowedToMove)
{
    move = -key_left + key_right;
    //hspeed_ = move * movespeed;

    if(move!=0) { image_xscale = move; }
}




//new movement with momentum
if(key_right && hspeed_ < 1.8)
{
    hspeed_ += 0.2;
}

else
{
    if (hspeed_ > 0)
    {
        hspeed_ -= 0.1;
    }
}

if(key_left && hspeed_ > -1.8)
{
    hspeed_ -= 0.2;
}
else
{
    if (hspeed_ < 0)
    {
        hspeed_ += 0.1;
    }
}





//doward force (gravity)
vspeed_ += grav;

//follow player around the level, and keep him within bounds
camera_movement();
x=clamp(x, 5, room_width-5);

//set grounded every time
if(place_meeting(x,y+1,par_corner) || place_meeting(x,y+1,par_platforms) || place_meeting(x,y+1,par_move))
{
    grounded = 1;
}
else
{
    grounded = 0;
}

//jump
if (key_jump && jumps > 0 && player_state!=states.Grapple)
{
    if (place_meeting(x,y+1,par_corner) || place_meeting(x,y+1,par_move))
    {
        jumps--;
        vspeed_ = -jumpspeed;
    }
    else
    {
        //then you must be in the air after moving off a platform, so you only get 1 jump
        //if you are 1 next to a platform, give some leeway
        //this entire code is convoluted, but basically, if there is a corner platform to your sides, but not 1 pixel above your hitbox's bottom border,
        //then you're able to get 2 jumps to give that leeway when coming off of platforms. Feels much better.
        //but not on on platforms like the bridge
        if (jumps > 0) && (place_meeting(x+8,y+1,par_corner) && !place_meeting(x+8,y-2,par_corner)) || (place_meeting(x-8,y+1,par_corner) && !place_meeting(x-8,y-2,par_corner))
        {
            jumps--;
            vspeed_ = -jumpspeed-jumpaccel;
        }

        //then you must be in the air after jumping once
        else

        {
            if (jumps < 2)
            {
                jumps--;
                vspeed_ = -jumpspeed; //no jump accel cause nothing is propelling you
            }
            else
            {
                jumps = 0;
                vspeed_ = -jumpspeed; //no jump accel because this is the second jump, no propelling
            }
        }
    }
}

//so your short hop, if you don't hold onto jump, is wtv it's set to earlier,
//if you hold jump, you'll jump higher
if(key_jump_released && vspeed_ < 0)
{
    vspeed_ /= 2;
}


//reset jumps if you land on a moving object
if(place_meeting(x,y+1,par_moving))
{
    jumps = JUMPSMAX;
}




/*
//Collisions
//Horizontal
if (place_meeting(x+hspeed_,y,par_wall) && player_state == states.Normal)
{
    yPlus = 0;
    while(place_meeting(x+hspeed_,y-yPlus,par_wall) && yPlus <= abs(1*hspeed_)){
        yPlus +=1;
    }
    if(place_meeting(x+hspeed_, y-yPlus,par_wall)){
        while(!place_meeting(x+sign(hspeed_),y,par_wall)){
            x += sign(hspeed_);
        }
        hspeed_ = 0;
    }
    else{
        y -= yPlus;
    }

}
*/


//temporary? simpler horizontal collision
if (place_meeting(x+hspeed_,y,par_wall) && player_state == states.Normal)
{
    hspeed_ = 0;
}
if(place_meeting(x+hspeed_,y,par_move) && player_state == states.Normal)
{
    with (instance_nearest(x,y,par_move))
    {
        if(!canmove)
        {
            other.hspeed_ = -0.2*other.move;
        }
    }
}










if(allowedToMove) x += hspeed_; //x pos is equal to vertical speed


//vertical collision

if (place_meeting(x,y+vspeed_,par_corner) || place_meeting(x,y+vspeed_,par_platforms) || place_meeting(x,y+vspeed_,par_move))
{
    while(!place_meeting(x,y+sign(vspeed_),par_corner) && !place_meeting(x,y+sign(vspeed_),par_platforms) && !place_meeting(x,y+sign(vspeed_),par_move))
    {
        y += sign(vspeed_);
    }
    if (sign(vspeed_) == 1)
    {
        vspeed_ = 0;
        jumps = JUMPSMAX;
        jumpaccel = 0;
        xoriginal = x;
        yoriginal = y;

    }
}

// hit ceiling
if (place_meeting(x,y-1,par_corner) || place_meeting(x,y-1,par_platforms))
{
    if(sign(vspeed_) < 0)
    {
        var thang = vspeed_;
        vspeed_ += abs(thang);
    }

}


y += vspeed_/*-grav*/; //y pos is equal to vertical speed



