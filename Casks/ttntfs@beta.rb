cask "ttntfs@beta" do
  version "0.5.0-beta.1"
  sha256 "be6406b8c9ea0c84913674f11b3427cea5c583a73661183a96530e40d4d2da63"

  url "https://github.com/dr-kbadawi/ttntfs/releases/download/v#{version}/TT-NTFS-Native-#{version}.dmg"
  name "TT NTFS Native (beta)"
  desc "NTFS read/write driver with no kernel extension, built on FSKit"
  homepage "https://ntfs.techtag.ch/"

  # Betas are GitHub pre-releases, which the GitHub release strategies skip,
  # so this reads the tags. Release tags match too, so once a version is out
  # the beta cask can follow it.
  livecheck do
    url "https://github.com/dr-kbadawi/ttntfs.git"
    regex(/^v?(\d+(?:\.\d+)+(?:[._-]beta[._-]?\d+)?)$/i)
  end

  conflicts_with cask: "ttntfs"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "TT NTFS Native.app"

  uninstall quit:       "ch.techtag.ntfs",
            login_item: "TT NTFS Native"

  zap trash: [
    "~/Library/Group Containers/group.ch.techtag.ntfs",
    "~/Library/Preferences/ch.techtag.ntfs.plist",
  ]

  # The FSKit extension is enabled by the app itself, because the System
  # Settings switch does not work for third-party modules on macOS 26. On
  # macOS 27 the app needs Full Disk Access for that, and opens the switch
  # otherwise. Nothing Homebrew can do replaces that first launch.
  caveats <<~EOS
    This is a beta of the next release. The stable cask is ttntfs.

    Open TT NTFS Native once and press "Enable Extension". After that, NTFS
    disks mount read/write in Finder.

    On macOS 27 the app can turn the extension on itself only with Full Disk
    Access. Without it, "Enable Extension" opens System Settings: turn
    TT NTFS Native on under By Category > File System Extensions there.

    If a disk mounts read-only, the menu bar item says why and offers the fix.
  EOS
end
