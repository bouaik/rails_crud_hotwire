class HighchartsController < ApplicationController
  def index
    @name = "Year 1990"
    @data = [631, 727, 3202, 721]
  end


  def update
    if params[:id].to_i == 1990
      @name = "Year 1990"
      @data = [631, 727, 3202, 721]
    elsif params[:id].to_i == 2010
      @name = "Year 2000"
      @data = [814, 841, 3714, 726]
    else
      @name = "Year 2010"
      @data = [1276, 1007, 4561, 746]
    end

   Turbo::StreamsChannel.broadcast_replace_to :high, target: "high_chart", partial: 'highcharts/updated_data', locals: { name: @name, data: @data }
 end
end
