class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.4/hypa-osx-x64.tar.gz"
      sha256 "4dd3229ffed9d62430944fcfba95e4255024d11bc43450e8a68c1bfd89bbd574"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.4/hypa-osx-arm64.tar.gz"
      sha256 "2eddb600edfe37a75390d82be4c88570cb0e82804e136998b9dc9fb9a7388f95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.4/hypa-linux-x64.tar.gz"
      sha256 "a82d5a8e9ce0c5f86ad0341c43301b4ff61821128b8dfd783f60fd4fc87fcb78"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.4/hypa-linux-arm64.tar.gz"
      sha256 "7a2c51e949ee58fd2760746e7f86773b2df9f0ca4e729089150b9607a51da4b6"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
