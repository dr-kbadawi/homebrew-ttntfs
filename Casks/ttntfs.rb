cask "ttntfs" do
  version "0.4.1"
  sha256 "1a4d90309bab95772ea5efefdf069da0f53de5c481b4e3a061b4fc9bd4fad5c4"

  url "https://github.com/dr-kbadawi/ttntfs/releases/download/v#{version}/TT-NTFS-Native-#{version}.dmg",
      verified: "github.com/dr-kbadawi/ttntfs/"
  name "TT NTFS Native"
  desc "NTFS read/write for macOS with no kernel extension, built on FSKit"
  homepage "https://ntfs.techtag.ch/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "TT NTFS Native.app"

  # The FSKit extension is enabled by the app itself, because the System
  # Settings switch does not work for third-party modules on macOS 26. Nothing
  # Homebrew can do replaces that first launch.
  caveats <<~EOS
    Open TT NTFS Native once and press "Enable Extension". After that, NTFS
    disks mount read/write in Finder.

    If a disk mounts read-only, the menu bar item says why and offers the fix.
  EOS

  uninstall quit:       "ch.techtag.ntfs",
            login_item: "TT NTFS Native"

  zap trash: [
    "~/Library/Group Containers/group.ch.techtag.ntfs",
    "~/Library/Preferences/ch.techtag.ntfs.plist",
  ]
end
