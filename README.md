# r_progressBar

A modern FiveM progress bar script that uses a combination of Lua and NUI (HTML/JavaScript/CSS) to display a customizable progress bar. This script exports the `ShowProgressBar` function so you can easily display the progress bar from any other resource.

---

## Features

- **Customizable Progress Bar:** Display with a duration, title, and description.
- **Exportable Function:** Easily call the progress bar with a simple Lua export.
- **Obfuscated JavaScript:** Protect our secret animation algorithms (and give you a cool puzzle to solve).
- **Smooth Animations:** Fade-in/fade-out effects and a success icon when completed.
- **Name Customization:** You can freely change this resource name!

---

## Installation

1. **Download/Clone** the repository and place the `r_progressBar` folder into your FiveM resources directory.
2. Add the following line to your `server.cfg`:
   ```cfg
   ensure r_progressBar

**Only Duration:**
```lua
local success = exports['r_progressBar']:ShowProgressBar(5000)
if success then
    -- Do action after progress bar is finished
end
```

**Duration and Title:**
```lua
local success = exports['r_progressBar']:ShowProgressBar(5000, "Processing")
if success then
    -- Do action after progress bar is finished
end

```

**Everything:**
```lua
local success = exports['r_progressBar']:ShowProgressBar(5000, "Processing", "Performing an important task...")
if success then
    -- Do action after progress bar is finished
end
```

> **Note:** The JavaScript code is intentionally obfuscated. Why? Because our team uses top-secret, state-of-the-art animation algorithms that need to be protected from prying eyes. In other words, we keep our "secret sauce" safe while also giving you a nifty progress bar! (Just joking haha, if you want, you can deobfustate it for free on a online page, I just don't want "pseudodevelopers" to steal code
