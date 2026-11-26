# Homebrew tap for TT NTFS Native

NTFS read/write for macOS with no kernel extension. Free and open source.

    brew tap dr-kbadawi/ttntfs
    brew trust dr-kbadawi/ttntfs      # Homebrew 6 asks this once for third-party taps
    brew install --cask ttntfs

Then open **TT NTFS Native** once and press **Enable Extension**. On macOS 27
the button reads **Open System Settings**; turn TT NTFS Native on there under
**By Category → File System Extensions**.

Requires macOS 26 (Tahoe) or later on Apple Silicon, with the native Apple
Silicon Homebrew (`/opt/homebrew`). An Intel Homebrew running under Rosetta
will refuse the cask, which is correct: the app is arm64-only.

When there is a beta of the next version, it is the `ttntfs@beta` cask. It
installs the same app, so one replaces the other:

    brew uninstall --cask ttntfs
    brew install --cask ttntfs@beta

To go back, swap the two names. What a beta changes is on the
[releases page](https://github.com/dr-kbadawi/ttntfs/releases).

To remove everything, including settings:

    brew uninstall --cask --zap ttntfs

Website: https://ntfs.techtag.ch/ · Source: https://github.com/dr-kbadawi/ttntfs
