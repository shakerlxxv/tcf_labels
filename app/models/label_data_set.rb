class LabelDataSet < ActiveRecord::Base
  attr_accessible :name, :excel_data
  has_many :label_datum
  mount_uploader :excel_data, ExcelLoaderUploader

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

  def parse_data
    # clear existing data parses
    self.label_datum.destroy_all
    book = Spreadsheet.open(self.excel_data.current_path)
    sheet = book.worksheet 'Wednesday Harvest Sheet'
    sheet.each do |row|
      dtext = row[@@COLMAP[:delivery_text]]
      ntext = row[@@COLMAP[:name]]
      next unless ntext and dtext and dtext != 'Delivery_Text' and dtext == 'Wed - PU'
      new_label = self.label_datum.build
      new_label.name = row[@@COLMAP[:name]]
      new_label.field1 = dtext
      new_label.field3 = check_fields( row, :size_lgf, :size_f, :size_s )
      new_label.field5 = row[@@COLMAP[:name]]
      new_label.field9 = check_fields( row, :option_m,:option_k,:option_k8,:option_c,:option_c9,:option_h,:option_l,:option_m9,:option_b,:option_e17,:option_e9,:option_bl,:option_r,:option_r9,:option_honey,:option_syrup)
      new_label.field11 =  row[@@COLMAP[:excludes]]
      new_label.save
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
        label = label.downcase
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