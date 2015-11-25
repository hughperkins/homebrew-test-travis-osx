class Clblas < Formula
  desc "clBLAS"
  homepage "https://github.com/clMathLibraries/clBLAS"
  url "https://github.com/clMathLibraries/clBLAS/archive/57e1e65c05c9521e02d432d339547bb107c56153.zip"
  sha256 "8b3036d2373f745b1338e821cfcf2b28d87c27fcf5a704821d47a65fb457f338"

  depends_on "cmake" => :build

  def install
    pwd = Pathname.pwd
    cd "src" do
      mkdir "build" do
        system "cmake", "-G", "Unix Makefiles", "-DBUILD_KTEST=OFF", "-DBUILD_TEST=OFF", "-DCORR_TEST_WITH_ACML=OFF", "..", *std_cmake_args
        system "make", "-j", "4"
        system "make", "install"
      end
    end
  end

  test do
    # system "#{bin}/deepcl_unittests"
  end
end

