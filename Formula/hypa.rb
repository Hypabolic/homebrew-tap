class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.2.0"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.2.0/hypa-osx-x64.tar.gz"
      sha256 "7e40059312d31986cd38879bc5ee1cd50a2fccacff4d098b073f79b98fd94ab8"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.2.0/hypa-osx-arm64.tar.gz"
      sha256 "0d10a92d34a1aa745fbce2590097a3329d96a1e236c455f0f69aacc10375f814"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.2.0/hypa-linux-x64.tar.gz"
      sha256 "fade795604d285beaae413c521b946b34d9d0ff8d3fc114be61ee75271035502"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.2.0/hypa-linux-arm64.tar.gz"
      sha256 "a6b8c84d7a1ac19007a049438188a2dff53f4b90adf5f43aa94d00eb62dbb4e9"
    end
  end

  # The release archive is a self-contained directory. hypa finds hypa-attach,
  # hypa-runtime, hypa-pty-host, libghostty-vt and the native libraries next to
  # its own executable, so keep them together in libexec and link only hypa.
  # The binaries are prebuilt and signed by the release pipeline; relinking
  # them would invalidate the signatures.
  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"hypa"
  end

  test do
    %w[hypa hypa-attach hypa-annotate hypa-runtime hypa-pty-host].each do |program|
      assert_predicate libexec/program, :executable?
    end
    assert_predicate libexec/shared_library("libghostty-vt"), :exist?
    assert_predicate libexec/shared_library("libe_sqlite3"), :exist?

    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
