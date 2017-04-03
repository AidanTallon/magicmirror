describe Message do
  let(:test_data) { @test_data = YAML.load_file './spec/test_data/message_data.yml' }
  let(:message) { @message = Message.new test_data }
  it 'should initialize with a hash of messages' do
    expect(message.messages).to eq test_data
  end

  it 'should return a generic/morning specific message between 5am and 11:59am' do
    messages_returned = []
    10.times do
      hour = rand(5) + 6
      minute = rand(60)
      Timecop.freeze(DateTime.parse("12/12/12 #{hour}:#{minute}am")) do
        messages_returned << message.get
      end
    end
    expect(messages_returned).to include *test_data['morning']
    expect(messages_returned).to include *test_data['generic']
  end

  it 'should return a generic/afternoon specific message between 12pm and 5:30pm' do
    messages_returned = []
    10.times do
      hour = rand(6)
      minute = rand(31)
      Timecop.freeze(DateTime.parse("12/12/12 #{hour}:#{minute}pm")) do
        messages_returned << message.get
      end
    end
    expect(messages_returned).to include *test_data['afternoon']
    expect(messages_returned).to include *test_data['generic']
  end

  it 'should return a generic/evening specific message between 5:31pm and 3am' do
    messages_returned = []
    5.times do
      hour = rand(7) + 5
      minute = rand(32) 
      Timecop.freeze(DateTime.parse("12/12/12 #{hour}:#{minute}pm")) do
        messages_returned << message.get
      end
    end
    5.times do
      hour = rand(3)
      minute = rand(60)
      Timecop.freeze(DateTime.parse("12/12/12 #{hour}:#{minute}am")) do
        messages_returned << message.get
      end
    end
    expect(messages_returned).to include *test_data['evening']
    expect(messages_returned).to include *test_data['generic']
  end

  it 'should return a generic message between 3:01am and 4:59am' do
    messages_returned = []
    10.times do
      hour = rand(1) + 3
      minute = rand(58) + 1
      Timecop.freeze(DateTime.parse("12/12/12 #{hour}:#{minute}am")) do
        messages_returned << message.get
      end
    end
    expect(messages_returned).to include *test_data['generic']
  end
end
