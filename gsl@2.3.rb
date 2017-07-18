class GslAT23 < Formula
  desc "Numerical library for C and C++"
  homepage "https://www.gnu.org/software/gsl/"
  url "https://ftp.gnu.org/gnu/gsl/gsl-2.3.tar.gz"
  mirror "https://ftpmirror.gnu.org/gsl/gsl-2.3.tar.gz"
  sha256 "562500b789cd599b3a4f88547a7a3280538ab2ff4939504c8b4ac4ca25feadfb"

  bottle do
    root_url "https://github.com/ajm-asiaa/bottles-repo/raw/master"
    cellar :any
    sha256 "03d401c347959955651b087bf0540ff210f4ccc3ba21208c9e1a1435ca1a6c61" => :el_capitan
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make" # A GNU tool which doesn't support just make install! Shameful!
    system "make", "install"
  end

  test do
    system bin/"gsl-randist", "0", "20", "cauchy", "30"
  end
end

