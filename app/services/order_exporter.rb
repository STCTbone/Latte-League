    require 'stringio'
    require 'yaml'
class OrderExporter
    attr_reader :orders
    def initialize(orders)
        @orders = orders
    end

    def export_to_xls
        book = Spreadsheet::Workbook.new
        sheet1 = book.create_worksheet :name => 'Orders export'
        sheet1.row(0).concat ["Username", "Completed Time", "Total Price"]

        orders.each_with_index do |t, i|
            sheet1.row(i+1).concat([ t.user.email, t.updated_at, t.total_price])
        end

        data = StringIO.new ''
        book.write data
        send_data data.string, :type=>"application/excel", :disposition=>'attachment', :filename => "orders_export_#{l(Date.today)}.xls"
    end


end

