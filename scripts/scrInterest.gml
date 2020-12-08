if(place_meeting(x,y,objRoboIdle) && !instance_exists(objInterestExcl))
{
    //if(!instance_exists(objInterestExcl))
    //{
        instance_create(objRoboIdle.x,objRoboIdle.y,objInterestExcl);
    //}
}

if(!place_meeting(x,y,objRoboIdle) && instance_exists(objInterestExcl))
{
    //if(instance_exists(objInterestExcl))
    //{
        with(objInterestExcl)
        {
            instance_destroy();
        }
    //}
}



/*
else
{
    with(objInterestExcl)
    {
        instance_destroy();
    }
    
}
