///this script will check if your current stats in the room are higher than the saved stats
//if so, replace the values

var level = argument0;
var squidComp = global.squids;
var pointComp = global.points;

if(level == 2)
{
    var fileid = file_text_open_read("level101.dat"); //open the level 1 data
    var dsLevel101 = ds_map_create(); //create the data structure map
    var mapstring = file_text_readln(fileid); //get the line
    file_text_close(fileid);
    
    if(ds_map_exists(mapstring,ds_type_map))
    {
        ds_map_read(fileid,mapstring); //set the map for this level
        squid1 = ds_map_read(dsLevel101,"Squids");
        point1 = ds_map_read(dsLevel101,"Points");
        
        if(squidComp > squid1) ds_map_replace(dsLevel101,"Squids",squidComp);
        if(pointComp > point1) ds_map_replace(dsLevel101,"Points",pointComp);
        
        var fileid2 = file_text_open_write("level101.dat");
        var mapstring2 = ds_map_write(dsLevel101);
        file_text_write_string(fileid2,mapstring2);    
        file_text_close(fileid2);    
    }
    else
    {
        ds_map_add(dsLevel101,"Squids",global.squids);
        ds_map_add(dsLevel101,"Points",global.points);
        var fileid2 = file_text_open_write("level101.dat");
        var mapstring2 = ds_map_write(dsLevel101);
        file_text_write_string(fileid2,mapstring2);  
        file_text_close(fileid2);
    }
}
