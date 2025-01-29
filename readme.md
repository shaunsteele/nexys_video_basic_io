[ ] read me
[x] driver header
[x] driver implimentation
[ ] test bench
[ ] rtl
[ ] test coverage
[ ] release

# Nexys Video Basic IO
Package that will control the Digilent Nexys Video basic IO components:
    - LEDs
    - Switches
    - Buttons

## Design
The device contains three status control registers for the LEDs, switches, and buttons. The LEDs are controlled by a read and writeable 8-bit register. The switches and buttons are controlled by read only registers, 8-bit for the switches and 5-bit for the buttons.

The registers are controlled by an AXI Lite subordinate interface. The interface has 64-bit address and data widths. The interface supports AXI4 and AXI5 Lite.

### Register Map
| Offset | Register | RW? |
| ------ | -------- | --- |
| 0x0    | LEDs     | RW  |
| 0x8    | Switches | RO  |
| 0x10   | Buttons  | RO  |

### Functions
#### Set LED Register
Writes uint8_t to LED register, setting the corresponding 8 LEDs on the Nexys Video Board. The MSB represents the far left LED on the board, and LSB represents the farthest right.

#### Read Switches Register
Reads uint8_t from Switches register. 8 Switches register matches the Nexys Video Board's dip switches, MSB represents far left and LSB represents far right.

#### Read Buttons Register
Reads uint8_t from Buttons register. The register organizes the 5 buttons like below.

| Bit    | 7 | 6 | 5 | 4   | 3    | 2      | 1     | 0      |
| ------ | - | - | - | --- | ---- | ------ | ----- | ------ |
| Button | x | x | x | top | left | center | right | bottom |

## Verification
The verification test bench is developed in Systemverilog and designed using the UVM framework. The 

├── test
|   ├── environment
|   |   ├── register environment
|   |   |   ├── register block
|   |   |   |   ├── buttons
|   |   |   |   ├── leds
|   |   |   |   ├── switches
|   |   |   ├── register to AXI adapter
|   |   ├── AXI Agent
|   |   |   ├── sequence item
|   |   |   ├── driver
|   |   |   ├── monitor

## Coverage Results

## Resource Usage
