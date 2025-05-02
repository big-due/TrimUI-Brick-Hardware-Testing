# Current Consumption in TrimUI Brick with NextUI

## Objective

To evaluate the impact of the RGB LEDs on the current consumption of the TrimUI Brick running NextUI.  The contribution of the screen backlight and WiFi were checked as well.

## Test Configuration

For testing the battery was disconnected completely.  I soldered an 8.87k resistor across the center battery terminal and GND to present a valid thermistor from the "battery". 4V was fed from my bench supply to wires soldered directly to the battery connector on the board.  See setup images below.

- **Voltage Source**: BK Precision 9130 bench power supply (4.0V)
- **Current Measurement**: Brymen 235 multimeter
- **Oscilloscope**: Rigol DS1054Z (for signal capture)
- ***Device***: Trimui Brick NextUI release 4.3.10, device firmware 1.06,board rev 1.0, date code 2024-09-30, wifi disabled, screen backlight minimum
- ***Baseline LED settings***: All LEDs set to 0 brightness, 0 info brightness, static, white, 1000 speed

## Key Findings

### TOP BAR

| Color/Setting     | Current (mA) | Increase from Baseline |
| ----------------- | ------------ | ---------------------- |
| 0%                | 234          | -                      |
| Pure Blue (100%)  | 295          | 61 mA (+26%)           |
| Pure Green (100%) | 295          | 61 mA (+26%)           |
| Pure Red (100%)   | 295          | 61 mA (+26%)           |
| White (100%)      | 417          | 183 mA (+78%)          |
| White (50%)       | 329          | 95 mA (+41%)           |

### L&R LED Performance (White)

| Brightness | Current (mA) | Increase from Baseline |
| ---------- | ------------ | ---------------------- |
| 0%         | 241          | -                      |
| 50%        | 262          | 21 mA (+9%)            |
| 100%       | 282          | 41 mA (+17%)           |

### F1 Key LED Performance (White)

| Brightness | Current (mA) | Increase from Baseline |
| ---------- | ------------ | ---------------------- |
| 0%         | 241          | -                      |
| 50%        | 265          | 24 mA (+10%)           |
| 100%       | 287          | 46 mA (+19%)           |

## Comparative Analysis at Maximum White Brightness

| LED Component | Current Increase |
| ------------- | ---------------- |
| TOP BAR       | 78%              |
| L&R           | 17%              |
| F1 Key        | 19%              |

## LED modes (static, blink, etc.)

Below are images of the current consumption in each of the LED operating modes. All captures were done using the TOP BAR set to 100 brightness, 1000 speed, and white.

Yellow: Input current
Blue: Input voltage
Violet: Input Power (math trace calculated from input voltage * input current)

### Static
![[images/LEDs_topbar_white_static_100_1000 1.png]]

### Blink 1
![[images/LEDs_topbar_white_blink1_100_1000.png]]

### Blink 2
![[images/LEDs_topbar_white_blink2_100_1000.png]]

### Breathe
![[images/LEDs_topbar_white_breathe_100_1000.png]]

### Interval Breathe
![[images/LEDs_topbar_white_interval_breathe_100_1000.png]]

### Linear
![[images/LEDs_topbar_white_linear_100_1000.png]]

### Manually Increasing Static
For the image below I started with all LEDs off, and increased the top bar brightness (white) from 0 to 100 roughly every second.  The peaks are the device registering and processing my button presses, followed by a period where you can see the increased current draw due to the increased LED brightness.
![[images/LEDs_topbar_white_static_step_0_to_100.png]]

## Key Findings 

1. **Linear Brightness Scaling:** For all tested LED configurations (individual colors and white), the current draw scales linearly with the brightness setting.
2. **Color vs. White Current Draw:** Displaying a single pure color (red, green, or blue) at 100% brightness consumes one-third the current of displaying white light at the same brightness.
3. **LED Locations:** The TOP BAR consumes significantly more power than others, with a 78% increase in system current at maximum white brightness. This tracks with how many LEDs it uses vs the other locations.


### Screen Backlight

The increase in system current consumption goes up considerably in the last step.  The additional current draw steps start small and get larger steadily as brightness increases.

|Brightness Step|Current (mA)|Increase from Step 0|
|---|---|---|
|0|241|-|
|1|246|5 mA (+2%)|
|2|250|9 mA (+4%)|
|3|262|21 mA (+9%)|
|4|272|31 mA (+13%)|
|5|288|47 mA (+20%)|
|6|305|64 mA (+27%)|
|7|327|86 mA (+36%)|
|8|351|110 mA (+46%)|
|9|374|133 mA (+55%)|
|10|421|180 mA (+75%)|
![[Pasted image 20250501202518.png]]
### Wi-Fi

Wi-Fi has a relatively small impact on system power consumption:

|Wi-Fi State|Current (mA)|Increase from Off State|
|---|---|---|
|Off|240|-|
|On (Disconnected)|244|4 mA (+2%)|
|On (Connected)|247|7 mA (+3%)|



## Test Setup

![[Pasted image 20250501203401.png]]

Red and Black wires (lower right) are power connection on battery connector.  Orange, Yellow, and black wires going to upper left are hardware serial port.
![[Pasted image 20250501203523.png]]Annotated:
1. Main Regulator (CPU, etc)
2. CPU
3. Memory (it's on the main PCB, behind the USB-C connector on the shoulder button/LED/USB board)
4. 5V boost is on the back side of the board in this area roughly (powers LEDs and most likely usb host port supply as well)
5. Screen backlight supply
![[Pasted image 20250501203600.png]]

Including this one just because I have it, the battery was disconnected and not used for this testing.
![[Pasted image 20250501203759.png]]