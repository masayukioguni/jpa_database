require 'rails_helper'

RSpec.describe LiftersController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/lifters').to route_to('lifters#index')
    end

    it 'routes to #show' do
      expect(get: '/lifters/1').to route_to('lifters#show', id: '1')
    end

  end
end
