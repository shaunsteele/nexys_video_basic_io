#include <inttypes.h>
#include "io_rw.h"
#include "NexysVideoBasicIO.h"

NexysVideoBasicIO::NexysVideoBasicIO(uint64_t coreBaseAddr) {
    baseAddr = coreBaseAddr;
    leds = 0;
    switches = 0;
    buttons = 0;
}

NexysVideoBasicIO::~NexysVideoBasicIO() {}

void NexysVideoBasicIO::SetLed(uint8_t data) {
    leds = data;
    io_write(baseAddr, LED, leds);
}

uint8_t NexysVideoBasicIO::ReadLed() {
    return leds;
}

uint8_t NexysVideoBasicIO::ReadSwitches() {
    switches = io_read(baseAddr, SWITCH);
    return switches;
}

uint8_t NexysVideoBasicIO::ReadButtons() {
    buttons = io_read(baseAddr, BUTTON);
    return buttons;
}
