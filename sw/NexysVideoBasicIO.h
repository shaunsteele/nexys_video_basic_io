#include <inttypes.h>

class NexysVideoBasicIO {
    /* Register Map */
    enum {
        LED = 0,
        SWITCH = 1,
        BUTTON = 2
    };
public:
    NexysVideoBasicIO(uint64_t baseAddr);   // constructor
    ~NexysVideoBasicIO();                    // destructor
    /* methods */
    void SetLed(uint8_t data);
    uint8_t ReadLed();
    uint8_t ReadSwitches();
    uint8_t ReadButtons();
private:
    uint64_t    baseAddr;
    uint8_t     leds;
    uint8_t     switches;
    uint8_t     buttons;
};
