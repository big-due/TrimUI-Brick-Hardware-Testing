# TrimUI Brick: Power Consumption & Thermal Analysis Summary

## Summary

This report summarizes hardware testing of the TrimUI Brick, focusing on power consumption and thermal performance across various operating modes and settings. The testing examined the impact of RGB LEDs, screen brightness, wifi connectivity, and different emulators on battery life and device temperature.

## Device Specifications
- **Battery**: 3000mAh (11.1Wh)
- **CFW**: NextUI 4.3.10, NextUI 4.3.15 (STOCK OS 1.06)
- **Board Revision**: 1.0
- **Board Date Code**: 2024-09-30

## Detailed Test Reports
- [Brick Current Consumption with NextUI](Brick%20Current%20Consumption%20with%20NextUI.md) - Initial testing focusing on RGB LEDs, screen backlight, and wifi
- [Brick Current Consumption Followup](Brick%20Current%20Consumption%20followup.md) - Additional testing on device modes (off, sleep) and various emulators
- [Brick Thermal Testing](Brick%20Thermal%20Testing.md) - Thermal imaging tests across various configurations

## Key Findings

### Power Consumption Impact by Feature

| Feature | Maximum Current Increase | Impact on Battery Life |
|---------|--------------------------|------------------------|
| TOP BAR RGB LEDs | +183mA (+78%) | Major reduction |
| Screen Backlight | +180mA (+75%) | Major reduction |
| L&R RGB LEDs | +41mA (+17%) | Moderate reduction |
| F1 Key RGB LED | +46mA (+19%) | Moderate reduction |
| wifi | +7mA (+3%) | Minimal impact |

### Device Operating Modes

| Mode | Current Draw (mA) | Estimated Battery Life |
|------|-------------------|------------------------|
| Off | 0.057 | Negligible drain |
| Suspended | 6.7 | 18+ days (448 hours) |
| On (screen off) | 213 | 14.1 hours |
| On (screen on, minimum screen brightness) | 232 | 12.9 hours |

### Emulator Performance (LEDs off, minimum screen brightness)

| Emulator | Game | Current Draw (mA) | Estimated Battery Life |
|----------|------|-------------------|------------------------|
| GB | Super Mario Land 2 | 339 (peak) | 8.9 hours |
| GBA | Super Mario Advance 2 | 350 (peak) | 8.6 hours |
| MGBA | Super Mario Advance 2 | 363 (peak) | 8.3 hours |
| GBC | Super Mario Bros. Deluxe | 349 (peak) | 8.6 hours |
| FC (NES) | Super Mario Bros | 376 (peak) | 8.0 hours |
| SFC (SNES) | Super Mario World | 385 (peak) | 7.8 hours |
| SUPA (SNES Alt) | Super Mario World | 400 (peak) | 7.5 hours |

### Thermal Impact (20-minute testing)

| Configuration | Temperature Increase |
|---------------|---------------------|
| Baseline (LEDs off, min screen brightness) | +2.5°C |
| No LEDs, max screen brightness | +4.6°C |
| All LEDs max, min screen brightness | +9.0°C |
| TOP BAR LEDs only, min screen brightness | +7.9°C |
| All LEDs except TOP BAR, min screen brightness | +6.2°C |
| SUPA emulator, no LEDs, min screen brightness | +6.3°C |
| SUPA emulator, max LEDs, max screen brightness | +16.2°C |
| SUPA emulator, 50% LEDs, 50% screen brightness | +11.8°C |
| SUPA emulator, 25% LEDs, 30% screen brightness | +8.4°C |

## Power and Thermal Considerations

### Battery Life Impact
There is a direct relationship beteween increased current consumption and reduced battery life. Users can estimate the impact of their settings on battery life using the percentage increases in current draw:

- A 78% increase in current draw from maximum TOP BAR LED brightness would translate to roughly a 44% reduction in battery life
- A 75% increase from maximum screen brightness would result in approximately a 43% reduction in battery life

### Thermal Behavior
The thermal testing reveals that LED brightness settings can have a more significant impact on device temperature than gaming in some cases. With all LEDs at maximum, the device temperature increased by 9°C after 20 minutes - slightly higher than running SUPA emulator with modest LED and screen brightness.

The TOP BAR LEDs are significant heat contributors, causing a 7.9°C temperature increase on their own at maximum brightness, compared to a 6.2°C increase from all other LEDs combined at maximum brightness. For comparison, running SUPA with LEDs off led to an increase of 6.3°C.

## Suggestions

Based on the thermal and power consumption data, a reasonable configuration for balancing performance, battery life, and thermal management would be:

- LED brightness: 25% or lower (the TOP BAR in particular should be limited)
- Screen brightness: 30% or lower

These should allow having the desired device asthetic while maintaining reasonable battery life and keeping device temperatures comfortable during extended play sessions.


