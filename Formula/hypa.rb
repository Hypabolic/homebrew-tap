class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.4"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.4/hypa-osx-x64.tar.gz"
      sha256 "4a0389b161a7150443de796942587b2f11b714283fca91aab24897837001ae24"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.4/hypa-osx-arm64.tar.gz"
      sha256 "1804a0966c98e60d0f6088b8194549ed113c750790459c96b069df180ce0cae7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.4/hypa-linux-x64.tar.gz"
      sha256 "cf753727a62460fc3e2515dc4dcd259a5baef38e40a9e3330d76c035a50bf5fe"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.4/hypa-linux-arm64.tar.gz"
      sha256 "9d9d7a9124948c8925ca2cf67a8618603fb10907e9e1ce21f071fb67e9d78e4f"
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
