/*if (place_meeting(x+hspeed_,y,par_wall) || place_meeting(x+hspeed_,y,par_move))
{
    hspeed_ = 0;
    return 1;
}
else
{
    return 0;
}*/



if (place_meeting(x+1,y,par_wall) || place_meeting(x-1,y,par_wall) || place_meeting(x+1,y,par_move) || place_meeting(x-1,y,par_move))
{
    hspeed_ = 0;
    //x = round(x);
    return 1;
}
else return 0;
