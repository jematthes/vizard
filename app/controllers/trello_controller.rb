class TrelloController < ApplicationController
  def index
    # find myself
    me = Trello::Member.find("marcelaugsburger")

    # find first board
    @board = me.boards.first
    # puts board.name
    # puts "Lists: #{board.lists.map {|x| x.name}.join(', ')}"
    # puts "Members: #{board.members.map {|x| x.full_name}.join(', ')}"
    # board.cards.each do |card|
    #   puts "- \"#{card.name}\""
    #   puts "-- Actions: #{card.actions.nil? ? 0 : card.actions.count}"
    #   puts "-- Members: #{card.members.count}"
    #   puts "-- Labels: #{card.labels.count}"
      # end
  end
end
