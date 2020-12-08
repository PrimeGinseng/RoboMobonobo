if(!instance_place(x+1,y,objRoboIdle) && !instance_place(x+1,y+1,objRoboIdle) && !instance_place(x,y+1,objRoboIdle) && !instance_place(x-1,y,objRoboIdle) && !instance_place(x-1,y-1,objRoboIdle) && !instance_place(x,y-1,objRoboIdle) && !instance_place(x-1,y+1,objRoboIdle) && !instance_place(x+1,y-1,objRoboIdle))
{
    return 1;
}
else
{
    return 0;
}
