Affiliate = Struct.new(:name, :domain, :email, :code, :discount, :referral) do

  AFFILIATES = [
    new("LearnToCodeWithMe", "learntocodewith.me", "laurencebradford3@gmail.com", "learntocodewithme", 300, 400)
  ]

  def self.find_by_code(code)
    AFFILIATES.select{|a| a.code == code}[0]
  end
end
