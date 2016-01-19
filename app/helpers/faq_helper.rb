module FaqHelper
  def display_faq_question(text)
    "<h4><span>Q.</span>#{text}</h4>"
  end

  def display_faq_answer(text)
    answer = text.split("\n\n")
    [
      "<p><span>A.</span> #{answer[0]}</p>",
      *answer[1..-1].map {|a| "<p>#{a}</p>" }
    ].join
  end
end
