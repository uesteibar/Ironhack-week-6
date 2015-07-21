class SpeedTester
  def test_code
    t1 = Time.now
    yield
    puts Time.now - t1
  end
end
