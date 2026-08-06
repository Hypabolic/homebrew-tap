class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.13/hypa-osx-x64.tar.gz"
      sha256 "bb68538e72d393322ff68323d38bcaf32c0c43c4b9cc83386e47c9a30e3e4bbd"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.13/hypa-osx-arm64.tar.gz"
      sha256 "cd67fb5047f57fe9134292971a6438d5d227818a0b1e219e0e806426e439214b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.13/hypa-linux-x64.tar.gz"
      sha256 "728d125746e76122e42735de912e2de4016db43d6f862016b6a61bad1066eaae"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.13/hypa-linux-arm64.tar.gz"
      sha256 "9c439c36fa674c5b7918f553c1f2a653fa4ae6b32d3f13fa1b235e91fe5cd9de"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
