#include <stdlib.h>
#include "lib/libl.h"

int main() {
	coord_t *Point = (coord_t*)set_coord(2, 4, 3);
	print_coord((void*)Point);

	free(Point);

	return 0;
}
