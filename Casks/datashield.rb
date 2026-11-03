cask "datashield" do
  version "0.1.1"
  sha256 "9a7d8c09457fbbb59fc76b16aedcc815971a19e0629ae1406d348215eeae5949"

  url "https://github.com/aeratic/DataShield/releases/download/v#{version}/DataShield-TUI-macos-aarch64.dmg"
  name "DataShield"
  desc "Password manager that lives in your terminal"
  homepage "https://datashield.aeratic.com"

  depends_on arch: :arm64

  app "DataShield.app"

  zap trash: [
    "~/Library/Application Support/datashield",
    "~/.config/datashield",
  ]
end
