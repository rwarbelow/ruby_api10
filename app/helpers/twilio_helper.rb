class Message
  def initialize(number, message = "call placed")
    @client = Twilio::REST::Client.new('AC153ccfc825f37dc1e598b5e65b1b774c', '3090f0831d0ee9fc0191f4daaf8bb232')
    @my_number = '+17027124186'
    @number = number
    @message = message
  end

	def send
		@client.account.sms.messages.create(:from => @my_number, :to => "+1#{@number}", :body => @message)
    SentMessage.create(phone_number: @number, message: @message)
	end

  def call
    @client.account.calls.create(:from => @my_number, :to => "+1#{@number}")
  end

end


