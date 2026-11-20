cask "ttntfs" do
  version "0.4.2"
  sha256 "e4c1af51a1a1f38250fc9e226cf571be771655ef99b5deabb40dd02e230fa8c7"

  url "https://github.com/dr-kbadawi/ttntfs/releases/download/v#{version}/TT-NTFS-Native-#{version}.dmg"
  name "TT NTFS Native"
  desc "NTFS read/write driver with no kernel extension, built on FSKit"
  homepage "https://ntfs.techtag.ch/"

  livecheck do
    url :url
    strategy :github_latest
  end

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
  # macOS 27 it is the reverse, and the app opens that switch instead. Nothing
  # Homebrew can do replaces that first launch.
  caveats <<~EOS
    Open TT NTFS Native once and press "Enable Extension". After that, NTFS
    disks mount read/write in Finder.

    On macOS 27 the button reads "Open System Settings": turn TT NTFS Native
    on under By Category > File System Extensions there.

    If a disk mounts read-only, the menu bar item says why and offers the fix.
  EOS
end
