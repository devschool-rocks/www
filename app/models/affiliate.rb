Affiliate = Struct.new(:name, :domain, :email, :code, :discount, :referral, :ga_code) do

  AFFILIATES = [
    new("CourseReport", "coursereport.com",
        "liz@coursereport.com", "coursereport",
        200, 0, '')
  ]

  def self.find_by_code(code)
    AFFILIATES.select{|a| a.code == code}[0]
  end
end
