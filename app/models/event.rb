class Event < ActiveRecord::Base
    has_many :guests, dependent: :destroy
    
    require 'roo'
    def self.import(file)
      workbook = Roo::Spreadsheet.open(file)
      worksheets = workbook.sheets
      
      worksheets.each do |worksheet|
        # parse worksheet: each worksheet includes all customer info of one event on one day
        first_cell = workbook.cell(1,1).split("-")
        title = first_cell[0][0..-2]
        date = first_cell[1][1..-1]
        
        # read the xlsx file -> process the customer info into one string object box_office_customers
        box_office_customers = []
        workbook.sheet(worksheet).each_row_streaming(pad_cells: true) do |row|
          box_office_customers.append(row.map{ |cell| cell.value if cell}.join('#cell#'))
        end
        puts(box_office_customers.inspect)
        box_office_customers = box_office_customers[1..-3]
        total_seats_box_office = box_office_customers.count() - 1
        box_office_customers = box_office_customers.join('#row#')
        
        # preset some variables (needs to be updated)
        total_seats = 500
        total_seats_guest = 0
        balance = total_seats - total_seats_box_office - total_seats_guest
        Event.create!({:title => title, :date => date, :total_seats => total_seats, :box_office_customers => box_office_customers, :total_seats_box_office => total_seats_box_office, :total_seats_guest => 0, :balance => balance})
      end
    end
end
