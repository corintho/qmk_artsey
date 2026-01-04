# Changelog

## [1.1.0] - 2026-01-03

Added white LED flashing on the Liatris variation when activating the shift mode.

## [1.0.2] - 2026-01-02

Slightly smaller builds.

Does not change any functionality.

## [1.0.1] - 2026-01-01

Smaller builds with the same functionality.

Fixed the ordering of the RGB color on the liatris LED to match the order of the layers on the keyboard.

Red - Alt
Green - GUI (Windows / Linux / Mac)
Blue - Control

## [1.0.0] - 2025-12-27

Initial release

The `artsey_io_left.uf2` firmware is a direct mapping of the official *beta 0.9* on [artsey.io](https://artsey.io/#beta-090).

The `artsey_io_liatris.uf2` firmware is also a direct mapping of the official *beta 0.9* mapping, but with the addition of using the on-board RGB LED as an indicator of current active modifiers, and using the power indicator to signal a move to the navigation layer.

They are directly mapped to the RGB channels for now:
Red - Control
Green - Alt
Blue - GUI (Windows / Linux / Mac)

The power LED remains ON until you switch into the navigation layer. At that moment, it turns OFF until you exit it.
