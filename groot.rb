# groot.rb
class Groot < Formula
  desc "A tool to generate a comprehensive overview of a codebase for LLMs"
  homepage "https://github.com/harsh-apk/groot" # Your project's GitHub URL
  version "1.0.0-beta" # This must match your release tag

  # Define different URLs and checksums for different CPU architectures
  if Hardware::CPU.intel?
    url "https://github.com/Harsh-apk/groot/releases/download/v1.0.0-beta/groot-darwin-amd64.tar.gz"
    sha256 "1e78795c3b0163ab5b54e0e804aeaab54e07e84a559c0bfc64075fa252c06315" # Replace with the actual SHA256
  else
    url "https://github.com/Harsh-apk/groot/releases/download/v1.0.0-beta/groot-darwin-arm64.tar.gz"
    sha256 "85ee9343040214f3292349ee56ba3b7a5bbbf7207fd82bc31fa0865e8f2dd4a0" # Replace with the actual SHA256
  end

  def install
    # The installation process is simple: just put the binary into the right place.
    # Homebrew will handle the rest.
    # We also rename the binary to just "groot" for simplicity.
    if Hardware::CPU.intel?
      bin.install "groot-darwin-amd64" => "groot"
    else
      bin.install "groot-darwin-arm64" => "groot"
    end
  end

  # Optional: A simple test to run after installation to verify it works
  test do
    system "#{bin}/groot", "about" # Assumes you add a about flag
  end
end