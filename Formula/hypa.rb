class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.1/hypa-osx-x64.tar.gz"
      sha256 "1ec5241258aa06601a5fe7eb2017db5294fecc377fe364231e05395f8416fdcb"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.1/hypa-osx-arm64.tar.gz"
      sha256 "2d8d1846ed5eddf62a7cb4bbf7a50db72c273a25a4c02562b05cf1ff136a9016"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.1/hypa-linux-x64.tar.gz"
      sha256 "c2c556831495427b45a4e0bed0a8e6a64c1dbbdf32b09ea0ed3120bf3550c3c6"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.1/hypa-linux-arm64.tar.gz"
      sha256 "fd3c6765e944d382d82a3fb88b81263c1096f38f4b13a89528ce14f5a20d8d38"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
