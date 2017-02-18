# frozen_string_literal: true
class NewsWeeksController < ApplicationController
  before_action :set_news_week, only: [:show]

  def index
    @news_weeks = NewsWeek.all

    render json: @news_weeks
  end

  def show
    render json: @news_week
  end

  private

  def set_news_week
    @news_week = NewsWeek.find(params[:id])
  end
end
