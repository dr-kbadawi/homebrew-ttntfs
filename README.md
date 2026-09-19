# Homebrew tap for TT NTFS Native

NTFS read/write for macOS with no kernel extension. Free and open source.

    brew tap dr-kbadawi/ttntfs
    brew trust dr-kbadawi/ttntfs      # Homebrew 6 asks this once for third-party taps
    brew install --cask ttntfs

Then open **TT NTFS Native** once and press **Enable Extension**.

Requires macOS 26 (Tahoe) or later on Apple Silicon, with the native Apple
Silicon Homebrew (`/opt/homebrew`). An Intel Homebrew running under Rosetta
will refuse the cask, which is correct: the app is arm64-only.

To remove everything, including settings:

    brew uninstall --cask --zap ttntfs

Website: https://ntfs.techtag.ch/ · Source: https://github.com/dr-kbadawi/ttntfs
