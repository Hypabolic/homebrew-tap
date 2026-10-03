class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.3"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.3/hypa-osx-x64.tar.gz"
      sha256 "3d5bb04b9baeabfb0ac39a0d772ce711bce128a459e7395f4377564a7e569355"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.3/hypa-osx-arm64.tar.gz"
      sha256 "acc0adc1e85686497c14871b81d95f5bdad6ed78d607218f9769ac74028ff0e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.3/hypa-linux-x64.tar.gz"
      sha256 "9d49adb059f989eef891166d75e808a620aa3f59d052ea0ea694db33643977ff"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.3/hypa-linux-arm64.tar.gz"
      sha256 "ebb3c19044ba4c9856e2d5e9ada85273da7e48650dcbd33cc19f2729e29403ca"
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
