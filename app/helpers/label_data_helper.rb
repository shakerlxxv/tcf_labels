module LabelDataHelper
  def empty_ness(str)
    str = str.to_s
    str.nil? || str.empty? ? raw('&nbsp;') : str
  end
end
