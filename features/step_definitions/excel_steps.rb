require 'spreadsheet'

Given /^an Excel File "([^"]*)"$/ do |arg1|
  @file = Tempfile.new(arg1)
  book = Spreadsheet::Workbook.new
  book.create_worksheet
  book.write @file.path
end

