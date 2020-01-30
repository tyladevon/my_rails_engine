require 'rails_helper'

describe 'Items record endpoints' do 
    it 'can see a list of items' do
        create_list(:item, 5)

        get '/api/v1/items'

        expect(response).to be_successful

        items = JSON.parse(response.body, symbolize_names: true)
        
        expect(items[:data].count).to eq(5)
    end 
    it 'can see one item by id' do
        item = create(:item)
        
        get "/api/v1/items/#{item.id}"
        
        expect(response).to be_successful
        
        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][0][:attributes][:name]).to eq("#{item.name}")
    end 
    it 'can find a single items by request params' do
        item_1 = create(:item)
        item_2 = create(:item)

        get "/api/v1/items/find?name=#{item_1.name}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data][0][:id]).to eq("#{item_1.id}")

        expect(raw_info[:data][0][:attributes][:name]).to eq("#{item_1.name}")
    end 

    it 'can find all items by request params' do
       
        time = ("2020-01-27 10:53:59 UTC")

        time_2 = ("2020-01-25 10:53:59 UTC")

        item_1 = create(:item, created_at: time)
        item_2 = create(:item, created_at: time)
        # item_3 = create(:item, created_at: time_2)

        get "/api/v1/items/find_all?created_at=#{time}"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)

        expect(raw_info[:data].count).to eq(2)
    end 
    it 'can return a random items' do
        item_1 = create(:item)
        item_2 = create(:item)
        item_3 = create(:item)

        get "/api/v1/items/random"

        expect(response).to be_successful

        raw_info = JSON.parse(response.body, symbolize_names: true)
        
        expect(raw_info[:data][0][:attributes]).to_not be_empty
    end 
end 