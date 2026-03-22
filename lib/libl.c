#include <stdio.h>
#include <stdlib.h>
#include "libl.h"

void* update_coord(void* fpoint, coord_t* updated_coord){
	coord_t *_point = (coord_t*)fpoint;
	_point->x = updated_coord->x;
	_point->y = updated_coord->y;
	_point->z = updated_coord->z;

	return (void*) _point;
}

void print_coord(void* point){
	coord_t* Point = (coord_t*)point;
	printf("(x,y,z) = (%f,%f,%f)\n", Point->x, Point->y, Point->z);
}

void* set_coord(float x, float y, float z) {
    coord_t *heap_coord = (coord_t*)malloc(sizeof(coord_t));
    if (!heap_coord) return NULL;

    heap_coord->x = x;
    heap_coord->y = y;
    heap_coord->z = z;

    return (void*)heap_coord;
}
