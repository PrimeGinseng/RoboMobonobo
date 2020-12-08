/**
 * draw_arc(x, y, radius, direction1, direction2);
 ** x, y - the coordinates of the center
 ** r - the radius of the arc
 ** direction1 - the starting angle of the arc
 ** direction2 - the ending angle of the arc
 * Draws an arc
 */

var xx, yy, a1, a2, r;
xx = argument0;
yy = argument1;
a1 = argument3;
a2 = argument4;
r = argument2;

arclen = r * (a2 - a1) * pi / 180;
step = (a2 - a1) / arclen;

for (i = a1; i < a2; i += step) {
    draw_point(xx + lengthdir_x(r, i), yy + lengthdir_y(r, i));
}
