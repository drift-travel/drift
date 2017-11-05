describe Carto do
  describe '.apps' do
    it 'resolves to a URLMap' do
      expect(Carto.apps).to be_an_instance_of Rack::URLMap
    end
  end
end
