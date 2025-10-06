# AVR Assembly – PWM LED Control

This project contains pure AVR Assembly code for ATmega328P (Arduino Uno), which generates a PWM signal on pin PD6 (Arduino Pin 6).

## 🔧 Instructions

The workflow builds the `.hex` file from `pwm_led.asm` using GitHub Actions.

## 📦 Output

After push, download the compiled `pwm_led.hex` from the Actions tab and flash it to your Arduino.

## 💡 Details
- **PWM Mode**: Fast PWM (Timer0)
- **Duty Cycle**: 75%
- **Output Pin**: PD6 / OC0A

MSP 2025 ✨
