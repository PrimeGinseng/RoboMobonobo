
if(!grounded && sprite_index!=sprRoboJump)
{
    sprite_index = sprRoboJump;
}
if(grounded && sprite_index!= sprRoboIdle)
{
    sprite_index = sprRoboIdle;
}
