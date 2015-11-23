class Easycl < Formula
  desc "EasyCL formula, adapted from Edward Geist's DeepCL formula"
  homepage "https://github.com/hughperkins/test-travis-osx"
  url "https://github.com/hughperkins/clew/archive/1d2752564b6af98d24127cdb2d573d3f9ac98f02.tar.gz"
  sha256 "3793f8ed9ce5b0fcd4bf8581e1bb1fb76f1e24a70fea17044ae86bdb24593b66"
  depends_on "jpeg"
  depends_on "cmake"

  def install
    pwd = Pathname.pwd
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make", "-j", "4"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/clewTest"
  end
end
