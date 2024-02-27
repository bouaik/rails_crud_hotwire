class ApexController < ApplicationController
  def index
    @data = [30,40,35,50,49,60,70,91,20]

    @categories = [1990,1991,1992,1993,1994,1995,1996,1997, 1998, 1999]
  end


  def update
    puts "///////////////////////////////////////////////"
    puts params
    puts "///////////////////////////////////////////////"
    @data = [100, 200, 300, 100, 200, 700, 400, 700, 900, 10]

    @categories = [ 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 ]


    Turbo::StreamsChannel.broadcast_replace_to :apex, target: "pie_chart", partial: 'apex/updated_data', locals: { data: @data, categories: @categories }
  end
end
