class Message
  def initialize(number = nil, message = "call placed")
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
    @call = @client.account.calls.create({:from => @my_number, :to => "+1#{@number}"}, :url =>)
  end

  def get_received_messages
    @allmessages = @client.account.sms.messages.list
    @received_messages = []
    @allmessages.each do |message|
      @received_messages << message if message.to == @my_number
    end
    @received_messages
  end

  def get_sent_messages
    @allmessages = @client.account.sms.messages.list
    @sent_messages = []
    @allmessages.each do |message|
      @sent_messages << message if message.from == @my_number
    end
    @sent_messages
  end

end


