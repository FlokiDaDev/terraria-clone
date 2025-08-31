# 🌱 Terraria Clone (Learning Project)

![C++23](https://img.shields.io/badge/C%2B%2B-23-blue.svg?style=flat&logo=c%2B%2B) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) ![Build System](https://img.shields.io/badge/build-Premake5%20%7C%20VS2022-brightgreen.svg)

A lightweight **Terraria-inspired clone** built in **C++23** using **OpenGL** and **GLFW**.
This project serves as a hands-on way to explore **graphics programming** and **game engine architecture**.

Inspired by [TheCherno’s Game Engine series](https://youtube.com/playlist?list=PLlrATfBNZ98dC-V-N3m0Go4deliWHPFwT&si=ZCR5-iKJd1afBkNo)
📺 [YouTube](https://www.youtube.com/@TheCherno) · 💻 [GitHub](https://github.com/TheCherno)
---

## ✨ Features
- Written in **modern C++23**
- Uses **OpenGL 4.6 CORE** via **GLAD**
- Project generation with **Premake5** for **Visual Studio 2022 (x64)**
- Clean project structure:
-  `engine` → static library containing all core functionality + application entrypoint
-  `app` → the actual Terraria-style game (links against `engine`)
- Designed for **“Show All Files”** mode in Visual Studio for transparent project structure
- Multi-processor compilation enabled for faster builds
- Currently only supports Windows
- Built with eventual cross-platform support
---

## 📦 Dependencies
Installed via [vcpkg](https://github.com/microsoft/vcpkg) (`x64-windows-static` triplet recommended, modifications needed otherwise):
-  `glad[gl-api-46,gl-core]`
-  `glfw3`
-  `fmt`
-  `spdlog`
---

## ⚙️ Vcpkg Setup
Recommended installation directory: `C:\dev\vcpkg`(change vcpkg_root in engine\premake5.lua & app\premake5.lua)
*Make sure the **VCPKG_ROOT** environment variable is set after installation (required by the provided Premake5 scripts).

```bat
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg && bootstrap-vcpkg.bat
.\vcpkg.exe integrate install
```

## 📚 Install required libraries
```bat
vcpkg install glad[gl-api-46,gl-core]:x64-windows-static
vcpkg install glfw3:x64-windows-static
vcpkg install spdlog:x64-windows-static
```
*Installing spdlog will automatically install fmt
  
## 📌 Notes
- For glad, I used the vcpkg feature notation glad[gl-api-46,gl-core] which matches OpenGL 4.6 CORE profile.
- This assumes you already have VCPKG_ROOT correctly set in your environement variables (should be automatic when installing vcpkg)

## 📃 License
```
MIT License

Copyright (c) 2025 FlokiDaDev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```