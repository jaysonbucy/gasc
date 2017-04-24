class SwimmerDetailPresenter
  attr_reader :swimmer

  def initialize(swimmer)
    @swimmer = swimmer
  end

  def best_swim_times(event)
    best25 = SwimTime.best_time(event, swimmer.id, 25).first
    best50 = SwimTime.best_time(event, swimmer.id, 50).first
    best100 = SwimTime.best_time(event, swimmer.id, 100).first
    best200 = SwimTime.best_time(event, swimmer.id, 200).first
    best400 = SwimTime.best_time(event, swimmer.id, 400).first
    best800 = SwimTime.best_time(event, swimmer.id, 800).first
    {
      25 => best25 ? best25.time_in_seconds : "no time",
      50 => best50 ? best50.time_in_seconds : "no time",
      100 => best100 ? best100.time_in_seconds : "no time",
      200 => best200 ? best200.time_in_seconds : "no time",
      400 => best400 ? best200.time_in_seconds : "no time",
      800 => best800 ? best200.time_in_seconds : "no time"
    }
  end

  def swim_meet_times(from, to)
    SwimTime
      .includes(event_heat: [:swim_meet, :swim_event])
      .joins(event_heat: [:swim_meet, :swim_event])
      .joins(:swimmer_detail)
      .where(swim_meets: { date: [from..to] })
      .where(swimmer_details: { id: swimmer.id })
  end
end
