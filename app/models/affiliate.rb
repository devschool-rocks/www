Affiliate = Struct.new(:name, :domain, :email, :code, :discount, :referral, :ga_code) do

  AFFILIATES = [
#   new("LearnToCodeWithMe", "learntocodewith.me",
#       "laurencebradford3@gmail.com", "learntocodewithme",
#        197, 303, 'UA-42087016-3')
  ]

  def self.find_by_code(code)
    AFFILIATES.select{|a| a.code == code}[0]
  end
end
