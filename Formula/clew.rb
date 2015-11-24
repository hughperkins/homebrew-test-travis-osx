class Clew < Formula
  desc "CLEW"
  homepage "https://github.com/hughperkins/clew"
  url "https://github.com/hughperkins/clew/archive/hughperkins_v1.0.0.tar.gz"
  sha256 "e93d0eb1ab6ecdd08b9e79ef5e39b4370518d51ae1d62f4f826b92e5b4909d07"
  depends_on "cmake"

  def install
    pwd = Pathname.pwd
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "-DBUILD_SHARED_LIBRARY=ON", "-DBUILD_TESTS=ON", "..", *std_cmake_args
      system "make", "-j", "4"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/clewTest"
  end
end
