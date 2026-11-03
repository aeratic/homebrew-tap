cask "datashield" do
  version "0.1.0"
  sha256 "83fb12873038a04a0f623fdc9822cc1131176410899284cc941a71fe6f88d07a"

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
