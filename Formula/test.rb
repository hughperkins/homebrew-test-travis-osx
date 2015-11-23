class Test < Formula
  desc "test formula"
  homepage "https://github.com/hughperkins/test-travis-osx"
  url "https://github.com/hughperkins/clew/archive/1d2752564b6af98d24127cdb2d573d3f9ac98f02.tar.gz"
  depends_on "jpeg"
  depends_on "cmake"

  def install
    pwd = Pathname.pwd
    mkdir "build2" do
      system "cmake", "-G", "Unix Makefiles", "..", "std_cmake_args"
      system "make", "-j", "4"
    end
  end

  test do
    system "#{bin}/hugh_test"
  end
end
