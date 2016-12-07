module ChallengesHelper
  def bad_answers(challenge)
    challenge.bad_answers.split(",").map(&:strip)
  end
end
