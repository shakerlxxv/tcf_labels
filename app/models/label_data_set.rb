class LabelDataSet < ActiveRecord::Base
  attr_accessible :name, :excel_data
  has_many :label_datum
  mount_uploader :excel_data, ExcelLoaderUploader

  # 2011 Summer COLMAP
  """
  @@COLMAP = {
    :name => 0,
    :excludes => 2,
    :size_lgf => 4,
    :size_f => 5,
    :size_s => 6,
    :option_m => 7,
    :option_k => 8,
    :option_k8 => 9,
    :option_c => 10,
    :option_c9 => 11,
    :option_h => 12,
    :option_l => 13,
    :option_m9 => 14,
    :option_b => 15,
    :option_e17 => 16,
    :option_e9 => 17,
    :option_bl => 18,
    :option_r => 19,
    :option_r9 => 20,
    :option_honey => 23,
    :option_syrup => 24,
    :delivery_text => 28}
  """
  # 2011 Fall COLMAP
  """
  @@COLMAP = {
    :basket_number => 0,
    :name => 1,
    :town => 2,
    :email => 3,
    :phone => 4,
    :newsletter => 5,
    :size_s => 6,
    :size_f => 7,
    :option_b => 8,
    :option_e => 9,
    :option_e5 => 10,
    :option_honey => 11,
    :option_syrup => 12,
    :option_cookbook => 13,
    :pickup_code => 14
  }
  """
  # 2012 Spring COLMAP
  """
  @@COLMAP = {
    :basket_number => 0,
    :name => 1
  }

  """
  @i = 0

  # 2012 Summer COLMAP
  @@COLMAP = {
    :name => 0, 
    :email => 1,
    :phone => 2,
    :newsletter_n => 3,
    :excludes => 4,
    :dummy0 => 5,
    :size_lgf => 6,
    :size_f => 7,
    :size_s => 8,
    :option_m => 9,
    :option_k => 10,
    :option_k8 => 11,
    :option_c => 12,
    :option_c9 => 13,
    :option_h => 14,
    :option_l => 15,
    :option_m9 => 16,
    :option_b => 17,
    :option_e => 18,
    :option_e9 => 19,
    :option_r => 20,
    :option_fl => 21,
    :option_bl => 22,
    :option_honey => 23,
    :option_syrup => 24,
    :dummy1 => 25,
    :delivery_text => 26}

  #-----------------------------------------------------------------------------
  # parse the data from the spreadsheet COLMAP hash into 12 fields which 
  # correspond to the tag areas
  #     f1      f2       f3
  #     f4      f5       f6
  #     f7      f8       f9
  #     f10     f11      f12
  #-----------------------------------------------------------------------------
  # 2011 Summer Tag Parse Logic
  """
    # clear existing data parses
    self.label_datum.destroy_all
    book = Spreadsheet.open(self.excel_data.current_path)
    sheet = book.worksheet 'Monday Harvest Sheet'
    sheet.each do |row|
      dtext = row[@@COLMAP[:delivery_text]]
      ntext = row[@@COLMAP[:name]]
      next unless ntext and dtext and dtext != 'Delivery_Text' and dtext != 'Monday - PU'
      new_label = self.label_datum.build
      new_label.name = row[@@COLMAP[:name]]
      new_label.field1 = dtext
      new_label.field3 = check_fields( row, :size_lgf, :size_f, :size_s )
      new_label.field5 = row[@@COLMAP[:name]]
      new_label.field9 = check_fields( row, :option_m,:option_k,:option_k8,:option_c,:option_c9,:option_h,:option_l,:option_m9,:option_b,:option_e17,:option_e9,:option_bl,:option_r,:option_r9,:option_honey,:option_syrup)
      new_label.field11 =  row[@@COLMAP[:excludes]]
      new_label.save
    end
  """
  # 2011 Fall Share Parse Logic
  """
    # clear existing data parses
    self.label_datum.destroy_all
    book = Spreadsheet.open(self.excel_data.current_path)
    sheet = book.worksheet 'Sheet1'
    sheet.each do |row|
      dtext = row[@@COLMAP[:pickup_code]]
      ntext = row[@@COLMAP[:name]]
      next unless ntext and dtext and dtext != 'Location'
      new_label = self.label_datum.build
      new_label.name = row[@@COLMAP[:name]]
      new_label.field1 = dtext
      new_label.field2 = row[@@COLMAP[:newsletter]] ? 'N' : ''
      new_label.field3 = check_fields( row, :size_f, :size_s )
      new_label.field5 = row[@@COLMAP[:name]]
      new_label.field9 = check_fields( row, :option_b,:option_e,:option_e5)
      new_label.field10 =  value(row[@@COLMAP[:basket_number]])
      new_label.save
    end
  """
  # 2012 Spring Share Logic
  """
  def parse_data
    self.label_datum.destroy_all
    book = Spreadsheet.open(self.excel_data.current_path)
    sheet = book.worksheet 'Sheet1'
    sheet.each do |row|
      ntext = row[@@COLMAP[:name]]
      next unless ntext
      new_label = self.label_datum.build
      new_label.name = row[@@COLMAP[:name]]
      new_label.field5 = row[@@COLMAP[:name]]
      new_label.field10 =  value(row[@@COLMAP[:basket_number]])
      new_label.save
    end
  end
  """

  # 2012 Summer Share Logic
  def parse_data
    puts "going to read some data now"
    # clear existing data parses
    self.label_datum.destroy_all
    book = Spreadsheet.open(self.excel_data.current_path)
    sheet = book.worksheet 'Monday Harvest Sheet'
    sheet.each do |row|
      dtext = row[@@COLMAP[:delivery_text]]
      ntext = row[@@COLMAP[:name]]
      puts " reading row #{ntext} for #{dtext}"
      #next unless ntext and dtext
      # use this line to split delivery and pickup output
      next unless ntext and dtext and dtext == 'PU Mon'
      new_label = self.label_datum.build
      new_label.name = row[@@COLMAP[:name]]
      new_label.field1 = dtext
      new_label.field3 = check_fields( row, :size_lgf, :size_f, :size_s, :newsletter_n )
      new_label.field5 = row[@@COLMAP[:name]]
      new_label.field5.strip!
      new_label.field9 = row[@@COLMAP[:excludes]]
      new_label.field12 = check_fields( row, :option_m,:option_k,:option_k8,:option_c,:option_c9,:option_h,:option_l,:option_m9,:option_b,:option_e,:option_e9,:option_r, :option_fl,:option_bl)
      new_label.save
    end
  end

  # added to handle formuals and links and stuff
  def value(cell)
    if cell.kind_of?(Fixnum) or cell.kind_of?(Float) or cell.kind_of?(String)
      cell
    else
      Integer(cell.value)
    end
  end

  def check_fields(row, *symbols)
    rvalue = ""
    symbols.each do |sym|
      # first check column data
      #puts ctext = row[@@COLMAP[sym]]
      ctext = row[@@COLMAP[sym]]
      next unless  ctext.to_i > 0
      # compute the desired label
      label = sym.to_s.split('_')[1].upcase
      if label.length > 3 then
        label = label.downcase[0..2] # trim honey, and syrup
      end
      if ctext > 1 then
        # BLS this is a hack for decimal trunc display
        rvalue += ctext.to_s.split('.')[0] + "x" + label + " "
      else
        rvalue += label + " "
      end
    end
    return rvalue
  end

end
