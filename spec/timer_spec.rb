require 'timer'

describe Timer do
  let(:geckoboard) { double :geckoboard }
  let(:weatherdata) { double :weatherdata }
  let(:timer) { Timer.new(:weatherdata, :geckoboard) }

  context 'when engaged in an infinent loop' do

    it 'can exit with a user command' do
      allow(timer).to receive(:begin_api_update_loop)
      allow(timer).to receive(:exit_command).and_return(false, true)
      timer.start_api_updates
    end

  end

end
