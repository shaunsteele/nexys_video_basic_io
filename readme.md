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

## Register Map
| Offset | Register | RW? |
| ------ | -------- | --- |
| 0      | LEDs     | WO  |
| 1      | Switches | RO  |
| 2      | Buttons  | RO  |

## Functions
### Set LED Register
Writes uint8_t to LED register, setting the corresponding 8 LEDs on the Nexys Video Board. The MSB represents the far left LED on the board, and LSB represents the farthest right.

### Read Switches Register
Reads uint8_t from Switches register. 8 Switches register matches the Nexys Video Board's dip switches, MSB represents far left and LSB represents far right.

### Read Buttons Register
Reads uint8_t from Buttons register. The register organizes the 5 buttons like below.

| Bit    | 7 | 6 | 5 | 4   | 3    | 2      | 1     | 0      |
| ------ | - | - | - | --- | ---- | ------ | ----- | ------ |
| Button | x | x | x | top | left | center | right | bottom |

## Test Bench

## Design

## Coverage Results

## Resource Usage
