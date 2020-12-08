//if(canmove && (place_meeting(x+1,y,objRoboIdle) or place_meeting(x-1,y,objRoboIdle)))
//if(canmove && (collision_point(x+6, y-1, objRoboIdle, false, true) || collision_point(x-6, y-1, objRoboIdle, false, true)))
if((collision_rectangle(x-7,y,x+7,y-1,objRoboIdle,false,true)))
{
    if(canmove && grounded)
    {
        if(!scr_object_collision_check()) hspeed_ = objRoboIdle.hspeed_;
        else // just a precaution
        {
            objRoboIdle.x -= objRoboIdle.image_xscale*5;
        }
    }
    
    
}
else
{
    hspeed_ = 0;

    
    if(grounded && (place_meeting(x+1,y,objRoboIdle) && objRoboIdle.key_left))
    {
        objRoboIdle.hspeed_ = 0.3;
    }
    
    if(grounded && (place_meeting(x-1,y,objRoboIdle) && objRoboIdle.key_right))
    {
        objRoboIdle.hspeed_ = -0.3;
    }
    if(grounded && (place_meeting(x+1,y,objRoboIdle) && objRoboIdle.y!=y))
    {
        objRoboIdle.hspeed_ = 0.3;
    }
    if(grounded && (place_meeting(x-1,y,objRoboIdle) && objRoboIdle.y!=y))
    {
        objRoboIdle.hspeed_ = -0.3;
    }

}


