require 'pathname'
require 'date'

class Note

  ##
  # create a new note object
  # it can be created eaither with a file path or a date object
  def initialize args = {}
    args.is_a? Hash or raise ArgumentError.new "must provide a hash"
    (!!args[:date] ^ !!args[:file]) or raise ArgumentError.new "must provide a date OR a file you may not provide both"
    args[:date].is_a? Date or raise ArgumentError.new "date must be a date object got #{args[:date].class}" if args[:date]

    args[:notes_location] ||= "/home/dcfedde/Documents/Notes"
    args[:file] ||= "#{args[:notes_location]}/#{args[:date].strftime("%A %B %d %Y")}"

    @date = args[:date]
    @file = Pathname args[:file]
  end

  def date
    @date ||= Date.strptime(@file.split("/").last, "%A %B %d %Y")
  end

  def compleated_tasks
    return [] unless @file.exist?
    File.readlines(@file).map do |line|
      if line =~ /DONE/ .. line =~ /NOTES/
        line unless line =~ /(DONE|NOTES)/
      end
    end.compact
  end

  def time_worked
   return nil unless @file.exist?
   round_to_quarter(sum_time(times).to_f)
  end

  class << self

    def for week
      [*week].map{ |day| Note.new(date: day) }
    end

  end

  private

  def times
    File.readlines(@file).map do |line|
      line.match(/⌚\s+(\w+)\s+(\d+:\d+)/)[1,2] if line =~ /⌚/
    end.compact
  end

  def find_saterday_before day
    day.wday == 6 ? day : find_saterday_before(day -= 1)
  end

  def time_to_int time
    ts = time.split ?:
    t = 0
    t += ts[0].to_i
    t += (ts[1].to_i/60.0).to_r
  end

  def sum_time times
    times.inject(0) do |m, entry|
      case entry[0]
      when "in"
        next (m - time_to_int(entry[1]))
      when "out"
        next m + time_to_int(entry[1])
      else
        raise "not a valid time"
      end
    end
  end

  def round_to_quarter num
    (num * 4).round / 4.0
  end

end

if __FILE__ == $0
  describe Note do
    let(:note){Note.new(file: "file")}

    describe "#find_saterday_before" do
      let    ( :day      ) { Date.new( 2001,2,5 )                  }
      subject( :saterday ) { note.send(:find_saterday_before, day) }

      it "get a saterday" do
        expect(saterday.wday).to eql 6
      end

      it "it comes before the day given" do
        expect(saterday).to be < day
      end

      it "it comes less then a week before the day given" do
        expect(saterday).to be > day - 7
      end
    end
  end
end
