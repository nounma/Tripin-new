class ProcessAnswer
  def initialize(answer, challenge)
    @answer = answer
    @challenge = challenge
  end

  def process

    if @challenge.answer_auto?
      if @answer.text == @challenge.good_answer
        @answer.completed!
      else
        @answer.not_completed!
      end
    # else
    #   @answer.pending!
    # end

  end
end
