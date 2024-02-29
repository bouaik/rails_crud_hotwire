class ApexController < ApplicationController
  def index
    @data = Application.pluck(:count)

    @categories = Application.pluck(:year)
  end


  def update

     if params[:id].to_i == 20
      @data = [30,40,35,50,49,60,70,91,20]

      @categories = [1990,1991,1992,1993,1994,1995,1996,1997, 1998, 1999]
     else
      @data = [100, 200, 300, 100, 200, 100, 0, 200, 70, 10]

      @categories = [ 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 ]
     end



    Turbo::StreamsChannel.broadcast_replace_to :apex, target: "pie_chart", partial: 'apex/updated_data', locals: { data: @data, categories: @categories }
  end
end
