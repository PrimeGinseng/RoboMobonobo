var level = argument0;
//show_message(level);
if(level == 2)
{
    if(!file_exists("level101.dat"))
    {
        var fileid = file_text_open_write("level101.dat"); 
        show_message(fileid);
        file_text_close(fileid);
        exit;
    }    
/*    var fileid = file_text_open_read("level101.dat"); //open the level 1 data
    var dsLevel101 = ds_map_create(); //create the data structure map
    var mapstring = file_text_readln(fileid); //get the line
    
    if(ds_map_exists(mapstring,ds_type_map))
    {
        ds_map_read(fileid,mapstring); //set the map for this level
        squid1 = ds_map_read(dsLevel101,"Squids");
        point1 = ds_map_read(dsLevel101,"Points");
    }
    else
    {
        exit;
    }*/
}



/*

This will be used later on to load each level's statistics for the world hub
and 100% stuff.

In the meantime, it generates the file for each level if it does not exist.
