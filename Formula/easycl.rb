class Easycl < Formula
  desc "EasyCL formula, adapted from Edward Geist's DeepCL formula"
  homepage "https://github.com/hughperkins/test-travis-osx"
  url "https://github.com/hughperkins/EasyCL/archive/v3.0.0.tar.gz"
  sha256 "e38fa777b4ad22e0e48ba3c5ae55bb1ecb81958806207cdeefa78f9901012e3a"
  depends_on "cmake"

  resource "clew" do
    url "https://github.com/hughperkins/clew/archive/hughperkins_v1.0.0.tar.gz"
    sha256 "e93d0eb1ab6ecdd08b9e79ef5e39b4370518d51ae1d62f4f826b92e5b4909d07"
  end

  def install
    pwd = Pathname.pwd
    resource("clew").stage pwd/"thirdparty/clew"
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "-DBUILD_TESTS=ON", "-DDEV_RUN_COG=OFF", "-DUSE_CLEW=ON", "-DPROVIDE_LUA_ENGINE=ON", "..", *std_cmake_args
      system "make", "-j", "4"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/gpuinfo"
    system "#{bin}/easycl_unittests"
  end
end
