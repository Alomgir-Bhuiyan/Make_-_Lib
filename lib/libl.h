#ifndef LIBL_H
#define LIBL_H

typedef struct {
	float x, y, z;
}coord_t;

void* set_coord(float, float, float);
void print_coord(void*);
void* update_coord(void*, coord_t*);

#endif
