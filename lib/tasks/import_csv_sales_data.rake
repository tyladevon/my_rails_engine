require 'csv'

desc "import csv sales data"
namespace :csv_sales_data do
  task :import_create_model => :environment do
    ['merchants', 'items', 'customers', 'invoices', 'invoice_items', 'transactions']. each do |file|
      csv_data = File.read("csv_data/#{file}.csv")
      csv = CSV.parse(csv_data, :headers => true)
      model = file.camelize.singularize.constantize
      csv.each do |row|
        model.create!(row.to_hash)
      end
    end
  end
end
