
#include <iostream>
#include <stdio.h>
#include <string.h>

struct cavityInput 
{
	char cavity_type[8];
	int patch_level;
	double coarsity;
	double area;
	double min_distance;
	int der_order;
	bool scaling;
	char radii_set[8];
	char restart_name[20];
    friend std::ostream & operator<<(std::ostream & os, cavityInput & o) {
        os << "cavity type " << std::string(o.cavity_type) << std::endl;
	os << "patch level " << o.patch_level << std::endl;
	os << "coarsity " << o.coarsity << std::endl;
	os << "area " << o.area << std::endl;
	os << "min distance " << o.min_distance << std::endl;
	os << "der order " << o.der_order << std::endl;
	os << "scaling " << o.scaling << std::endl;
	os << "radii set " << std::string(o.radii_set) << std::endl;
	os << "restart name " << std::string(o.restart_name);
        return os;
    }
};

extern "C"
{
    extern void fortran_print(const char *line);
    extern void host_input(cavityInput * cav);

    void c_print(const char *line)
    {
        printf("C code: string=%s length=%i\n", line, strlen(line));
        fortran_print("pong");
    	cavityInput cav;
    	host_input(&cav);
	printf("cav.cavity_type = %s length = %i\n", cav.cavity_type, strlen(cav.cavity_type));
	printf("cav.patch_level = %i\n", cav.patch_level);
	printf("cav.coarsity = %f\n", cav.coarsity);
	printf("cav.area = %f\n", cav.area);
	printf("cav.min_distance = %f\n", cav.min_distance);
	printf("cav.der_order = %i\n", cav.der_order);
	printf("cav.scaling = %i\n", cav.scaling);
	printf("cav.radii_set = %s length = %i\n", cav.radii_set, strlen(cav.radii_set));
	printf("cav.restart_name = %s length = %i\n", cav.restart_name, strlen(cav.restart_name));
    }

}
