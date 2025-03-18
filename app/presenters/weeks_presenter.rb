class WeeksPresenter
  def days
    (start_of_week..end_of_week).to_a
  end

  def post_by_days
    posts
      .select { |e| days.include?(e.created_at) }
      .group_by { |e| e.created_at.to_date.cwday }
  end

  private

  attr_reader :date, :posts

  def initialize(date: Date.today, posts: [])
    @date = date
    @posts = posts
  end

  def start_of_week
    date - date.cwday.days
  end

  def end_of_week
    start_of_week + 6
  end
end
