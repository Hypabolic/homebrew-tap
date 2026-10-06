class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.7"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.7/hypa-osx-x64.tar.gz"
      sha256 "d2ce82262b2da013254faa3678d2d09831145c3a2c49380f423a3e9c4e3d9bc1"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.7/hypa-osx-arm64.tar.gz"
      sha256 "20692e0496689bc508bd2f47e56b7c1cf5219b26da1c37b19975426df06beceb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.7/hypa-linux-x64.tar.gz"
      sha256 "3f5e2bb366fd81362bf0421a0b01821e6f6e8375db823a8dac7c3b1248fb3b2e"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.7/hypa-linux-arm64.tar.gz"
      sha256 "a680538ce2fc726a504849177c75209dd71e2e8324de969f27d851da5734de0d"
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
