require 'rubygems'
require 'serialport'

class Flipper

  def initialize
    @sp = SerialPort.new("/dev/ttyUSB0", 9600, 8, 1, SerialPort::NONE)
    @on = false
  end

  def flip
    switch = @on ? :off : :on 
    self.send(switch)
  end

  def on
    @sp.putc(1) unless @on
    @on = true
  end

  def off
    @sp.putc(0) if @on
    @on = false
  end

end
