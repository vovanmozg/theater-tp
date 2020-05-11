RSpec.describe Event, type: :model do
  subject { described_class.new(params) }

  let(:event) { build(:event) }
  let(:params) { { title: title, date_start: date_start, date_end: date_end } }
  let(:title) { event.title }
  let(:date_start) { event.date_start }
  let(:date_end) { event.date_end }

  context 'when date_start < date_end' do
    it { is_expected.to be_valid }
  end

  context 'when date_start = date_end' do
    let(:date_end) { date_start }

    it { is_expected.to be_valid }
  end

  context 'when date_start > date_end' do
    let(:date_end) { date_start - 2.days }

    it { is_expected.not_to be_valid }
  end

  context 'when does not exist events with intersecting date range' do
    it 'validates' do
      allow_any_instance_of(Events::Services::IntersectingDates).to receive(:call).and_return([])
      is_expected.to be_valid
    end
  end

  context 'when exist events with intersecting date range' do
    it 'does not validates' do
      allow_any_instance_of(Events::Services::IntersectingDates).to receive(:call).and_return([Date.today])
      is_expected.not_to be_valid
    end
  end
end
