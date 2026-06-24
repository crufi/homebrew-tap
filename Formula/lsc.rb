class Lsc < Formula
  include Language::Python::Shebang

  desc "Adds a per-file comment column to eza listings"
  homepage "https://github.com/crufi/eza-comments"
  url "https://github.com/crufi/eza-comments/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e5e6af5c3c9becbfee37906f48aa0f3944cfd515950ca21a7862d0e7097169f0"
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

