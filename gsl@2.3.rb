class GslAT23 < Formula
  desc "Numerical library for C and C++"
  homepage "https://www.gnu.org/software/gsl/"
  url "https://ftp.gnu.org/gnu/gsl/gsl-2.3.tar.gz"
  mirror "https://ftpmirror.gnu.org/gsl/gsl-2.3.tar.gz"
  sha256 "562500b789cd599b3a4f88547a7a3280538ab2ff4939504c8b4ac4ca25feadfb"

  bottle do
    cellar :any
    sha256 "40ac9d17c2ee403d5d967b8f9473f1b43f2fc78f734d02f98b1843528ac65799" => :sierra
    sha256 "b9115718eae20160d6c1166a9ca4261e3a867d019f51907ef0674a45dee9eb9d" => :el_capitan
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

