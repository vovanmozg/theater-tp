describe Events::Services::Add do
  let(:event) { instance_double(Event, save: true, persisted?: true) }
  let(:params) { { title: 'Hello' } }
  let(:result) { described_class.new(params).call }

  before do
    allow(Event).to receive(:new).and_return(event)
  end

  it 'calls save' do
    expect(result).to have_received(:save)
  end

  it 'returns persisted event' do
    expect(result).to be_persisted
  end

  context 'when event was not saved' do
    let(:event) { instance_double(Event, save: false, persisted?: false) }

    it 'returns not persisted event' do
      expect(result).not_to be_persisted
    end
  end
end
