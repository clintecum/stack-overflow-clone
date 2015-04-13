class VotesController < ApplicationController
  before_filter :find_voteable

  def create
    @question = Question.find_by(id: params)
    @vote = current_user.votes.build(params[:votes])
    if @vote.save

    else

    end

  end

  def update
    @vote = current_user.votes.find_by(voteable_type: @klass, voteable_id: @voteable)
    if @vote
      @vote.update_attributes()
    end

    def destroy

    end

    private
    def find_voteable
      @klass = params[:voteable_type].capitalize.constantize
      @voteable = klass.find(params[:voteable_id])
    end
  end
end
