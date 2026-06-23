class Lsc < Formula
  include Language::Python::Shebang

  desc "eza listing with an aligned per-file comment column"
  homepage "https://github.com/crufi/eza-comments"
  url "https://github.com/crufi/eza-comments/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "eza"
  depends_on "python@3.13"

  def install
    bin.install "lsc.py" => "lsc"
    rewrite_shebang detected_python_shebang, bin/"lsc"   # point #!/env python3 at brew's python
    pkgshare.install "lsc.sh"                            # -> <prefix>/share/lsc/lsc.sh
  end

  def caveats
    <<~EOS
      Icons need a Nerd Font installed in your terminal.

      Optional shell helpers (setcomm/rmcomm/getcomm) — add to your shell rc:
        source #{opt_pkgshare}/lsc.sh
    EOS
  end

  test do
    assert_match "lsc #{version}", shell_output("#{bin}/lsc --version")
  end
end