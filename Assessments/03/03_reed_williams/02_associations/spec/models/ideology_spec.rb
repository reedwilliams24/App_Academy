# == Schema Information
#
# Table name: ideologies
#
#  id         :integer          not null, primary key
#  name       :string
#  direction  :string
#  goal       :string
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Ideology do
  it 'is supported by parties' do
    liberalism = Ideology.find_by(name: 'Liberalism')
    democrats = Party.find_by(name: 'Democratic Party')

    expect(liberalism.parties).to eq([democrats])
  end

  it 'has subscribing senators' do
    conservatism = Ideology.find_by(name: 'Conservatism')

    expect(conservatism.subscribing_senators.pluck(:lname)).
      to match_array(%w(McCain McConnell Rubio))
  end
end
