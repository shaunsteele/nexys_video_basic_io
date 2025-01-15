#include <inttypes.h>

class NexysVideoBasicIO {
    /* Register Map */
    enum {
        LED = 0,
        SWITCH = 1,
        BUTTON = 2
    };
public:
    NexysVideoBasicIO(uint64_t base_addr);   // constructor
    ~NexysVideoBasicIO();                    // destructor
    /* methods */
    void set_led(uint8_t data);
    uint64_t read_switches();
    uint64_t read_buttons();
private:
    uint64_t base_addr;
};
