#ifndef __IO_RW
#define __IO_RW

#include <inttypes.h>

#ifdef __cplusplus
extern "C" {
#endif

#define io_read(baseAddr, offset) \
    (*(volatile uint64_t *)((baseAddr) + 8*(offset)))

#define io_write(baseAddr, offset, data) \
    (*(volatile uint64_t *)((baseAddr) + 8*(offset)) = (data))

#define get_slot_addr(ioBase, slot) \
    ((uint64_t)((ioBase) + (slot)*32*4))

#ifdef __cplusplus
}
#endif

#endif
