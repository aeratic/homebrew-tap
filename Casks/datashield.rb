cask "datashield" do
  version "0.1.0"
  sha256 "ba6b3ebee064c7d9166ab0f803ce8445e24e0f93364e4461681a4cb360c03810"

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
