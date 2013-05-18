require 'net/denon/constants'
require 'net/denon/loggable'

module Net ; module Denon

  class State
    include Constants
    include Loggable

    attr_reader :master_volume
    
    attr_reader :master_volume_max
    
    attr_reader :input_source
    
    attr_reader :channel_volume
    
    attr_reader :record_source

    attr_reader :dynvol
  
    attr_reader :dyneq
  
    attr_reader :multeq
  
    def initialize
      @channel_volume = Hash.new
      @standby        = nil
      @mute           = nil
    end

    def standby?
      debug {"@standby = #{@standby}"}
      @standby
    end

    def on?
      ! @standby
    end

    def mute?
      @mute
    end
  
    def main_zone_on?
      @main_zone
    end

    def update(response)
      debug {"response = #{response}"}
      response.each("\r") do |r|
        case command(r)
        when POWER
          update_power(r)
        when MASTER_VOLUME
          update_master_volume(r)
        when CHANNEL_VOLUME
          update_channel_volume(r)
        when MUTE
          update_mute(r)
        when INPUT_SOURCE
          update_input_source(r)
        when MAIN_ZONE
          update_main_zone(r)
        when RECORD_SOURCE
          update_record_source(r)
        when DYNVOL
          update_dynvol(r)
        when DYNEQ
          update_dyneq(r)
        when MULTEQ
          update_multeq(r)
        end
      end
    end

    private

    def update_power(r)
      @standby = (parameter(r) == "STANDBY")
    end

    def update_master_volume(r)
      p = parameter(r)
      if p.length == 2 then
        @master_volume = p.to_i
      else
        @master_volume_max = p[-2..-1].to_i
      end
    end

    def update_dynvol(r)
      dv = parameter(r)
      case (dv)
      when "HEV"
         @dynvol = :heavy
      when "MED"
         @dynvol = :medium
      when "LIT"
         @dynvol = :light
      when "OFF"
         @dynvol = :off
      end
    end

    def update_dyneq(r)
      deq = parameter(r)
      case (deq)
      when "ON"
         @dyneq = :on
      when "OFF"
         @dyneq = :off
      end
    end

    def update_multeq(r)
      meq = parameter(r)
      @multeq = meq.downcase()
    end

    def update_channel_volume(r)
      re = /^([A-Z]+) (\d\d)(\d?)$/
      md = re.match(parameter(r))
      vol = md[2].to_i
      case (md[1])
      when "FL"
        @channel_volume[:front_left] = vol
      when "FR"
        @channel_volume[:front_right] = vol
      when "C"
        @channel_volume[:center] = vol
      when "SW"
        @channel_volume[:subwoofer] = vol
      when "SL"
        @channel_volume[:surround_left] = vol
      when "SR"
        @channel_volume[:surround_right] = vol
      when "SBL"
        @channel_volume[:surround_back_left] = vol
      when "SBR"
        @channel_volume[:surround_back_right] = vol
      when "SB"
        @channel_volume[:surround_back] = vol
      end
    end

    def update_mute(r)
      @mute = (parameter(r) == "ON")
    end

    def update_input_source(r)
        @input_source = parameter(r)
    end
  
    def update_main_zone(r)
      @main_zone = (parameter(r) == "ON")
    end
  
    def update_record_source(r)
        @record_source = parameter(r)
    end
  
    def command(r)
      if r[0, 2] != "PS"
         r[0, 2]
      elsif r.count(":") > 0
         r.split(":")[0]
      else
         r.split()[0]
      end
    end

    def parameter(r)
      if r[0, 2] != "PS"
         r[2, r.length-3]
      elsif r.count(":") > 0
         r.split(":")[1]
      else
         r.split()[1]
      end
    end

    def to_s
     string = ''
     string += "standby: #{@standby}\n" 
     string += "mute: #{@mute}\n"
     string += "master volume: #{@master_volume}\n"
     #string += "master max volume: #{@master_max_volume}\n"
     string += "input source: #{@input_source}\n"
     string += "multi-eq: #{@multeq}\n"
     string += "dynamic volume: #{@dynvol}\n"
     string += "dynamic eq: #{@dyneq}\n"
     #string += "main zone: #{@main_zone}\n"
     #string += "record source: #{record_source}\n"
    end
  end
end ; end
